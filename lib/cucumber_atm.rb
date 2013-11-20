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
  def initialize(cash_slot)
    @cash_slot = cash_slot
  end

  def withdraw_from(account, amount)
    account.debit(amount)
    @cash_slot.dispense(amount)
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
  %{
  <html>
    <body>
      <form action="/withdraw" method="post">
        <label for="amount">Amount</label>
        <input type="hidden" id="amount" name="amount" value="20">
        <button type="submit">$20</button>
      </form>
      <form action="/withdraw" method="post">
        <label for="amount">Amount</label>
        <input type="hidden" id="amount" name="amount" value="40">
        <button type="submit">$40</button>
      </form>
      <form action="/withdraw" method="post">
        <label for="amount">Amount</label>
        <input type="hidden" id="amount" name="amount" value="60">
        <button type="submit">$60</button>
      </form>
      <form action="/withdraw" method="post">
        <label for="amount">Amount</label>
        <input type="hidden" id="amount" name="amount" value="80">
        <button type="submit">$80</button>
      </form>
      <form action="/withdraw" method="post">
        <label for="amount">Amount</label>
        <input type="hidden" id="amount" name="amount" value="100">
        <button type="submit">$100</button>
      </form>
      <form action="/withdraw" method="post">
        <label for="amount">Amount</label>
        <input type="hidden" id="amount" name="amount" value="200">
        <button type="submit">$200</button>
      </form>
    </body>
  </html>
  }
end

set :cash_slot, CashSlot.new
set :account do
  fail 'account has not been set'
end

post '/withdraw' do
  teller = Teller.new(settings.cash_slot)
  teller.withdraw_from(settings.account, params[:amount].to_i)
end
