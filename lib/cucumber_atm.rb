class Account
  def credit(amount)
    @balance = amount
  end

  def balance
    @balance
  end

  def debit(amount)
    @balance -= amount
  end
end

class Teller
  attr_accessor :message

  def initialize(cash_slot)
    @cash_slot = cash_slot
  end

  def withdraw_from(account, amount_requested)
    if account.balance >= amount_requested
      account.debit(amount_requested)
      @cash_slot.dispense(amount_requested)
      @message = "Success!"
    else
      @cash_slot.dispense(0)
      @message = "Sorry! You have insufficient funds."
    end
  end
end

class CashSlot
  def contents
    @contents || raise("I'm empty!")
  end

  def dispense(amount)
    @contents = amount
  end
end

require 'sinatra'

get '/' do
  erb :index
end

set :cash_slot, CashSlot.new
set :account do
  fail 'account has not been set'
end

post '/withdraw' do
  teller = Teller.new(settings.cash_slot)
  teller.withdraw_from(settings.account, params[:amount].to_i)
  @message = teller.message
  erb :index
end
