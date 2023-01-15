describe `
  -control "2.1 (L1) Ensure 'Audit Credential Validation' is set to 'Success and Failure'" `
  -item "Credential Validation" `
  -current_value (Get-AuditPol 'Credential Validation') `
  -expected_value "Success and Failure"

describe `
  -control "2.2 (L1) Ensure 'Audit Kerberos Authentication Service' is set to 'No Auditing'" `
  -item "Kerberos Authentication Service" `
  -current_value (Get-AuditPol 'Kerberos Authentication Service') `
  -expected_value "No Auditing"

describe `
  -control "2.3 (L1) Ensure 'Audit Kerberos Service Ticket Operations' is set to 'No Auditing'" `
  -item "Kerberos Service Ticket Operations" `
  -current_value (Get-AuditPol 'Kerberos Service Ticket Operations') `
  -expected_value "No Auditing"

describe `
  -control "2.4 (L1) Ensure 'Audit Other Account Logon Events' is set to 'No Auditing'" `
  -item "Other Account Logon Events" `
  -current_value (Get-AuditPol 'Other Account Logon Events') `
  -expected_value "No Auditing"

describe `
  -control "2.5 (L1) Ensure 'Audit Application Group Management' is set to 'No Auditing'" `
  -item "Application Group Management" `
  -current_value (Get-AuditPol 'Application Group Management') `
  -expected_value "No Auditing"
  
describe `
  -control "2.6 (L1) Ensure 'Audit Computer Account Management' is set to 'Success and Failure'" `
  -item "Computer Account Management" `
  -current_value (Get-AuditPol 'Computer Account Management') `
  -expected_value "Success and Failure"

describe `
  -control "2.7 (L1) Ensure 'Audit Distribution Group Management' is set to 'No Auditing'" `
  -item "Distribution Group Management" `
  -current_value (Get-AuditPol 'Distribution Group Management') `
  -expected_value "No Auditing"

describe `
  -control "2.8 (L1) Ensure 'Audit Other Account Management Events' is set to 'Success and Failure'" `
  -item "Other Account Management Events" `
  -current_value (Get-AuditPol 'Other Account Management Events') `
  -expected_value "Success and Failure"

describe `
  -control "2.9 (L1) Ensure 'Audit Security Group Management' is set to 'Success and Failure'" `
  -item "Security Group Management" `
  -current_value (Get-AuditPol 'Security Group Management') `
  -expected_value "Success and Failure"

describe `
  -control "2.10 (L1) Ensure 'Audit User Account Management' is set to 'Success and Failure'" `
  -item "User Account Management" `
  -current_value (Get-AuditPol 'User Account Management') `
  -expected_value "Success and Failure"

describe `
  -control "2.11 (L1) Ensure 'Audit DPAPI Activity' is set to 'No Auditing'" `
  -item "DPAPI Activity" `
  -current_value (Get-AuditPol 'DPAPI Activity') `
  -expected_value "No Auditing"

describe `
  -control "2.12 (L1) Ensure 'Audit Process Creation' is set to 'Success'" `
  -item "Process Creation" `
  -current_value (Get-AuditPol 'Process Creation') `
  -expected_value "Success"

describe `
  -control "2.13 (L1) Ensure 'Audit Process Termination' is set to 'No Auditing'" `
  -item "Process Termination" `
  -current_value (Get-AuditPol 'Process Termination') `
  -expected_value "No Auditing"

describe `
  -control "2.14 (L1) Ensure 'Audit RPC Events' is set to 'No Auditing'" `
  -item "RPC Events" `
  -current_value (Get-AuditPol 'RPC Events') `
  -expected_value "No Auditing"

describe `
  -control "2.15 (L1) Ensure 'Audit Detailed Directory Service Replication' is set to 'No Auditing'" `
  -item "Detailed Directory Service Replication" `
  -current_value (Get-AuditPol 'Detailed Directory Service Replication') `
  -expected_value "No Auditing"

describe `
  -control "2.16 (L1) Ensure 'Audit Directory Service Access' is set to 'Success and Failure'" `
  -item "Directory Service Access" `
  -current_value (Get-AuditPol 'Directory Service Access') `
  -expected_value "No Auditing"

describe `
  -control "2.17 (L1) Ensure 'Audit Directory Service Changes' is set to 'Success and Failure'" `
  -item "Directory Service Changes" `
  -current_value (Get-AuditPol 'Directory Service Changes') `
  -expected_value "No Auditing"

describe `
  -control "2.18 (L1) Ensure 'Audit Directory Service Replication' is set to 'Success and Failure'" `
  -item "Directory Service Replication" `
  -current_value (Get-AuditPol 'Directory Service Replication') `
  -expected_value "No Auditing"

describe `
  -control "2.19 (L1) Ensure 'Audit Account Lockout' is set to 'Success and Failure'" `
  -item "Account Lockout" `
  -current_value (Get-AuditPol 'Account Lockout') `
  -expected_value "Success and Failure"

describe `
  -control "2.20 (L1) Ensure 'Audit IPsec Extended Mode' is set to 'No Auditing'" `
  -item "IPsec Extended Mode" `
  -current_value (Get-AuditPol 'IPsec Extended Mode') `
  -expected_value "No Auditing"

describe `
  -control "2.21 (L1) Ensure 'Audit IPsec Main Mode' is set to 'No Auditing'" `
  -item "IPsec Main Mode" `
  -current_value (Get-AuditPol 'IPsec Main Mode') `
  -expected_value "No Auditing"

describe `
  -control "2.22 (L1) Ensure 'Audit IPsec Quick Mode' is set to 'No Auditing'" `
  -item "IPsec Quick Mode" `
  -current_value (Get-AuditPol 'IPsec Quick Mode') `
  -expected_value "No Auditing"

describe `
  -control "2.23 (L1) Ensure 'Audit Logoff' is set to 'Success'" `
  -item "Logoff" `
  -current_value (Get-AuditPol 'Logoff') `
  -expected_value "Success"

describe `
  -control "2.24 (L1) Ensure 'Audit Logon' is set to 'Success and Failure'" `
  -item "Logon" `
  -current_value (Get-AuditPol 'Logon') `
  -expected_value "Success and Failure"

describe `
  -control "2.25 (L1) Ensure 'Audit Network Policy Server' is set to 'No Auditing'" `
  -item "Network Policy Server" `
  -current_value (Get-AuditPol 'Network Policy Server') `
  -expected_value "No Auditing"

describe `
  -control "2.26 (L1) Ensure 'Audit Other Logon/Logoff Events' is set to 'No Auditing'" `
  -item "Other Logon/Logoff Events" `
  -current_value (Get-AuditPol 'Other Logon/Logoff Events') `
  -expected_value "No Auditing"

describe `
  -control "2.27 (L1) Ensure 'Audit Special Logon' is set to 'Success and Failure'" `
  -item "Special Logon" `
  -current_value (Get-AuditPol 'Special Logon') `
  -expected_value "Success and Failure"

describe `
  -control "2.28 (L1) Ensure 'Audit Application Generated' is set to 'No Auditing'" `
  -item "Application Generated" `
  -current_value (Get-AuditPol 'Application Generated') `
  -expected_value "No Auditing"

describe `
  -control "2.29 (L1) Ensure 'Audit Central Policy Staging' is set to 'No Auditing'" `
  -item "Applicable only for Windows 2012" `
  -current_value "" `
  -expected_value "" `
  -only_if $false

describe `
  -control "2.30 (L1) Ensure 'Audit Certification Services' is set to 'No Auditing'" `
  -item "Certification Services" `
  -current_value (Get-AuditPol 'Certification Services') `
  -expected_value "No Auditing"

describe `
  -control "2.31 (L1) Ensure 'Audit Detailed File Share' is set to 'No Auditing'" `
  -item "Detailed File Share" `
  -current_value (Get-AuditPol 'Detailed File Share') `
  -expected_value "No Auditing"

describe `
  -control "2.32 (L1) Ensure 'Audit File Share' is set to 'No Auditing''" `
  -item "File Share" `
  -current_value (Get-AuditPol 'File Share') `
  -expected_value "No Auditing"

describe `
  -control "2.33 (L1) Ensure 'Audit File System' is set to 'No Auditing'" `
  -item "File System" `
  -current_value (Get-AuditPol 'File System') `
  -expected_value "Failure"

describe `
  -control "2.34 (L1) Ensure 'Audit Filtering Platform Connection' is set to 'No Auditing'" `
  -item "Filtering Platform Connection" `
  -current_value (Get-AuditPol 'Filtering Platform Connection') `
  -expected_value "No Auditing"

describe `
  -control "2.35 (L1) Ensure 'Audit Filtering Platform Packet Drop' is set to 'No Auditing'" `
  -item "Filtering Platform Packet Drop" `
  -current_value (Get-AuditPol 'Filtering Platform Packet Drop') `
  -expected_value "No Auditing"

describe `
  -control "2.36 (L1) Ensure 'Audit Handle Manipulation' is set to 'No Auditing'" `
  -item "Handle Manipulation" `
  -current_value (Get-AuditPol 'Handle Manipulation') `
  -expected_value "No Auditing"
  
describe `
  -control "2.37 (L1) Ensure 'Audit Kernel Object' is set to 'No Auditing'" `
  -item "Kernel Object" `
  -current_value (Get-AuditPol 'Kernel Object') `
  -expected_value "No Auditing"
  
describe `
  -control "2.38 (L1) Ensure 'Audit Other Object Access Events' is set to 'No Auditing'" `
  -item "Other Object Access Events" `
  -current_value (Get-AuditPol 'Other Object Access Events') `
  -expected_value "No Auditing"
  
describe `
  -control "2.39 (L1) Ensure 'Audit Registry' is set to 'No Auditing'" `
  -item "Registry" `
  -current_value (Get-AuditPol 'Registry') `
  -expected_value "Failure"
  
describe `
  -control "2.40 (L1) Ensure 'Audit Removable Storage' is set to 'No Auditing'" `
  -item "Applicable only for Windows 2012" `
  -current_value "" `
  -expected_value "" `
  -only_if $false
    
describe `
  -control "2.41 (L1) Ensure 'Audit SAM' is set to 'No Auditing'" `
  -item "SAM" `
  -current_value (Get-AuditPol 'SAM') `
  -expected_value "No Auditing"

describe `
  -control "2.42 (L1) Ensure 'Audit Policy Change' is set to 'Success and Failure'" `
  -item "Audit Policy Change" `
  -current_value (Get-AuditPol 'Audit Policy Change') `
  -expected_value "Success and Failure"

describe `
  -control "2.43 (L1) Ensure 'Audit Authentication Policy Change' is set to 'Success and Failure'" `
  -item "Authentication Policy Change" `
  -current_value (Get-AuditPol 'Authentication Policy Change') `
  -expected_value "Success and Failure"

describe `
  -control "2.44 (L1) Ensure 'Audit Authorization Policy Change' is set to 'Success and Failure'" `
  -item "Authorization Policy Change" `
  -current_value (Get-AuditPol 'Authorization Policy Change') `
  -expected_value "Success and Failure"

describe `
  -control "2.45 (L1) Ensure 'Audit Filtering Platform Policy Change' is set to 'No Auditing'" `
  -item "Filtering Platform Policy Change" `
  -current_value (Get-AuditPol 'Filtering Platform Policy Change') `
  -expected_value "No Auditing"

describe `
  -control "2.46 (L1) Ensure 'Audit MPSSVC Rule-Level Policy Change' is set to 'No Auditing'" `
  -item "MPSSVC Rule-Level Policy Change" `
  -current_value (Get-AuditPol 'MPSSVC Rule-Level Policy Change') `
  -expected_value "No Auditing"

describe `
  -control "2.47 (L1) Ensure 'Audit Other Policy Change Events' is set to 'No Auditing'" `
  -item "Other Policy Change Events" `
  -current_value (Get-AuditPol 'Other Policy Change Events') `
  -expected_value "No Auditing"

describe `
  -control "2.48 (L1) Ensure 'Audit Non Sensitive Privilege Use' is set to 'No Auditing'" `
  -item "Non Sensitive Privilege Use" `
  -current_value (Get-AuditPol 'Non Sensitive Privilege Use') `
  -expected_value "No Auditing"

describe `
  -control "2.49 (L1) Ensure 'Audit Other Privilege Use Events' is set to 'No Auditing'" `
  -item "Other Privilege Use Events" `
  -current_value (Get-AuditPol 'Other Privilege Use Events') `
  -expected_value "No Auditing"

describe `
  -control "2.50 (L1) Ensure 'Audit Sensitive Privilege Use' is set to 'Success and Failure'" `
  -item "Sensitive Privilege Use" `
  -current_value (Get-AuditPol 'Sensitive Privilege Use') `
  -expected_value "Success and Failure"

describe `
  -control "2.51 (L1) Ensure 'Audit IPsec Driver' is set to 'Success and Failure'" `
  -item "Audit IPsec Driver" `
  -current_value (Get-AuditPol 'IPsec Driver') `
  -expected_value "Success and Failure"

describe `
  -control "2.52 (L1) Ensure 'Audit Other System Events' is set to 'Success and Failure'" `
  -item "Other System Events" `
  -current_value (Get-AuditPol 'Other System Events') `
  -expected_value "Success and Failure"

describe `
  -control "2.53 (L1) Ensure 'Audit Security State Change' is set to 'Success and Failure'" `
  -item "Security State Change" `
  -current_value (Get-AuditPol 'Security State Change') `
  -expected_value "Success and Failure"

describe `
  -control "2.54 (L1) Ensure 'Audit Security System Extension' is set to 'Success and Failure'" `
  -item "Security System Extension" `
  -current_value (Get-AuditPol 'Security System Extension') `
  -expected_value "Success and Failure"

describe `
  -control "2.55 (L1) Ensure 'Audit System Integrity' is set to 'Success and Failure'" `
  -item "System Integrity" `
  -current_value (Get-AuditPol 'System Integrity') `
  -expected_value "Success and Failure"
