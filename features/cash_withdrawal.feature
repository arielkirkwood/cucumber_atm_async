Feature: Cash Withdrawal

  Scenario Outline: Successful withdrawal of $20 from an account in credit
    Given my account has been credited with $<amount_credited>
    When I withdraw $<amount_withdrawn>
    Then $<amount_dispensed> should be dispensed
      And the balance of my account should be $<remaining_balance>

    Examples:
      | amount_credited | amount_withdrawn | amount_dispensed | remaining_balance |
      | 100 | 20 | 20 | 80 |
      | 100 | 60 | 60 | 40 |
      | 100 | 100 | 100 | 0 |
