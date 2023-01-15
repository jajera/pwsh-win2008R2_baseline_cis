describe_dual_duo_one `
  -control "7.1 (L1) Ensure 'Security: maximum log size' is set to '196608'" `
  -item1a "Security Event Log Enabled" `
  -current_value1a (Get-EventLogSizeInfo -DisplayName 'Security').Exist `
  -expected_value1a $true `
  -item2a "'Security: maximum log size' is set to '196608'" `
  -current_value2a (Get-EventLogSizeInfo -DisplayName 'Security').MaximumKilobytes `
  -expected_value2a 196608 `
  -item1b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Security\MaxSize key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Security' -Key 'MaxSize').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Security\MaxSize value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Security' -Key 'MaxSize').Value `
  -expected_value2b 196608

describe_dual_duo_one `
  -control "7.2 (L1) Ensure 'System: maximum log size' is set to '32768'" `
  -item1a "System Event Log Enabled" `
  -current_value1a (Get-EventLogSizeInfo -DisplayName 'System').Exist `
  -expected_value1a $true `
  -item2a "'System: maximum log size' is set to '32768'" `
  -current_value2a (Get-EventLogSizeInfo -DisplayName 'System').MaximumKilobytes `
  -expected_value2a 32768 `
  -item1b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\System\MaxSize key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\System' -Key 'MaxSize').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\System\MaxSize value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\System' -Key 'MaxSize').Value `
  -expected_value2b 32768

describe_dual_duo_one `
  -control "7.3 (L1) Ensure 'Application: maximum log size' is set to '32768'" `
  -item1a "Application: event log enabled" `
  -current_value1a (Get-EventLogSizeInfo -DisplayName 'Application').Exist `
  -expected_value1a $true `
  -item2a "'Application: maximum log size' is set to '32768'" `
  -current_value2a (Get-EventLogSizeInfo -DisplayName 'Application').MaximumKilobytes `
  -expected_value2a 32768 `
  -item1b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Application\MaxSize key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Application' -Key 'MaxSize').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Application\MaxSize value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Application' -Key 'MaxSize').Value `
  -expected_value2b 32768

describe_dual_duo_one `
  -control "7.4 (L1) Ensure 'Security: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'" `
  -item1a "Security: event log enabled" `
  -current_value1a (Get-EventLogSizeInfo -DisplayName 'Security').Exist `
  -expected_value1a $true `
  -item2a "Security: event log retention days" `
  -current_value2a (Get-EventLogSizeInfo -DisplayName 'Security').MinimumRetentionDays `
  -expected_value2a 0 `
  -item1b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Security\Retention key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Security' -Key 'Retention').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Security\Retention value" ` `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Security' -Key 'Retention').Value `
  -expected_value2b 0

describe_dual_duo_one `
  -control "7.5 (L1) Ensure 'System: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'" `
  -item1a "System: event log enabled" `
  -current_value1a (Get-EventLogSizeInfo -DisplayName 'System').Exist `
  -expected_value1a $true `
  -item2a "System: event log retention days" `
  -current_value2a (Get-EventLogSizeInfo -DisplayName 'System').MinimumRetentionDays `
  -expected_value2a 0 `
  -item1b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\System\Retention key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\System' -Key 'Retention').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\System\Retention value" ` `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\System' -Key 'Retention').Value `
  -expected_value2b 0

describe_dual_duo_one `
  -control "7.6 (L1) Ensure 'Application: Control Event Log behavior when the log file reaches its maximum size' is set to 'Disabled'" `
  -item1a "Application: event log enabled" `
  -current_value1a (Get-EventLogSizeInfo -DisplayName 'Application').Exist `
  -expected_value1a $true `
  -item2a "Application: event log retention days" `
  -current_value2a (Get-EventLogSizeInfo -DisplayName 'Application').MinimumRetentionDays `
  -expected_value2a 0 `
  -item1b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Application\Retention key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Application' -Key 'Retention').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Application\Retention value" ` `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Application' -Key 'Retention').Value `
  -expected_value2b 0

