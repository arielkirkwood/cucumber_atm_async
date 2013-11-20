When(/^I withdraw (#{CAPTURE_CASH_AMOUNT})$/) do |amount|
  teller.withdraw_from(my_account, amount)
end

Then(/^I should be told that I have insufficient funds in my account$/) do
  pending # express the regexp above with the code you wish you had
end
