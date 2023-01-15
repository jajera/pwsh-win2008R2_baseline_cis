
describe_dual_duo_all `
  -control "3.1 (L1) Configure Accounts: Rename 'administrator' to 'camadmin' account" `
  -item1 "administrator user_exist" `
  -current_value1 (Get-User -User 'administrator').Exist `
  -expected_value1 $false `
  -item2 "camadmin user_exist" `
  -current_value2 (Get-User -User 'camadmin').Exist `
  -expected_value2 $true

  describe_dual_duo_all `
  -control "3.2 (L1) Configure Accounts: Rename 'guest' to 'camguest' account" `
  -item1 "guest user_exist" `
  -current_value1 (Get-User -User 'guest').Exist `
  -expected_value1 $false `
  -item2 "camguest user_exist" `
  -current_value2 (Get-User -User 'camguest').Exist `
  -expected_value2 $true

describe_dual_duo_all `
  -control "3.3 (L1) Ensure 'Accounts: Limit local account use of blank passwords to console logon only' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\LimitBlankPasswordUse key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'LimitBlankPasswordUse').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\LimitBlankPasswordUse value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'LimitBlankPasswordUse').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.4 (L1) Ensure 'Audit: Audit the access of global system objects' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\AuditBaseObjects key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'AuditBaseObjects').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\AuditBaseObjects value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'AuditBaseObjects').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.5 (L1) Ensure 'Audit: Audit the use of Backup and Restore privilege' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\FullPrivilegeAuditing key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'FullPrivilegeAuditing').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\FullPrivilegeAuditing value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'FullPrivilegeAuditing').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.6 (L1) Ensure 'Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\SCENoApplyLegacyAuditPolicy key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'SCENoApplyLegacyAuditPolicy').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\SCENoApplyLegacyAuditPolicy value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'SCENoApplyLegacyAuditPolicy').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.7 (L1) Ensure 'Audit: Shut down system immediately if unable to log security audits' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\CrashOnAuditFail key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'CrashOnAuditFail').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\CrashOnAuditFail value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'CrashOnAuditFail').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.8 (L1) Ensure 'DCOM: Machine Access Restrictions in Security Descriptor Definition Language (SDDL) syntax' Security descriptor field is empty" `
  -item1 "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\dcom\MachineAccessRestriction key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\dcom' -Key 'MachineAccessRestriction').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\dcom\MachineAccessRestriction value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\dcom' -Key 'MachineAccessRestriction').Value `
  -expected_value2 ''

describe_dual_duo_all `
  -control "3.9 (L1) Ensure 'DCOM: Machine Launch Restrictions in Security Descriptor Definition Language (SDDL) syntax' Security descriptor field is empty" `
  -item1 "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\dcom\machinelaunchrestriction key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\dcom' -Key 'machinelaunchrestriction').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\dcom\machinelaunchrestriction value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\dcom' -Key 'machinelaunchrestriction').Value `
  -expected_value2 ''

describe_dual_duo_all `
  -control "3.10 (L1) Ensure 'Devices: Allow undock without having to log on' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\UndockWithoutLogon key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'UndockWithoutLogon').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\UndockWithoutLogon value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'UndockWithoutLogon').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.11 (L1) Ensure 'Devices: Restrict CD-ROM access to locally logged-on user only' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\AllocateCDRoms key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Key 'AllocateCDRoms').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\AllocateCDRoms value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Key 'AllocateCDRoms').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.12 (L1) Ensure 'Devices: Restrict floppy access to locally logged-on user only' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Allocatefloppies key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Key 'Allocatefloppies').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Allocatefloppies value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Key 'Allocatefloppies').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.13 (L1) Ensure 'Devices: Allowed to format and eject removable media' is set to 'Administrators" `
  -item1 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\AllocateDASD key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Key 'AllocateDASD').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\AllocateDASD value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Key 'AllocateDASD').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.14 (L1) Ensure 'Devices: Prevent users from installing printer drivers' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers\AddPrinterDrivers key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers' -Key 'AddPrinterDrivers').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers\AddPrinterDrivers value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers' -Key 'AddPrinterDrivers').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.15 (L1) Ensure 'Domain controller: Allow server operators to schedule tasks' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\SubmitControl key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'SubmitControl').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\SubmitControl value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'SubmitControl').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.16 (L1) Ensure 'Domain controller: LDAP server signing requirements' is set to 'None'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NTDS\Parameters\LDAPServerIntegrity key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NTDS\Parameters' -Key 'LDAPServerIntegrity').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NTDS\Parameters\LDAPServerIntegrity value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NTDS\Parameters' -Key 'LDAPServerIntegrity').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.17 (L1) Ensure 'Domain controller: Refuse machine account password changes' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NTDS\Parameters\RefusePasswordChange key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NTDS\Parameters' -Key 'RefusePasswordChange').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NTDS\Parameters\RefusePasswordChange value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NTDS\Parameters' -Key 'RefusePasswordChange').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.18 (L1) Ensure 'Domain member: Digitally encrypt or sign secure channel data (always)' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\RequireSignOrSeal key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters' -Key 'RequireSignOrSeal').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\RequireSignOrSeal value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters' -Key 'RequireSignOrSeal').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.19 (L1) Ensure 'Domain member: Digitally encrypt secure channel data (when possible)' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\SealSecureChannel key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters' -Key 'SealSecureChannel').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\SealSecureChannel value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters' -Key 'SealSecureChannel').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.20 (L1) Ensure 'Domain member: Digitally sign secure channel data (when possible)' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\SignSecureChannel key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters' -Key 'SignSecureChannel').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\SignSecureChannel value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters' -Key 'SignSecureChannel').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.21 (L1) Ensure 'Domain member: Disable machine account password changes' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\SignSecureChannel key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters' -Key 'SignSecureChannel').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\SignSecureChannel value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters' -Key 'SignSecureChannel').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.22 (L1) Ensure 'Domain member: Maximum machine account password age' is set to '30'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\MaximumPasswordAge key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters' -Key 'MaximumPasswordAge').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\MaximumPasswordAge value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters' -Key 'MaximumPasswordAge').Value `
  -expected_value2 30

describe_dual_duo_all `
  -control "3.23 (L1) Ensure 'Domain member: Require strong (Windows 2000 or later) session key' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\RequireStrongKey key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters' -Key 'RequireStrongKey').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\RequireStrongKey value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters' -Key 'RequireStrongKey').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.24 (L1) Ensure 'Interactive logon: Display user information when the session is locked' is set to 'User display name only'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DontDisplayLockedUserID key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'DontDisplayLockedUserID').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DontDisplayLockedUserID value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'DontDisplayLockedUserID').Value `
  -expected_value2 2

describe_dual_duo_all `
  -control "3.25 (L1) Configure 'Interactive logon: Message text for users attempting to log on'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\LegalNoticeText key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'LegalNoticeText').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\LegalNoticeText value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'LegalNoticeText').Value `
  -expected_value2 'Use of this network is restricted to authorised users only.  User activity may be monitored and\/or recorded. Anyone using this network expressly consents to such monitoring and\/or recording.  BE ADVISED: if possible criminal activity is detected, these records, along with certain personal information, may be provided to law enforcement officials.\u0000'

describe_dual_duo_all `
  -control "3.26 (L1) Configure 'Interactive logon: Message title for users attempting to log on'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\LegalNoticeCaption key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'LegalNoticeCaption').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\LegalNoticeCaption value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'LegalNoticeCaption').Value `
  -expected_value2 'Authorized Users Only'

describe_dual_duo_all `
  -control "3.27 (L1) Configure 'Interactive logon: Require smart card'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\scforceoption key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'scforceoption').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\scforceoption value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'scforceoption').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.28 (L1) Ensure 'Interactive logon: Do not display last user name' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DontDisplayLastUserName key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'DontDisplayLastUserName').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DontDisplayLastUserName value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'DontDisplayLastUserName').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.29 (L1) Ensure 'Interactive logon: Do not require CTRL+ALT+DEL' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableCAD key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'DisableCAD').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableCAD value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'DisableCAD').Value `
  -expected_value2 0

describe `
  -control "3.30 (L1) Ensure 'Interactive logon: Machine inactivity limit' is set to '900'" `
  -item "Applicable only for Windows 2012" `
  -current_value "" `
  -expected_value "" `
  -only_if $false

describe_dual_duo_all `
  -control "3.31 (L2) Ensure 'Interactive logon: Number of previous logons to cache (in case domain controller is not available)' is set to '0'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\CachedLogonsCount key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon' -Key 'CachedLogonsCount').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\CachedLogonsCount value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon' -Key 'CachedLogonsCount').Value `
  -expected_value2 0
  
describe_dual_duo_all `
  -control "3.32 (L1) Ensure 'Interactive logon: Prompt user to change password before expiration' is set to '14 days'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\PasswordExpiryWarning key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon' -Key 'PasswordExpiryWarning').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\PasswordExpiryWarning value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon' -Key 'PasswordExpiryWarning').Value `
  -expected_value2 14
  
describe_dual_duo_all `
  -control "3.33 (L1) Ensure 'Interactive logon: Require Domain Controller Authentication to unlock workstation' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\ForceUnlockLogon key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon' -Key 'ForceUnlockLogon').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\ForceUnlockLogon value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon' -Key 'ForceUnlockLogon').Value `
  -expected_value2 1
  
describe_dual_duo_all `
  -control "3.34 (L1) Ensure 'Interactive logon: Smart card removal behavior' is set to 'Lock Workstation'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\ScRemoveOption key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon' -Key 'ScRemoveOption').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\ScRemoveOption value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon' -Key 'ScRemoveOption').Value `
  -expected_value2 1

describe `
  -control "3.35 (L1) Ensure 'Interactive logon: Machine account lockout threshold' is set to '10'" `
  -item "Applicable only for Windows 2012" `
  -current_value "" `
  -expected_value "" `
  -only_if $false

describe_dual_duo_all `
  -control "3.36 (L1) Ensure 'Microsoft network client: Digitally sign communications (always)' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\RequireSecuritySignature key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters' -Key 'RequireSecuritySignature').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\RequireSecuritySignature value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters' -Key 'RequireSecuritySignature').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.37 (L1) Ensure 'Microsoft network client: Digitally sign communications (if server agrees)' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\EnableSecuritySignature key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters' -Key 'EnableSecuritySignature').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\EnableSecuritySignature value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters' -Key 'EnableSecuritySignature').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.38 (L1) Ensure 'Microsoft network client: Send unencrypted password to third-party SMB servers' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\EnablePlainTextPassword key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters' -Key 'EnablePlainTextPassword').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\EnablePlainTextPassword value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkstation\Parameters' -Key 'EnablePlainTextPassword').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.39 (L1) Ensure 'Microsoft network server: Server SPN target name validation level' is set to 'Off'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\SMBServerNameHardeningLevel key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'SMBServerNameHardeningLevel').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\SMBServerNameHardeningLevel value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'SMBServerNameHardeningLevel').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.40 (L1) Ensure 'Microsoft network server: Amount of idle time required before suspending session' is set to '15'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\AutoDisconnect key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'AutoDisconnect').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\AutoDisconnect value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'AutoDisconnect').Value `
  -expected_value2 15

describe_dual_duo_all `
  -control "3.41 (L1) Ensure 'Microsoft network server: Digitally sign communications (always)' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\RequireSecuritySignature key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'RequireSecuritySignature').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\RequireSecuritySignature value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'RequireSecuritySignature').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.42 (L1) Ensure 'Microsoft network server: Digitally sign communications (if client agrees)' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\EnableSecuritySignature key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'EnableSecuritySignature').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\EnableSecuritySignature value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'EnableSecuritySignature').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.43 (L1) Ensure 'Microsoft network server: Disconnect clients when logon hours expire' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\EnableForcedLogoff key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'EnableForcedLogoff').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\EnableForcedLogoff value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'EnableForcedLogoff').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.44 (L1) Ensure 'MSS: (AutoReboot) Allow Windows to automatically restart after a system crash' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl\AutoReboot key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl' -Key 'AutoReboot').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl\AutoReboot value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl' -Key 'AutoReboot').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.45 (L1) Ensure 'MSS: (AutoShareServer) Enable Administrative Shares' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters\AutoShareServer key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters' -Key 'AutoShareServer').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters\AutoShareServer value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters' -Key 'AutoShareServer').Value `
  -expected_value2 1
  
describe_dual_duo_all `
  -control "3.46 (L1) Ensure 'MSS: (EnableICMPRedirect) Allow ICMP redirects to override OSPF generated routes' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters\EnableICMPRedirect key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters' -Key 'EnableICMPRedirect').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters\EnableICMPRedirect value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters' -Key 'EnableICMPRedirect').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.47 (L1) Ensure 'MSS: (Hidden) Hide Computer From the Browse List'is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Lanmanserver\Parameters\Hidden key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Lanmanserver\Parameters' -Key 'Hidden').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Lanmanserver\Parameters\Hidden value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Lanmanserver\Parameters' -Key 'Hidden').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.48 (L2) Ensure 'MSS: (KeepAliveTime) How often keep-alive packets are sent in milliseconds' is set to 'Enabled: 300,000 or 5 minutes (recommended)'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters\KeepAliveTime key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters' -Key 'KeepAliveTime').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters\KeepAliveTime value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters' -Key 'KeepAliveTime').Value `
  -expected_value2 300000

describe_dual_duo_all `
  -control "3.49 (L2) Ensure 'MSS: (NoDefaultExempt) Configure IPSec exemptions for various types of network traffic.'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\IPSEC\NoDefaultExempt key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\IPSEC' -Key 'NoDefaultExempt').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\IPSEC\NoDefaultExempt value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\IPSEC' -Key 'NoDefaultExempt').Value `
  -expected_value2 3

describe_dual_duo_all `
  -control "3.50 (L1) Ensure 'MSS: (NoNameReleaseOnDemand) Allow the computer to ignore NetBIOS name release requests except from WINS servers' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NetBT\Parameters\NoNameReleaseOnDemand key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NetBT\Parameters' -Key 'NoNameReleaseOnDemand').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NetBT\Parameters\NoNameReleaseOnDemand value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NetBT\Parameters' -Key 'NoNameReleaseOnDemand').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.51 (L2) Ensure 'MSS: (PerformRouterDiscovery) Allow IRDP to detect and configure Default Gateway addresses (could lead to DoS)' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters\PerformRouterDiscovery key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters' -Key 'PerformRouterDiscovery').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters\PerformRouterDiscovery value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters' -Key 'PerformRouterDiscovery').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.52 (L2) Ensure 'MSS: (TcpMaxDataRetransmissions IPv6) How many times unacknowledged data is retransmitted' is set to 'Enabled: 3'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip6\Parameters\TcpMaxDataRetransmissions key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip6\Parameters' -Key 'TcpMaxDataRetransmissions').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip6\Parameters\TcpMaxDataRetransmissions value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip6\Parameters' -Key 'TcpMaxDataRetransmissions').Value `
  -expected_value2 3

describe_dual_duo_all `
  -control "3.53 (L2) Ensure 'MSS: (TcpMaxDataRetransmissions) How many times unacknowledged data is retransmitted' is set to 'Enabled: 3'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters\TcpMaxDataRetransmissions key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters' -Key 'TcpMaxDataRetransmissions').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters\TcpMaxDataRetransmissions value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters' -Key 'TcpMaxDataRetransmissions').Value `
  -expected_value2 3

describe_dual_duo_all `
  -control "3.54 (L1) Ensure 'MSS: (AutoAdminLogon) Enable Automatic Logon (not recommended)' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\AutoAdminLogon key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Key 'AutoAdminLogon').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\AutoAdminLogon value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Key 'AutoAdminLogon').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.55 (L1) Ensure 'MSS: (DisableIPSourceRouting IPv6) IP source routing protection level (protects against packet spoofing)' is set to 'Enabled: Highest protection, source routing is completely disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip6\Parameters\DisableIPSourceRouting key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip6\Parameters' -Key 'DisableIPSourceRouting').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip6\Parameters\DisableIPSourceRouting value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip6\Parameters' -Key 'DisableIPSourceRouting').Value `
  -expected_value2 2

describe_dual_duo_all `
  -control "3.56 (L1) Ensure 'MSS: (DisableIPSourceRouting) IP source routing protection level (protects against packet spoofing)' is set to 'Enabled: Highest protection, source routing is completely disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters\DisableIPSourceRouting key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters' -Key 'DisableIPSourceRouting').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters\DisableIPSourceRouting value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters' -Key 'DisableIPSourceRouting').Value `
  -expected_value2 2

describe_dual_duo_all `
  -control "3.57 (L1) Ensure 'MSS: (SafeDllSearchMode) Enable Safe DLL search mode (recommended)' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\SafeDllSearchMode key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager' -Key 'SafeDllSearchMode').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\SafeDllSearchMode value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager' -Key 'SafeDllSearchMode').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.58 (L1) Ensure 'MSS: (ScreenSaverGracePeriod) The time in seconds before the screen saver grace period expires (0 recommended)' is set to 'Enabled: 0 second'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\ScreenSaverGracePeriod key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon' -Key 'ScreenSaverGracePeriod').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\ScreenSaverGracePeriod value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon' -Key 'ScreenSaverGracePeriod').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.59 (L1) Ensure 'MSS: (WarningLevel) Percentage threshold for the security event log at which the system will generate a warning' is set to 'Enabled: 90%'" `
  -item1 "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\Security\WarningLevel key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\Security' -Key 'WarningLevel').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\Security\WarningLevel value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\Security' -Key 'WarningLevel').Value `
  -expected_value2 90

describe_dual_duo_all `
  -control "3.60 (L2) Ensure 'Network access: Do not allow storage of passwords and credentials for network authentication' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\DisableDomainCreds key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'DisableDomainCreds').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\DisableDomainCreds value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'DisableDomainCreds').Value `
  -expected_value2 1

describe_dual_duo_one `
  -control "3.61 (L1) Configure 'Network access: Named Pipes that can be accessed anonymously' is set to 'None'" `
  -item1a "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\NullSessionPipes key_exist" `
  -current_value1a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'NullSessionPipes').KeyExist `
  -expected_value1a $true `
  -item2a "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\NullSessionPipes value" `
  -current_value2a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'NullSessionPipes').Value `
  -expected_value2a "" `
  -item1b "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\NullSessionPipes key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'NullSessionPipes').KeyExist `
  -expected_value1b $false `
  -item2b "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\NullSessionPipes value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'NullSessionPipes').Value `
  -expected_value2b $null

describe_dual_duo_one `
  -control "3.62 (L1) Ensure 'Network access: Shares that can be accessed anonymously' is set to 'None'" `
  -item1a "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\NullSessionShares key_exist" `
  -current_value1a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'NullSessionShares').KeyExist `
  -expected_value1a $true `
  -item2a "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\NullSessionShares value" `
  -current_value2a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'NullSessionShares').Value `
  -expected_value2a "" `
  -item1b "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\NullSessionShares key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'NullSessionShares').KeyExist `
  -expected_value1b $false `
  -item2b "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\NullSessionShares value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'NullSessionShares').Value `
  -expected_value2b $null

describe `
  -control "3.63 (L1) Ensure 'Network access: Allow anonymous SID/Name translation' is set to 'Disabled'" `
  -item "LSAAnonymousNameLookup" `
  -current_value (Get-SecurityPolicy 'LSAAnonymousNameLookup') `
  -expected_value 0

describe_dual_duo_all `
  -control "3.64 (L1) Ensure 'Network access: Do not allow anonymous enumeration of SAM accounts' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\RestrictAnonymousSAM key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'RestrictAnonymousSAM').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\RestrictAnonymousSAM value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'RestrictAnonymousSAM').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.65 (L1) Ensure 'Network access: Do not allow anonymous enumeration of SAM accounts and shares' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\RestrictAnonymous key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'RestrictAnonymous').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\RestrictAnonymous value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'RestrictAnonymous').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.66 (L1) Ensure 'Network access: Let Everyone permissions apply to anonymous users' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\EveryoneIncludesAnonymous key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'EveryoneIncludesAnonymous').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\EveryoneIncludesAnonymous value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'EveryoneIncludesAnonymous').Value `
  -expected_value2 0

describe_dual_duo_one `
  -control "3.67 (L1) Configure 'Network access: Remotely accessible registry paths and sub-paths'" `
  -item1a "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths\Machine key_exist" `
  -current_value1a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths' -Key 'Machine').KeyExist `
  -expected_value1a $true `
  -item2a "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths\Machine key_exist value" `
  -current_value2a (((Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths' -Key 'Machine').Value | Sort-Object) -join ",") `
  -expected_value2a ('Software\Microsoft\OLAP Server,Software\Microsoft\Windows NT\CurrentVersion\Perflib,Software\Microsoft\Windows NT\CurrentVersion\Print,' +
    'Software\Microsoft\Windows NT\CurrentVersion\Windows,System\CurrentControlSet\Control\ContentIndex,System\CurrentControlSet\Control\Print\Printers,' +
    'System\CurrentControlSet\Control\Terminal Server,System\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration,' +
    'System\CurrentControlSet\Control\Terminal Server\UserConfig,System\CurrentControlSet\Services\Eventlog,System\CurrentControlSet\Services\SysmonLog') `
  -item1b "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths\Machine key_exist key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths' -Key 'Machine').KeyExist `
  -expected_value1b $false `
  -item2b "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths\Machine key_exist value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths' -Key 'Machine').Value `
  -expected_value2b $null

describe_dual_duo_one `
  -control "3.68 (L1) Configure 'Network access: Remotely accessible registry paths'" `
  -item1a "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths\Machine key_exist" `
  -current_value1a (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths' -Key 'Machine').KeyExist `
  -expected_value1a $true `
  -item2a "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths\Machine key_exist value" `
  -current_value2a (((Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths' -Key 'Machine').Value | Sort-Object) -join ",") `
  -expected_value2a 'Software\Microsoft\Windows NT\CurrentVersion,System\CurrentControlSet\Control\ProductOptions,System\CurrentControlSet\Control\Server Applications' `
  -item1b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths\Machine key_exist key_exist" `
  -current_value1b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths' -Key 'Machine').KeyExist `
  -expected_value1b $false `
  -item2b "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths\Machine key_exist value" `
  -current_value2b (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths' -Key 'Machine').Value `
  -expected_value2b $null

describe_dual_duo_all `
  -control "3.69 (L1) Ensure 'Network access: Restrict anonymous access to Named Pipes and Shares' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\RestrictNullSessAccess key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'RestrictNullSessAccess').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\RestrictNullSessAccess value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'RestrictNullSessAccess').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.70 (L1) Ensure 'Network access: Sharing and security model for local accounts' is set to 'Classic - local users authenticate as themselves'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\ForceGuest key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'ForceGuest').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\ForceGuest value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'ForceGuest').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.71 (L1) Ensure 'Network Security: Allow PKU2U authentication requests to this computer to use online identities' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\pku2u\AllowOnlineID key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\pku2u' -Key 'AllowOnlineID').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\pku2u\AllowOnlineID value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\pku2u' -Key 'AllowOnlineID').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.72 (L1) Ensure 'Network security: Configure encryption types allowed for Kerberos' is set to 'AES128_HMAC_SHA1, AES256_HMAC_SHA1, Future encryption types'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters\SupportedEncryptionTypes key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters' -Key 'SupportedEncryptionTypes').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters\SupportedEncryptionTypes value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters' -Key 'SupportedEncryptionTypes').Value `
  -expected_value2 2147483640

describe_dual_duo_all `
  -control "3.73 (L1) Ensure 'Network security: Force logoff when logon hours expire' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\EnableForcedLogOff key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'EnableForcedLogOff').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters\EnableForcedLogOff value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters' -Key 'EnableForcedLogOff').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.74 (L1) Ensure 'Network Security: Restrict NTLM: Add remote server exceptions for NTLM authentication' is set to 'None'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\ClientAllowedNTLMServers key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0' -Key 'ClientAllowedNTLMServers').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\ClientAllowedNTLMServers value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0' -Key 'ClientAllowedNTLMServers').Value `
  -expected_value2 ""

describe_dual_duo_all `
  -control "3.75 (L1) Ensure 'Network Security: Restrict NTLM: Add server exceptions in this domain' is set to 'None'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\ClientAllowedNTLMServers key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters' -Key 'ClientAllowedNTLMServers').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\ClientAllowedNTLMServers value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters' -Key 'ClientAllowedNTLMServers').Value `
  -expected_value2 ""

describe_dual_duo_all `
  -control "3.76 (L1) Ensure 'Network Security: Restrict NTLM: Audit Incoming NTLM Traffic' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\AuditReceivingNTLMTraffic key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0' -Key 'AuditReceivingNTLMTraffic').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\AuditReceivingNTLMTraffic value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0' -Key 'AuditReceivingNTLMTraffic').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.77 (L1) Ensure 'Network Security: Restrict NTLM: Audit NTLM authentication in this domain' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\AuditNTLMInDomain key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters' -Key 'AuditNTLMInDomain').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\AuditNTLMInDomain value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters' -Key 'AuditNTLMInDomain').Value `
  -expected_value2 0
  
describe_dual_duo_all `
  -control "3.78 (L1) Ensure 'Network Security: Restrict NTLM: Incoming NTLM traffic' is set to 'Allow all'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\RestrictReceivingNTLMTraffic key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0' -Key 'RestrictReceivingNTLMTraffic').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\RestrictReceivingNTLMTraffic value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0' -Key 'RestrictReceivingNTLMTraffic').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.79 (L1) Ensure 'Network Security: Restrict NTLM: NTLM authentication in this domain' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\RestrictNTLMInDomain key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters' -Key 'RestrictNTLMInDomain').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters\RestrictNTLMInDomain value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters' -Key 'RestrictNTLMInDomain').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.80 (L1) Ensure 'Network Security: Restrict NTLM: Outgoing NTLM traffic to remote servers' is set to 'Allow all'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\RestrictSendingNTLMTraffic key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0' -Key 'RestrictSendingNTLMTraffic').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\RestrictSendingNTLMTraffic value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0' -Key 'RestrictSendingNTLMTraffic').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.81 (L1) Ensure 'Network security: Allow Local System to use computer identity for NTLM' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\UseMachineId key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'UseMachineId').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\UseMachineId value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'UseMachineId').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.82 (L1) Ensure 'Network security: Allow LocalSystem NULL session fallback' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\AllowNullSessionFallback key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0' -Key 'AllowNullSessionFallback').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\AllowNullSessionFallback value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0' -Key 'AllowNullSessionFallback').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.83 (L1) Ensure 'Network security: Do not store LAN Manager hash value on next password change' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\NoLMHash key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'NoLMHash').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\NoLMHash value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'NoLMHash').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.84 (L1) Ensure 'Network security: LAN Manager authentication level' is set to 'Send NTLMv2 response only. Refuse LM & NTLM'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\LmCompatibilityLevel key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'LmCompatibilityLevel').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\LmCompatibilityLevel value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa' -Key 'LmCompatibilityLevel').Value `
  -expected_value2 5

describe_dual_duo_all `
  -control "3.85 (L1) Ensure 'Network security: LDAP client signing requirements' is set to 'Negotiate signing' or higher" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LDAP\LDAPClientIntegrity key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LDAP' -Key 'LDAPClientIntegrity').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LDAP\LDAPClientIntegrity value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LDAP' -Key 'LDAPClientIntegrity').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.86 (L1) Ensure 'Network security: Minimum session security for NTLM SSP based (including secure RPC) clients' is set to 'Require NTLMv2 session security, Require 128-bit encryption'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\NTLMMinClientSec key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0' -Key 'NTLMMinClientSec').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\NTLMMinClientSec value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0' -Key 'NTLMMinClientSec').Value `
  -expected_value2 537395200

describe_dual_duo_all `
  -control "3.87 (L1) Ensure 'Network security: Minimum session security for NTLM SSP based (including secure RPC) servers' is set to 'Require NTLMv2 session security, Require 128-bit encryption'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\NTLMMinServerSec key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0' -Key 'NTLMMinServerSec').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0\NTLMMinServerSec value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\MSV1_0' -Key 'NTLMMinServerSec').Value `
  -expected_value2 537395200

describe_dual_duo_all `
  -control "3.88 (L1) Ensure 'Recovery console: Allow automatic administrative logon' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\SecurityLevel key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole' -Key 'SecurityLevel').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\SecurityLevel value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole' -Key 'SecurityLevel').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.89 (L1) Ensure 'Recovery console: Allow floppy copy and access to all drives and all folders' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\SetCommand key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole' -Key 'SetCommand').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\SetCommand value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole' -Key 'SetCommand').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.90 (L1) Ensure 'Shutdown: Allow system to be shut down without having to log on' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ShutdownWithoutLogon key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'ShutdownWithoutLogon').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ShutdownWithoutLogon value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'ShutdownWithoutLogon').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.91 (L1) Ensure 'Shutdown: Clear virtual memory pagefile' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ClearPageFileAtShutdown key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'ClearPageFileAtShutdown').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ClearPageFileAtShutdown value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'ClearPageFileAtShutdown').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.92 (L1) Ensure 'System cryptography: Force strong key protection for user keys stored on the computer' is set to 'User is prompted when the key is first used'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Cryptography\ForceKeyProtection key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Cryptography' -Key 'ForceKeyProtection').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Cryptography\ForceKeyProtection value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Cryptography' -Key 'ForceKeyProtection').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.93 (L1) Ensure 'System cryptography: Use FIPS compliant algorithms for encryption, hashing, and signing' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy\Enabled key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy' -Key 'Enabled').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy\Enabled value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy' -Key 'Enabled').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.94 (L1) Ensure 'System objects: Require case insensitivity for non-Windows subsystems' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Kernel\ObCaseInsensitive key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Kernel' -Key 'ObCaseInsensitive').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Kernel\ObCaseInsensitive value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Kernel' -Key 'ObCaseInsensitive').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.95 (L1) Ensure 'System objects: Strengthen default permissions of internal system objects (e.g. Symbolic Links)' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\ProtectionMode key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager' -Key 'ProtectionMode').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\ProtectionMode value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager' -Key 'ProtectionMode').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.96 (L1) Ensure 'System settings: Optional subsystems' is set to 'None'" `
  -item1 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\SubSystems\Optional key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\SubSystems' -Key 'Optional').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\SubSystems\Optional value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\SubSystems' -Key 'Optional').Value `
  -expected_value2 ""

describe_dual_duo_all `
  -control "3.97 (L1) Ensure 'System settings: Use Certificate Rules on Windows Executables for Software Restriction Policies' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Safer\CodeIdentifiers\AuthenticodeEnabled key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Safer\CodeIdentifiers' -Key 'AuthenticodeEnabled').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Safer\CodeIdentifiers\AuthenticodeEnabled value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Safer\CodeIdentifiers' -Key 'AuthenticodeEnabled').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.98 (L1) Ensure 'User Account Control: Admin Approval Mode for the Built-in Administrator account' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\FilterAdministratorToken key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'FilterAdministratorToken').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\FilterAdministratorToken value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'FilterAdministratorToken').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.99 (L1) Ensure 'User Account Control: Allow UIAccess applications to prompt for elevation without using the secure desktop' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableUIADesktopToggle key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'EnableUIADesktopToggle').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableUIADesktopToggle value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'EnableUIADesktopToggle').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.100 (L1) Ensure 'User Account Control: Behavior of the elevation prompt for administrators in Admin Approval Mode' is set to 'Prompt for consent for non-Windows binaries'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ConsentPromptBehaviorAdmin key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'ConsentPromptBehaviorAdmin').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ConsentPromptBehaviorAdmin value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'ConsentPromptBehaviorAdmin').Value `
  -expected_value2 5

describe_dual_duo_all `
  -control "3.101 (L1) Ensure 'User Account Control: Behavior of the elevation prompt for standard users' is set to 'Automatically deny elevation requests'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ConsentPromptBehaviorUser key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'ConsentPromptBehaviorUser').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ConsentPromptBehaviorUser value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'ConsentPromptBehaviorUser').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.102 (L1) Ensure 'User Account Control: Detect application installations and prompt for elevation' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableInstallerDetection key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'EnableInstallerDetection').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableInstallerDetection value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'EnableInstallerDetection').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.103 (L1) Ensure 'User Account Control: Only elevate executables that are signed and validated' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ValidateAdminCodeSignatures key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'ValidateAdminCodeSignatures').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ValidateAdminCodeSignatures value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'ValidateAdminCodeSignatures').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.104 (L1) Ensure 'User Account Control: Only elevate UIAccess applications that are installed in secure locations' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableSecureUIAPaths key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'EnableSecureUIAPaths').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableSecureUIAPaths value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'EnableSecureUIAPaths').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.105 (L1) Ensure 'User Account Control: Run all administrators in Admin Approval Mode' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'EnableLUA').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'EnableLUA').Value `
  -expected_value2 0

describe_dual_duo_all `
  -control "3.106 (L1) Ensure 'User Account Control: Switch to the secure desktop when prompting for elevation' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\PromptOnSecureDesktop key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'PromptOnSecureDesktop').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\PromptOnSecureDesktop value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'PromptOnSecureDesktop').Value `
  -expected_value2 1

describe_dual_duo_all `
  -control "3.107 (L1) Ensure 'User Account Control: Virtualize file and registry write failures to per-user locations' is set to 'Enabled'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableVirtualization key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'EnableVirtualization').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableVirtualization value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System' -Key 'EnableVirtualization').Value `
  -expected_value2 1
