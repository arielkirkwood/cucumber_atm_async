When(/^I withdraw (#{CAPTURE_CASH_AMOUNT})$/) do |amount|
  teller.withdraw_from(my_account, amount)
end

When(/^I check my balance$/) do
  teller.check_balance(my_account)
end

Then(/^I should be told that I have insufficient funds in my account$/) do
  page.should have_content("Sorry! You have insufficient funds.")
end

Then(/^I should see that my balance is (#{CAPTURE_CASH_AMOUNT})$/) do |balance|
  page.should have_content(balance)
end
