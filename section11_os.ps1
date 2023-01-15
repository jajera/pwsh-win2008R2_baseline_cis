describe `
  -control "11.1 (L1) Ensure 'Accounts: camadmin account status' is set to 'Enabled'" `
  -item "camadmin user_enabled" `
  -current_value (Get-User -User 'camadmin').Enabled `
  -expected_value $true

describe `
  -control "11.2 (L1) Ensure 'Accounts: camguest account status' is set to 'Disabled'" `
  -item "camguest user_enabled" `
  -current_value (Get-User -User 'camguest').Enabled `
  -expected_value $false

describe_dual_duo_all `
  -control "11.3 (-) Set the Turn on Script Execution to enabled and execution policy to 'Allow Local scripts and remote signed scripts'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PowerShell\ExecutionPolicy key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PowerShell' -Key 'ExecutionPolicy').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PowerShell\ExecutionPolicy value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PowerShell' -Key 'ExecutionPolicy').Value `
  -expected_value2 "RemoteSigned"

describe_dual_duo_all `
  -control "11.4 (L1) Ensure 'Disable Autorun for all drives' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDriveTypeAutoRun key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Key 'NoDriveTypeAutoRun').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDriveTypeAutoRun value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Key 'NoDriveTypeAutoRun').Value `
  -expected_value2 255

describe_dual_duo_all `
  -control "11.5 (L1) Ensure 'Prohibit installation and configuration of Network Bridge on your DNS domain network' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections\NC_AllowNetBridge_NLA key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections' -Key 'NC_AllowNetBridge_NLA').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections\NC_AllowNetBridge_NLA value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections' -Key 'NC_AllowNetBridge_NLA').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "11.6 (L1) Ensure 'Prohibit use of Internet Connection Sharing on your DNS domain network' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections\NC_ShowSharedAccessUI key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections' -Key 'NC_ShowSharedAccessUI').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections\NC_ShowSharedAccessUI value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Network Connections' -Key 'NC_ShowSharedAccessUI').Value `
  -expected_value2 0


describe_dual_duo_all `
  -control "11.7 (L1) Ensure 'Configure Offer Remote Assistance' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\policies\Microsoft\Windows NT\Terminal Services\fAllowUnsolicited key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\policies\Microsoft\Windows NT\Terminal Services' -Key 'fAllowUnsolicited').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\policies\Microsoft\Windows NT\Terminal Services\fAllowUnsolicited value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\policies\Microsoft\Windows NT\Terminal Services' -Key 'fAllowUnsolicited').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "11.8 (-) Set unidentified networks to get the Private Profile" `
  -item1 "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\NetworkList\Signatures\010103000F0000F0010000000F0000F0C967A3643C3AD745950DA7859209176EF5B87C875FA20DF21951640E807D7C24\Category key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\NetworkList\Signatures\010103000F0000F0010000000F0000F0C967A3643C3AD745950DA7859209176EF5B87C875FA20DF21951640E807D7C24' -Key 'Category').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\NetworkList\Signatures\010103000F0000F0010000000F0000F0C967A3643C3AD745950DA7859209176EF5B87C875FA20DF21951640E807D7C24\Category value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\NetworkList\Signatures\010103000F0000F0010000000F0000F0C967A3643C3AD745950DA7859209176EF5B87C875FA20DF21951640E807D7C24' -Key 'Category').Value `
  -expected_value2 1
