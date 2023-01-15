describe_dual_duo_one `
  -control "5.1 (L1) Ensure 'Windows Firewall: Public: Inbound connections' is set to 'NotConfigured'" `
  -item1a "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\DefaultInboundAction key_exist" `
  -current_value1a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile' -Key 'DefaultInboundAction').KeyExist `
  -expected_value1a $false `
  -item2a "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\DefaultInboundAction value" `
  -current_value2a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile' -Key 'DefaultInboundAction').Value `
  -expected_value2a 1 `
  -item1b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\DefaultInboundAction key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile' -Key 'DefaultInboundAction').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\DefaultInboundAction value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile' -Key 'DefaultInboundAction').Value `
  -expected_value2b 1 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist

describe_single_duo_one `
  -control "5.1 (L1) Ensure 'WindowsHKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\DefaultInboundAction Firewall: Public: Inbound connections' is set to 'NotConfigured'" `
  -item1 " key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile' -Key 'DefaultInboundAction').KeyExist `
  -expected_value1 $false `
  -item2 "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\DefaultInboundAction key_exist" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile' -Key 'DefaultInboundAction').KeyExist `
  -expected_value2 $false `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist
    
describe_dual_duo_one `
  -control "5.2 (L1) Ensure 'Windows Firewall: Public: Allow unicast response' is set to 'No'" `
  -item1a "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\DisableUnicastResponsesToMulticastBroadcast key_exist" `
  -current_value1a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile' -Key 'DisableUnicastResponsesToMulticastBroadcast').KeyExist `
  -expected_value1a $true `
  -item2a "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\DisableUnicastResponsesToMulticastBroadcast value" `
  -current_value2a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile' -Key 'DisableUnicastResponsesToMulticastBroadcast').Value `
  -expected_value2a 1 `
  -item1b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\DisableUnicastResponsesToMulticastBroadcast key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile' -Key 'DisableUnicastResponsesToMulticastBroadcast').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\DisableUnicastResponsesToMulticastBroadcast value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile' -Key 'DisableUnicastResponsesToMulticastBroadcast').Value `
  -expected_value2b 1 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist

describe_dual_trio_one `
  -control "5.3 (L1) Ensure 'Windows Firewall: Public: Settings: Apply local connection security rules' is set to 'Yes (default)'" `
  -item1a "'Public' Firewall Service 'Enabled'" `
  -current_value1a (Get-NetFirewallInfo -ProfileName 'Public').Enabled `
  -expected_value1a $true `
  -item2a "'Public' Firewall Service 'AllowLocalIPsecRules'" `
  -current_value2a (Get-NetFirewallInfo -ProfileName 'Public').AllowLocalIPsecRules `
  -expected_value2a 'NotConfigured' `
  -item1b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\AllowLocalIPsecPolicyMerge key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile' -Key 'AllowLocalIPsecPolicyMerge').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\AllowLocalIPsecPolicyMerge value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile' -Key 'AllowLocalIPsecPolicyMerge').Value `
  -expected_value2b 1 `
  -item1c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\AllowLocalIPsecPolicyMerge key_exist" `
  -current_value1c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile' -Key 'AllowLocalIPsecPolicyMerge').KeyExist `
  -expected_value1c $true `
  -item2c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\AllowLocalIPsecPolicyMerge value" `
  -current_value2c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile' -Key 'AllowLocalIPsecPolicyMerge').Value `
  -expected_value2c 1 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist

describe_dual_trio_one `
  -control "5.4 (L1) Ensure 'Windows Firewall: Public: Settings: Apply local firewall rules' is set to 'Yes (default)'" `
  -item1a "'Public' Firewall Service 'Enabled'" `
  -current_value1a (Get-NetFirewallInfo -ProfileName 'Public').Enabled `
  -expected_value1a $true `
  -item2a "'Public' Firewall Service 'AllowLocalFirewallRules'" `
  -current_value2a (Get-NetFirewallInfo -ProfileName 'Public').AllowLocalFirewallRules `
  -expected_value2a 'NotConfigured' `
  -item1b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\AllowLocalIPsecPolicyMerge key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile' -Key 'AllowLocalIPsecPolicyMerge').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\AllowLocalIPsecPolicyMerge value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile' -Key 'AllowLocalIPsecPolicyMerge').Value `
  -expected_value2b 1 `
  -item1c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\AllowLocalPolicyMerge key_exist" `
  -current_value1c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile' -Key 'AllowLocalPolicyMerge').KeyExist `
  -expected_value1c $true `
  -item2c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\AllowLocalPolicyMerge value" `
  -current_value2c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile' -Key 'AllowLocalPolicyMerge').Value `
  -expected_value2c 1 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist

describe_dual_duo_one `
  -control "5.5 (L1) Ensure 'Windows Firewall: Public: Settings: Display a notification' is set to 'Yes'" `
  -item1a "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\DisableNotifications key_exist" `
  -current_value1a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile' -Key 'DisableNotifications').KeyExist `
  -expected_value1a $true `
  -item2a "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\DisableNotifications value" `
  -current_value2a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile' -Key 'DisableNotifications').Value `
  -expected_value2a 0 `
  -item1b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\DisableNotifications key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile' -Key 'DisableNotifications').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\DisableNotifications value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile' -Key 'DisableNotifications').Value `
  -expected_value2b 0 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist

describe_dual_duo_one `
  -control "5.6 (L1) Ensure 'Windows Firewall: Public: Firewall state' is set to 'On'" `
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

describe_dual_trio_one `
  -control "5.7 (L1) Ensure 'Windows Firewall: Public: Outbound connections' is set to 'Allow (default)'" `
  -item1a "'Public' Firewall Service 'Enabled'" `
  -current_value1a (Get-NetFirewallInfo -ProfileName 'Public').Enabled `
  -expected_value1a $true `
  -item2a "'Public' Firewall Service 'DefaultOutboundAction'" `
  -current_value2a (Get-NetFirewallInfo -ProfileName 'Public').DefaultOutboundAction `
  -expected_value2a 'NotConfigured' `
  -item1b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\DefaultOutboundAction key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile' -Key 'DefaultOutboundAction').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile\DefaultOutboundAction value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PublicProfile' -Key 'DefaultOutboundAction').Value `
  -expected_value2b 0 `
  -item1c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\DefaultOutboundAction key_exist" `
  -current_value1c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile' -Key 'DefaultOutboundAction').KeyExist `
  -expected_value1c $true `
  -item2c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile\DefaultOutboundAction value" `
  -current_value2c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile' -Key 'DefaultOutboundAction').Value `
  -expected_value2c 0 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist

describe_dual_trio_one `
  -control "5.8 (L1) Ensure 'Windows Firewall: Private: Inbound connections' is set to 'Block (default)'" `
  -item1a "'Private' Firewall Service 'Enabled'" `
  -current_value1a (Get-NetFirewallInfo -ProfileName 'Private').Enabled `
  -expected_value1a $true `
  -item2a "'Private' Firewall Service 'DefaultInboundAction'" `
  -current_value2a (Get-NetFirewallInfo -ProfileName 'Private').DefaultInboundAction `
  -expected_value2a 'NotConfigured' `
  -item1b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\DefaultInboundAction key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Key 'DefaultInboundAction').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\DefaultInboundAction value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Key 'DefaultInboundAction').Value `
  -expected_value2b 0 `
  -item1c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\DefaultInboundAction key_exist" `
  -current_value1c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile' -Key 'DefaultInboundAction').KeyExist `
  -expected_value1c $true `
  -item2c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\DefaultInboundAction value" `
  -current_value2c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile' -Key 'DefaultInboundAction').Value `
  -expected_value2c 0 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist

describe_dual_duo_one `
  -control "5.9 (L1) Ensure 'Windows Firewall: Private: Allow unicast response' is set to 'No'" `
  -item1a "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\DisableUnicastResponsesToMulticastBroadcast key_exist" `
  -current_value1a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Key 'DisableUnicastResponsesToMulticastBroadcast').KeyExist `
  -expected_value1a $true `
  -item2a "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\DisableUnicastResponsesToMulticastBroadcast value" `
  -current_value2a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Key 'DisableUnicastResponsesToMulticastBroadcast').Value `
  -expected_value2a 1 `
  -item1b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\DisableUnicastResponsesToMulticastBroadcast key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile' -Key 'DisableUnicastResponsesToMulticastBroadcast').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\DisableUnicastResponsesToMulticastBroadcast value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile' -Key 'DisableUnicastResponsesToMulticastBroadcast').Value `
  -expected_value2b 1 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist

describe_dual_trio_one `
  -control "5.10 (L1) Ensure 'Windows Firewall: Private: Settings: Apply local connection security rules' is set to 'Yes (default)'" `
  -item1a "'Private' Firewall Service 'Enabled'" `
  -current_value1a (Get-NetFirewallInfo -ProfileName 'Private').Enabled `
  -expected_value1a $true `
  -item2a "'Private' Firewall Service 'AllowLocalIPsecRules'" `
  -current_value2a (Get-NetFirewallInfo -ProfileName 'Private').AllowLocalIPsecRules `
  -expected_value2a 'NotConfigured' `
  -item1b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\AllowLocalIPsecPolicyMerge key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Key 'AllowLocalIPsecPolicyMerge').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\AllowLocalIPsecPolicyMerge value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Key 'AllowLocalIPsecPolicyMerge').Value `
  -expected_value2b 1 `
  -item1c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\AllowLocalIPsecPolicyMerge key_exist" `
  -current_value1c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile' -Key 'AllowLocalIPsecPolicyMerge').KeyExist `
  -expected_value1c $true `
  -item2c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\AllowLocalIPsecPolicyMerge value" `
  -current_value2c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile' -Key 'AllowLocalIPsecPolicyMerge').Value `
  -expected_value2c 1 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist

describe_dual_trio_one `
  -control "5.11 (L1) Ensure 'Windows Firewall: Private: Settings: Apply local firewall rules' is set to 'Yes (default)'" `
  -item1a "'Private' Firewall Service 'Enabled'" `
  -current_value1a (Get-NetFirewallInfo -ProfileName 'Private').Enabled `
  -expected_value1a $true `
  -item2a "'Private' Firewall Service 'AllowLocalFirewallRules'" `
  -current_value2a (Get-NetFirewallInfo -ProfileName 'Private').AllowLocalFirewallRules `
  -expected_value2a 'NotConfigured' `
  -item1b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\AllowLocalPolicyMerge key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Key 'AllowLocalPolicyMerge').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\AllowLocalPolicyMerge value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Key 'AllowLocalPolicyMerge').Value `
  -expected_value2b 1 `
  -item1c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\AllowLocalPolicyMerge key_exist" `
  -current_value1c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile' -Key 'AllowLocalPolicyMerge').KeyExist `
  -expected_value1c $true `
  -item2c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\AllowLocalPolicyMerge value" `
  -current_value2c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile' -Key 'AllowLocalPolicyMerge').Value `
  -expected_value2c 1 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist

describe_dual_duo_one `
  -control "5.12 (L1) Ensure 'Windows Firewall: Private: Settings: Display a notification' is set to 'Yes (default)'" `
  -item1a "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\DisableNotifications key_exist" `
  -current_value1a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Key 'DisableNotifications').KeyExist `
  -expected_value1a $true `
  -item2a "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\DisableNotifications value" `
  -current_value2a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Key 'DisableNotifications').Value `
  -expected_value2a 0 `
  -item1b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\DisableNotifications key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile' -Key 'DisableNotifications').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\DisableNotifications value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile' -Key 'DisableNotifications').Value `
  -expected_value2b 0 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist

describe_dual_duo_one `
  -control "5.13 (L1) Ensure 'Windows Firewall: Private: Firewall state' is set to 'On'" `
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

describe_dual_trio_one `
  -control "5.14 (L1) Ensure 'Windows Firewall: Private: Outbound connections' is set to 'Allow (default)'" `
  -item1a "'Private' Firewall Service 'Enabled'" `
  -current_value1a (Get-NetFirewallInfo -ProfileName 'Private').Enabled `
  -expected_value1a $true `
  -item2a "'Private' Firewall Service 'DefaultOutboundAction'" `
  -current_value2a (Get-NetFirewallInfo -ProfileName 'Private').DefaultOutboundAction `
  -expected_value2a 'NotConfigured' `
  -item1b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\DefaultOutboundAction key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Key 'DefaultOutboundAction').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\DefaultOutboundAction value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Key 'DefaultOutboundAction').Value `
  -expected_value2b 0 `
  -item1c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\DefaultOutboundAction key_exist" `
  -current_value1c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile' -Key 'DefaultOutboundAction').KeyExist `
  -expected_value1c $true `
  -item2c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\DefaultOutboundAction value" `
  -current_value2c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile' -Key 'DefaultOutboundAction').Value `
  -expected_value2c 0 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist

describe_dual_trio_one `
  -control "5.15 (L1) Ensure 'Windows Firewall: Domain: Inbound connections' is set to 'Block (default)'" `
  -item1a "'Private' Firewall Service 'Enabled'" `
  -current_value1a (Get-NetFirewallInfo -ProfileName 'Private').Enabled `
  -expected_value1a $true `
  -item2a "'Private' Firewall Service 'DefaultInboundAction'" `
  -current_value2a (Get-NetFirewallInfo -ProfileName 'Private').DefaultInboundAction `
  -expected_value2a 'NotConfigured' `
  -item1b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\DefaultInboundAction key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Key 'DefaultInboundAction').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\DefaultInboundAction value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\PrivateProfile' -Key 'DefaultInboundAction').Value `
  -expected_value2b 1 `
  -item1c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\DefaultInboundAction key_exist" `
  -current_value1c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile' -Key 'DefaultInboundAction').KeyExist `
  -expected_value1c $true `
  -item2c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\DefaultInboundAction value" `
  -current_value2c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile' -Key 'DefaultInboundAction').Value `
  -expected_value2c 1 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist

describe_dual_duo_one `
  -control "5.16 (L1) Ensure 'Windows Firewall: Domain: Allow unicast response' is set to 'No'" `
  -item1a "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\DisableUnicastResponsesToMulticastBroadcast key_exist" `
  -current_value1a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile' -Key 'DisableUnicastResponsesToMulticastBroadcast').KeyExist `
  -expected_value1a $true `
  -item2a "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\DisableUnicastResponsesToMulticastBroadcast value" `
  -current_value2a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile' -Key 'DisableUnicastResponsesToMulticastBroadcast').Value `
  -expected_value2a 1 `
  -item1b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\DisableUnicastResponsesToMulticastBroadcast key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile' -Key 'DisableUnicastResponsesToMulticastBroadcast').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\DisableUnicastResponsesToMulticastBroadcast value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile' -Key 'DisableUnicastResponsesToMulticastBroadcast').Value `
  -expected_value2b 1 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist

describe_dual_trio_one `
  -control "5.17 (L1) Ensure 'Windows Firewall: Domain: Settings: Apply local connection security rules' is set to 'Yes'" `
  -item1a "'Domain' Firewall Service 'Enabled'" `
  -current_value1a (Get-NetFirewallInfo -ProfileName 'Domain').Enabled `
  -expected_value1a $true `
  -item2a "'Domain' Firewall Service 'AllowLocalIPsecRules'" `
  -current_value2a (Get-NetFirewallInfo -ProfileName 'Domain').AllowLocalIPsecRules `
  -expected_value2a 'NotConfigured' `
  -item1b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\AllowLocalIPsecPolicyMerge key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile' -Key 'AllowLocalIPsecPolicyMerge').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\AllowLocalIPsecPolicyMerge value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile' -Key 'AllowLocalIPsecPolicyMerge').Value `
  -expected_value2b 1 `
  -item1c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\AllowLocalIPsecPolicyMerge key_exist" `
  -current_value1c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile' -Key 'AllowLocalIPsecPolicyMerge').KeyExist `
  -expected_value1c $true `
  -item2c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\AllowLocalIPsecPolicyMerge value" `
  -current_value2c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile' -Key 'AllowLocalIPsecPolicyMerge').Value `
  -expected_value2c 1 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist

describe_dual_trio_one `
  -control "5.18 (L1) Ensure 'Windows Firewall: Domain: Settings: Apply local firewall rules' is set to 'Yes (default)'" `
  -item1a "'Domain' Firewall Service 'Enabled'" `
  -current_value1a (Get-NetFirewallInfo -ProfileName 'Domain').Enabled `
  -expected_value1a $true `
  -item2a "'Domain' Firewall Service 'AllowLocalFirewallRules'" `
  -current_value2a (Get-NetFirewallInfo -ProfileName 'Domain').AllowLocalFirewallRules `
  -expected_value2a 'NotConfigured' `
  -item1b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\AllowLocalPolicyMerge key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile' -Key 'AllowLocalPolicyMerge').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\AllowLocalPolicyMerge value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile' -Key 'AllowLocalPolicyMerge').Value `
  -expected_value2b 1 `
  -item1c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\AllowLocalPolicyMerge key_exist" `
  -current_value1c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile' -Key 'AllowLocalPolicyMerge').KeyExist `
  -expected_value1c $true `
  -item2c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\AllowLocalPolicyMerge value" `
  -current_value2c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile' -Key 'AllowLocalPolicyMerge').Value `
  -expected_value2c 1 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist

describe_dual_duo_one `
  -control "5.19 (L1) Ensure 'Windows Firewall: Domain: Settings: Display a notification' is set to 'Yes (default)'" `
  -item1a "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\DisableNotifications key_exist" `
  -current_value1a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile' -Key 'DisableNotifications').KeyExist `
  -expected_value1a $true `
  -item2a "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\DisableNotifications value" `
  -current_value2a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile' -Key 'DisableNotifications').Value `
  -expected_value2a 0 `
  -item1b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\DisableNotifications key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile' -Key 'DisableNotifications').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\DisableNotifications value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile' -Key 'DisableNotifications').Value `
  -expected_value2b 0 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist

describe_dual_duo_one `
  -control "5.19 (L1) Ensure 'Windows Firewall: Domain: Settings: Display a notification' is set to 'Yes (default)'" `
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

describe_dual_trio_one `
  -control "5.21 (L1) Ensure 'Windows Firewall: Domain: Outbound connections' is set to 'Allow (default)'" `
  -item1a "'Domain' Firewall Service 'Enabled'" `
  -current_value1a (Get-NetFirewallInfo -ProfileName 'Domain').Enabled `
  -expected_value1a $true `
  -item2a "'Domain' Firewall Service 'DefaultOutboundAction'" `
  -current_value2a (Get-NetFirewallInfo -ProfileName 'Domain').DefaultOutboundAction `
  -expected_value2a 'NotConfigured' `
  -item1b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\DefaultOutboundAction key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile' -Key 'DefaultOutboundAction').KeyExist `
  -expected_value1b $true `
  -item2b "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile\DefaultOutboundAction value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\DomainProfile' -Key 'DefaultOutboundAction').Value `
  -expected_value2b 1 `
  -item1c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\DefaultOutboundAction key_exist" `
  -current_value1c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile' -Key 'DefaultOutboundAction').KeyExist `
  -expected_value1c $true `
  -item2c "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile\DefaultOutboundAction value" `
  -current_value2c (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile' -Key 'DefaultOutboundAction').Value `
  -expected_value2c 1 `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist
