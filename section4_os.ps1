describe `
  -control "4.1 (L1) Ensure 'Deny log on through Remote Desktop Services' set to 'Guests'" `
  -item "SeDenyRemoteInteractiveLogonRight" `
  -current_value (Get-SecurityPolicy 'SeDenyRemoteInteractiveLogonRight') `
  -expected_value "BUILTIN\Guests"

describe `
  -control "4.2 (L1) Ensure 'log on as a service' is set to include 'Only allow authorised service accounts'" `
  -item "SeServiceLogonRight" `
  -current_value (Get-SecurityPolicy 'SeServiceLogonRight') `
  -expected_value "NT SERVICE\ALL SERVICES"

describe `
  -control "4.3 (L1) Ensure 'Access Credential Manager as a trusted caller' is set to 'No One'" `
  -item "SeTrustedCredManAccessPrivilege" `
  -current_value (Get-SecurityPolicy 'SeTrustedCredManAccessPrivilege') `
  -expected_value ""

describe `
  -control "4.4 (L1) Configure 'Access this computer from the network' is set to 'Administrators', 'Authenticated Users' and 'Enterprise Domain Controllers'" `
  -item "SeNetworkLogonRight" `
  -current_value (Get-SecurityPolicy 'SeNetworkLogonRight') `
  -expected_value "BUILTIN\Administrators,NT AUTHORITY\Authenticated Users,NT AUTHORITY\ENTERPRISE DOMAIN CONTROLLERS"

describe `
  -control "4.5 (L1) Ensure 'Act as part of the operating system' is set to 'No One' and/or allowed service accounts" `
  -item "SeTcbPrivilege" `
  -current_value (Get-SecurityPolicy 'SeTcbPrivilege') `
  -expected_value ""

describe `
  -control "4.6 (L1) Ensure 'Add workstations to domain' is set to 'Administrators'" `
  -item "SeMachineAccountPrivilege" `
  -current_value (Get-SecurityPolicy 'SeMachineAccountPrivilege') `
  -expected_value ""

describe `
  -control "4.7 (L1) Ensure 'Adjust memory quotas for a process' is set to include 'Administrators, LOCAL SERVICE, NETWORK SERVICE'" `
  -item "SeIncreaseQuotaPrivilege" `
  -current_value (Get-SecurityPolicy 'SeIncreaseQuotaPrivilege') `
  -expected_value "BUILTIN\Administrators,NT AUTHORITY\LOCAL SERVICE,NT AUTHORITY\NETWORK SERVICE"

describe `
  -control "4.8 (L1) Ensure 'Allow log on locally' is set to 'Administrators'" `
  -item "SeInteractiveLogonRight" `
  -current_value (Get-SecurityPolicy 'SeInteractiveLogonRight') `
  -expected_value "BUILTIN\Administrators"

describe `
  -control "4.9 (L1) Configure 'Allow log on through Remote Desktop Services' is set to 'Administrators'" `
  -item "SeRemoteInteractiveLogonRight" `
  -current_value (Get-SecurityPolicy 'SeRemoteInteractiveLogonRight') `
  -expected_value "BUILTIN\Administrators"

describe `
  -control "4.10 (L1) Ensure 'Back up files and directories' is set to 'Administrators'" `
  -item "SeBackupPrivilege" `
  -current_value (Get-SecurityPolicy 'SeBackupPrivilege') `
  -expected_value "BUILTIN\Administrators"

describe `
  -control "4.11 (L1) Ensure 'Bypass traverse checking' is set to 'Administrators', 'Authenticated Users', 'Local Service', 'Network Service'" `
  -item "SeChangeNotifyPrivilege" `
  -current_value (Get-SecurityPolicy 'SeChangeNotifyPrivilege') `
  -expected_value "BUILTIN\Administrators,NT AUTHORITY\Authenticated Users,NT AUTHORITY\LOCAL SERVICE,NT AUTHORITY\NETWORK SERVICE"

describe `
  -control "4.12 (L1) Ensure 'Change the system time' is set to 'Administrators, LOCAL SERVICE'" `
  -item "SeSystemtimePrivilege" `
  -current_value (Get-SecurityPolicy 'SeSystemtimePrivilege') `
  -expected_value "BUILTIN\Administrators,NT AUTHORITY\LOCAL SERVICE"

describe `
  -control "4.13 (L1) Ensure 'Change the time zone' is set to 'Administrators, LOCAL SERVICE'" `
  -item "SeTimeZonePrivilege" `
  -current_value (Get-SecurityPolicy 'SeTimeZonePrivilege') `
  -expected_value "BUILTIN\Administrators,NT AUTHORITY\LOCAL SERVICE"

describe `
  -control "4.14 (L1) Ensure 'Create a pagefile' is set to 'Administrators'" `
  -item "SeCreatePagefilePrivilege" `
  -current_value (Get-SecurityPolicy 'SeCreatePagefilePrivilege') `
  -expected_value "BUILTIN\Administrators"

describe `
  -control "4.15 (L1) Ensure 'Create a token object' is set to 'No One'" `
  -item "SeCreateTokenPrivilege" `
  -current_value (Get-SecurityPolicy 'SeCreateTokenPrivilege') `
  -expected_value ""

describe `
  -control "4.16 (L1) Ensure 'Create global objects' is set to 'Administrators, LOCAL SERVICE, NETWORK SERVICE, SERVICE'" `
  -item "SeCreateGlobalPrivilege" `
  -current_value (Get-SecurityPolicy 'SeCreateGlobalPrivilege') `
  -expected_value "BUILTIN\Administrators,NT AUTHORITY\LOCAL SERVICE,NT AUTHORITY\NETWORK SERVICE,NT AUTHORITY\SERVICE"

describe `
  -control "4.17 (L1) Ensure 'Create permanent shared objects' is set to 'No One'" `
  -item "SeCreatePermanentPrivilege" `
  -current_value (Get-SecurityPolicy 'SeCreatePermanentPrivilege') `
  -expected_value ""

describe `
  -control "4.18 (L1) Configure 'Create symbolic links' is set to 'Administrators'" `
  -item "SeCreateSymbolicLinkPrivilege" `
  -current_value (Get-SecurityPolicy 'SeCreateSymbolicLinkPrivilege') `
  -expected_value "BUILTIN\Administrators"

describe `
  -control "4.19 (L1) Ensure 'Debug programs' is set to 'No One'" `
  -item "SeDebugPrivilege" `
  -current_value (Get-SecurityPolicy 'SeDebugPrivilege') `
  -expected_value "BUILTIN\Administrators"

describe `
  -control "4.20 (L1) Configure 'Deny access to this computer from the network' is set to 'Guests, ANONYMOUS LOGON'" `
  -item "SeDenyNetworkLogonRight" `
  -current_value (Get-SecurityPolicy 'SeDenyNetworkLogonRight') `
  -expected_value "BUILTIN\Guests,NT AUTHORITY\ANONYMOUS LOGON"

describe `
  -control "4.21 (L1) Ensure 'Deny log on as a batch job' is set to 'Guests'" `
  -item "SeDenyBatchLogonRight" `
  -current_value (Get-SecurityPolicy 'SeDenyBatchLogonRight') `
  -expected_value "BUILTIN\Guests"

describe `
  -control "4.22 (L1) Ensure 'Deny log on as a service' to set to 'None'" `
  -item "SeDenyServiceLogonRight" `
  -current_value (Get-SecurityPolicy 'SeDenyServiceLogonRight') `
  -expected_value ""

describe `
  -control "4.23 (L1) Ensure 'Deny log on locally' is set to 'Guests'" `
  -item "SeDenyInteractiveLogonRight" `
  -current_value (Get-SecurityPolicy 'SeDenyInteractiveLogonRight') `
  -expected_value "BUILTIN\Guests"

describe `
  -control "4.24 (L1) Configure 'Enable computer and user accounts to be trusted for delegation' is set to 'None'" `
  -item "SeEnableDelegationPrivilege" `
  -current_value (Get-SecurityPolicy 'SeEnableDelegationPrivilege') `
  -expected_value ""

describe `
  -control "4.25 (L1) Ensure 'Force shutdown from a remote system' is set to 'Administrators'" `
  -item "SeRemoteShutdownPrivilege" `
  -current_value (Get-SecurityPolicy 'SeRemoteShutdownPrivilege') `
  -expected_value "BUILTIN\Administrators"

describe `
  -control "4.26 (L1) Ensure 'Generate security audits' is set to 'LOCAL SERVICE, NETWORK SERVICE'" `
  -item "SeAuditPrivilege" `
  -current_value (Get-SecurityPolicy 'SeAuditPrivilege') `
  -expected_value "NT AUTHORITY\LOCAL SERVICE,NT AUTHORITY\NETWORK SERVICE"

describe `
  -control "4.27 (L1) Configure 'Impersonate a client after authentication' is set to 'Administrators, LOCAL SERVICE, NETWORK SERVICE, SERVICE, allowed service accounts" `
  -item "SeImpersonatePrivilege" `
  -current_value (Get-SecurityPolicy 'SeImpersonatePrivilege') `
  -expected_value "BUILTIN\Administrators,NT AUTHORITY\LOCAL SERVICE,NT AUTHORITY\NETWORK SERVICE,NT AUTHORITY\SERVICE"

describe `
  -control "4.28 (L1) Ensure 'Increase a process working set' is set to 'Administrators, LOCAL SERVICE'" `
  -item "SeIncreaseWorkingSetPrivilege" `
  -current_value (Get-SecurityPolicy 'SeIncreaseWorkingSetPrivilege') `
  -expected_value "BUILTIN\Administrators,NT AUTHORITY\LOCAL SERVICE"

describe `
  -control "4.29 (L1) Ensure 'Increase scheduling priority' is set to 'Administrators'" `
  -item "SeIncreaseBasePriorityPrivilege" `
  -current_value (Get-SecurityPolicy 'SeIncreaseBasePriorityPrivilege') `
  -expected_value "BUILTIN\Administrators"

describe `
  -control "4.30 (L1) Ensure 'Load and unload device drivers' is set to 'Administrators'" `
  -item "SeLoadDriverPrivilege" `
  -current_value (Get-SecurityPolicy 'SeLoadDriverPrivilege') `
  -expected_value "BUILTIN\Administrators"

describe `
  -control "4.31 (L1) Ensure 'Lock pages in memory' is set to 'No One'" `
  -item "SeLockMemoryPrivilege" `
  -current_value (Get-SecurityPolicy 'SeLockMemoryPrivilege') `
  -expected_value ""

describe `
  -control "4.32 (L1) Ensure 'Perform volume maintenance tasks' is set to 'None'" `
  -item "SeManageVolumePrivilege" `
  -current_value (Get-SecurityPolicy 'SeManageVolumePrivilege') `
  -expected_value ""

describe `
  -control "4.33 (L1) Configure 'Manage auditing and security log' is set to 'Administrators'" `
  -item "SeSecurityPrivilege" `
  -current_value (Get-SecurityPolicy 'SeSecurityPrivilege') `
  -expected_value "BUILTIN\Administrators"

describe `
  -control "4.34 (L1) Ensure 'Modify an object label' is set to 'No One'" `
  -item "SeRelabelPrivilege" `
  -current_value (Get-SecurityPolicy 'SeRelabelPrivilege') `
  -expected_value ""

describe `
  -control "4.35 (L1) Ensure 'Modify firmware environment values' is set to 'Administrators'" `
  -item "SeSecurityPrivilege" `
  -current_value (Get-SecurityPolicy 'SeSecurityPrivilege') `
  -expected_value "BUILTIN\Administrators"

describe `
  -control "4.36 (L1) Ensure 'Perform volume maintenance tasks' is set to 'Administrators'" `
  -item "SeManageVolumePrivilege" `
  -current_value (Get-SecurityPolicy 'SeManageVolumePrivilege') `
  -expected_value "BUILTIN\Administrators"

describe `
  -control "4.37 (L1) Ensure 'Profile single process' is set to 'Administrators'" `
  -item "SeProfileSingleProcessPrivilege" `
  -current_value (Get-SecurityPolicy 'SeProfileSingleProcessPrivilege') `
  -expected_value "BUILTIN\Administrators"

describe `
  -control "4.38 (L1) Ensure 'Profile system performance' is set to 'Administrators'" `
  -item "SeManageVolumePrivilege" `
  -current_value (Get-SecurityPolicy 'SeManageVolumePrivilege') `
  -expected_value "BUILTIN\Administrators"

describe `
  -control "4.39 (L1) Ensure 'Remove computer from docking station' is set to 'Administrators'" `
  -item "SeUndockPrivilege" `
  -current_value (Get-SecurityPolicy 'SeUndockPrivilege') `
  -expected_value "BUILTIN\Administrators"

describe `
  -control "4.40 (L1) Ensure 'Replace a process level token' is set to 'LOCAL SERVICE, NETWORK SERVICE'" `
  -item "SeAssignPrimaryTokenPrivilege" `
  -current_value (Get-SecurityPolicy 'SeAssignPrimaryTokenPrivilege') `
  -expected_value "NT AUTHORITY\LOCAL SERVICE,NT AUTHORITY\NETWORK SERVICE"

describe `
  -control "4.41 (L1) Ensure 'Restore files and directories' is set to 'Administrators'" `
  -item "SeRestorePrivilege" `
  -current_value (Get-SecurityPolicy 'SeRestorePrivilege') `
  -expected_value "BUILTIN\Administrators"

describe `
  -control "4.42 (L1) Ensure 'Shut down the system' is set to 'Administrators'" `
  -item "SeShutdownPrivilege" `
  -current_value (Get-SecurityPolicy 'SeShutdownPrivilege') `
  -expected_value "BUILTIN\Administrators"

describe `
  -control "4.43 (L1) Ensure 'Synchronize directory service data' is set to 'No One'" `
  -item "SeSyncAgentPrivilege" `
  -current_value (Get-SecurityPolicy 'SeSyncAgentPrivilege') `
  -expected_value ""

describe `
  -control "4.44 (L1) Ensure 'Take ownership of files or other objects' is set to 'Administrators'" `
  -item "SeTakeOwnershipPrivilege" `
  -current_value (Get-SecurityPolicy 'SeTakeOwnershipPrivilege') `
  -expected_value "BUILTIN\Administrators"
