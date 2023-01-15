describe `
  -control "1.1 (L1) Ensure 'Account lockout threshold' is set to '10 invalid logon attempt(s)" `
  -item "LockoutBadCount" `
  -current_value (Get-SecurityPolicy 'LockoutBadCount') `
  -expected_value 5

describe `
  -control "1.2 (L1) Ensure 'Account lockout duration' is set to '30 minute(s)'" `
  -item "LockoutDuration" `
  -current_value (Get-SecurityPolicy 'LockoutDuration') `
  -expected_value 30

describe `
  -control "1.3 (L1) Ensure 'Reset account lockout counter after' is set to '30 minute(s)'" `
  -item "ResetLockoutCount" `
  -current_value (Get-SecurityPolicy 'ResetLockoutCount') `
  -expected_value 30

describe `
  -control "1.4 (L1) Ensure 'Minimum password length' is set to '14 character(s)'" `
  -item "MinimumPasswordLength" `
  -current_value (Get-SecurityPolicy 'MinimumPasswordLength') `
  -expected_value 14

describe `
  -control "1.5 (L1) Ensure 'Enforce password history' is set to '12'" `
  -item "PasswordHistorySize" `
  -current_value (Get-SecurityPolicy 'PasswordHistorySize') `
  -expected_value 12

describe `
  -control "1.6 (L1) Ensure 'Password must meet complexity requirements' is set to 'Enabled'" `
  -item "PasswordComplexity" `
  -current_value (Get-SecurityPolicy 'PasswordComplexity') `
  -expected_value 1

describe `
  -control "1.7 (L1) Ensure 'Store passwords using reversible encryption' is set to 'Disabled'" `
  -item "ClearTextPassword" `
  -current_value (Get-SecurityPolicy 'ClearTextPassword') `
  -expected_value 0

describe `
  -control "1.8 (L1) Ensure 'Minimum password age' is set to '2 day'" `
  -item "MinimumPasswordAge" `
  -current_value (Get-SecurityPolicy 'MinimumPasswordAge') `
  -expected_value 2

describe `
  -control "1.9 (L1) Ensure 'Maximum password age' is set to '42 days'" `
  -item "MaximumPasswordAge " `
  -current_value (Get-SecurityPolicy 'MaximumPasswordAge') `
  -expected_value 42
