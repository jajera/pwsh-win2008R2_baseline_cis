# describe `
#   -control "12.1 - Major Service Pack and Hotfix Requirements - Server2008" `
#   -item "Latest KB installed" `
#   -current_value (-not($null -eq (get-hotfix -Id KB4571729))) `
#   -expected_value $true

describe `
  -control "12.2 Hotfixes recognized by MBSA (Microsoft Baseline Security Analyzer)" `
  -item "Applicable only for Windows 2012" `
  -current_value "" `
  -expected_value "" `
  -only_if $false

describe `
  -control "12.3 - Ensure that volumes are using the NTFS file system" `
  -item "No drive with FAT file system" `
  -current_value (-not([System.IO.DriveInfo]::GetDrives().DriveFormat -contains 'FAT')) `
  -expected_value $true

describe_dual_duo_one `
  -control "12.4 - Ensure that windows firewall are enabled - Public" `
  -item1a "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\EnableFirewall key_exist" `
  -current_value1a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile' -Key 'EnableFirewall').KeyExist `
  -expected_value1a $true `
  -item2a "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\EnableFirewall value" `
  -current_value2a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile' -Key 'EnableFirewall').Value `
  -expected_value2a 1 `
  -item1b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\EnableFirewall key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile' -Key 'EnableFirewall').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\EnableFirewall value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile' -Key 'EnableFirewall').Value `
  -expected_value2b 1 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist

describe_dual_duo_one `
  -control "12.4 - Ensure that windows firewall are enabled - Private" `
  -item1a "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\EnableFirewall key_exist" `
  -current_value1a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Key 'EnableFirewall').KeyExist `
  -expected_value1a $true `
  -item2a "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\EnableFirewall value" `
  -current_value2a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Key 'EnableFirewall').Value `
  -expected_value2a 1 `
  -item1b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\EnableFirewall key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile' -Key 'EnableFirewall').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\EnableFirewall value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile' -Key 'EnableFirewall').Value `
  -expected_value2b 1 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist
  
describe_dual_duo_one `
  -control "12.4 - Ensure that windows firewall are enabled - Domain" `
  -item1a "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\EnableFirewall key_exist" `
  -current_value1a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile' -Key 'EnableFirewall').KeyExist `
  -expected_value1a $true `
  -item2a "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\EnableFirewall value" `
  -current_value2a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile' -Key 'EnableFirewall').Value `
  -expected_value2a 1 `
  -item1b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\EnableFirewall key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile' -Key 'EnableFirewall').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\EnableFirewall value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile' -Key 'EnableFirewall').Value `
  -expected_value2b 1 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist

describe `
  -control "12.5 Restricted Groups - Ensure Remote Desktop Users membership only has 'Remote Desktop Users'" `
  -item "Its membership only contains Remote Desktop Users" `
  -current_value ((Get-LocalGroupMembers -Group 'Remote Desktop Users') -join ',') `
  -expected_value '*Remote Desktop Users*' `
  -opr '-like'

describe `
  -control "12.6 - Ensure that Antivirus software is present" `
  -item "Applicable only for Windows 2012" `
  -current_value "" `
  -expected_value "" `
  -only_if $false

describe `
  -control "12.7 HIPS software is present" `
  -item "Applicable only for Windows 2012" `
  -current_value "" `
  -expected_value "" `
  -only_if $false

describe_dual_trio_all `
  -control "12.8 - Remove any unused/unnecessary protocols" `
  -item1 "Should not have AppleTalk/DLC installed" `
  -current_value1 (netstat -an | findstr ':201 :202 :203 :204 :205') `
  -expected_value1 $null `
  -item2 "Should not have Wireshark/Netmon installed" `
  -current_value2 (Get-ItemProperty HKLM:\\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | `
    Select-Object DisplayName | Where-Object {$_.DisplayName -like '*asp1*' -or $_.DisplayName -like '*vcpp1*'}) `
  -expected_value2 $null `
  -item3 "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Winsock\Setup Migration\Providers\RMCAST key_exist" `
  -current_value3 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Winsock\Setup Migration\Providers\RMCAST' -Key '').PathExist `
  -expected_value3 $false
