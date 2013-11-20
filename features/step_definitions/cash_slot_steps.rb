Then(/^(#{CAPTURE_CASH_AMOUNT}) should be dispensed$/) do |amount|
  cash_slot.contents.should == amount
end

Then(/^nothing should be dispensed$/) do
  pending # express the regexp above with the code you wish you had
end
