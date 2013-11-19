CAPTURE_CASH_AMOUNT = Transform /^\$(\d+)$/ do |whole_number|
  whole_number.to_i
end
