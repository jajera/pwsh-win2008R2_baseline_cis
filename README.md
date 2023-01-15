# pwsh-win2008R2_baseline_cis

# Description:
This is a customized implementation CIS baseline using PowerShell.

# Requirements:
The user account that runs this must have an an administrator rights to run the scripts.

# How to use:
To run all checks:
```sh
.\main.ps1
```

To run specific check:
```sh
.\section1_os.ps1
```

# Sample output:
| Hostname | Control Item | Expected_Value | Current_Value | Status |
| dcw01	| 1.1 (L1) Ensure 'Account lockout threshold' is set to '10 invalid logon attempt(s) | LockoutBadCount is equal '5' | 5 | 0 | fail |
| dcw01	| 1.2 (L1) Ensure 'Account lockout duration' is set to '30 minute(s)' | LockoutDuration is equal '30' | 30 | fail |
| dcw01	| 1.3 (L1) Ensure 'Reset account lockout counter after' is set to '30 minute(s)' | ResetLockoutCount is equal '30' | 30 | fail |
| dcw01	| 1.4 (L1) Ensure 'Minimum password length' is set to '14 character(s)'	MinimumPasswordLength is equal '14' | 14 | 7 | fail |
| dcw01	| 1.5 (L1) Ensure 'Enforce password history' is set to '12'	PasswordHistorySize is equal '12' | 12 | 24 | fail |
...