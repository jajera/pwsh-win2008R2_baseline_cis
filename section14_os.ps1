describe `
  -control "14.1_Active Directory Certificate Services" `
  -item "Verify if Active Directory Certificate Services service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Active Directory Certificate Services").StartType `
  -expected_value 'Disabled' `
  -only_if (Get-FeatureInfo -Name 'Active Directory Certificate Services').Enabled

describe `
  -control "14.2_Active Directory Domain Services" `
  -item "Verify if Active Directory Domain Services service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Active Directory Domain Services").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.3_Active Directory Web Services" `
  -item "Verify if Active Directory Web Services service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Active Directory Web Services").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.4_AD RMS Logging Service" `
  -item "Verify if AD RMS Logging Service service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "AD RMS Logging Service").StartType `
  -expected_value 'Disabled' `
  -only_if (Get-ServiceInfo -DisplayName "AD RMS Logging Service").Exist

describe `
  -control "14.5_Application Experience" `
  -item "Verify if Application Experience service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Application Experience").StartType `
  -expected_value 'Manual'

describe `
  -control "14.6_Application Host Helper Service" `
  -item "Verify if Application Host Helper Service service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Application Host Helper Service").StartType `
  -expected_value 'Automatic' `
  -only_if (Get-ServiceInfo -DisplayName "Application Host Helper Service").Exist

describe `
  -control "14.7_Application Identity" `
  -item "Verify if Application Identity service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Application Identity").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.8_Application Information" `
  -item "Verify if Application Information service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Application Information").StartType `
  -expected_value 'Manual'

describe `
  -control "14.9_Application Layer Gateway Service" `
  -item "Verify if Application Layer Gateway Service service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Application Layer Gateway Service").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.10_Application Management" `
  -item "Verify if Application Management service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Application Management").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.11_ASP.NET State Service" `
  -item "Verify if ASP.NET State Service service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "ASP.NET State Service").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.12_Background Intelligent Transfer Service" `
  -item "Verify if Background Intelligent Transfer Service service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Background Intelligent Transfer Service").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.13_Background Tasks Infrastructure Service" `
  -item "Verify if Background Tasks Infrastructure Service service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Background Tasks Infrastructure Service").StartType `
  -expected_value 'Automatic' `
  -only_if (Get-ServiceInfo -DisplayName "Background Tasks Infrastructure Service").Exist

describe `
  -control "14.14_Base Filtering Engine" `
  -item "Verify if Base Filtering Engine service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Base Filtering Engine").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.15_BitLocker Drive Encryption Service" `
  -item "Verify if BitLocker Drive Encryption Service service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Background Tasks Infrastructure Service").StartType `
  -expected_value 'Manual' `
  -only_if (Get-ServiceInfo -DisplayName "Background Tasks Infrastructure Service").Exist

describe `
  -control "14.16_Certificate Propagation" `
  -item "Verify if Certificate Propagation service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Certificate Propagation").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.17_Cluster Service" `
  -item "Verify if Cluster Service service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Cluster Service").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.18_CNG Key Isolation" `
  -item "Verify if CNG Key Isolation service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "CNG Key Isolation").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.19_COM+ Event System" `
  -item "Verify if COM+ Event System service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "COM+ Event System").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.20_COM+ System Application" `
  -item "Verify if COM+ System Application service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "COM+ System Application").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.21_Computer Browser" `
  -item "Verify if Computer Browser service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Computer Browser").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.22_Credential Manager" `
  -item "Verify if Credential Manager service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Credential Manager").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.23_Cryptographic Services" `
  -item "Verify if Cryptographic Services service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Cryptographic Services").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.24_DCOM Server Process Launcher" `
  -item "Verify if DCOM Server Process Launcher service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "DCOM Server Process Launcher").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.25_Device Association Service" `
  -item "Verify if Device Association Service service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Device Association Service").StartType `
  -expected_value 'Manual' `
  -only_if (Get-ServiceInfo -DisplayName "Device Association Service").Exist

describe `
  -control "14.26_Device Install Service" `
  -item "Verify if Device Install Service service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Device Install Service").StartType `
  -expected_value 'Manual' `
  -only_if (Get-ServiceInfo -DisplayName "Device Install Service").Exist

  describe `
  -control "14.27_Device Setup Manager" `
  -item "Verify if Device Setup Manager service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Device Setup Manager").StartType `
  -expected_value 'Manual' `
  -only_if (Get-ServiceInfo -DisplayName "Device Setup Manager").Exist

describe `
  -control "14.28_DFS Namespace" `
  -item "Verify if DFS Namespace service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "DFS Namespace").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.29_DFS Replication" `
  -item "Verify if DFS Replication service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "DFS Replication").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.30_DHCP Client" `
  -item "Verify if DHCP Client service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "DHCP Client").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.31_DHCP Server" `
  -item "Verify if DHCP Server service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "DHCP Server").StartType `
  -expected_value 'Disabled' `
  -only_if (Get-ServiceInfo -DisplayName "DHCP Server").Exist

describe `
  -control "14.32_Distributed Link Tracking Client" `
  -item "Verify if Distributed Link Tracking Client service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Distributed Link Tracking Client").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.33_Distributed Transaction Coordinator" `
  -item "Verify if Distributed Transaction Coordinator service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Distributed Transaction Coordinator").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.34_DNS Client" `
  -item "Verify if DNS Client service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "DNS Client").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.35_DNS Server" `
  -item "Verify if DNS Server service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "DNS Server").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.36_Encrypting File System (EFS)" `
  -item "Verify if Encrypting File System (EFS) service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Encrypting File System (EFS)").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.37_Extensible Authentication Protocol" `
  -item "Verify if Extensible Authentication Protocol service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Extensible Authentication Protocol").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.38_File Replication" `
  -item "Verify if File Replication service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "File Replication").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.39_File Server Resource Manager" `
  -item "Verify if File Server Resource Manager service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "File Server Resource Manager").StartType `
  -expected_value 'Disabled' `
  -only_if (Get-ServiceInfo -DisplayName "File Server Resource Manager").Exist

describe `
  -control "14.40_File Server Storage Reports Manager" `
  -item "Verify if File Server Storage Reports Manager service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "File Server Resource Manager").StartType `
  -expected_value 'Manual' `
  -only_if (Get-ServiceInfo -DisplayName "File Server Resource Manager").Exist

describe `
  -control "14.41_Function Discovery Provider Host" `
  -item "Verify if Function Discovery Provider Host service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Function Discovery Provider Host").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.42_Function Discovery Resource Publication" `
  -item "Verify if Function Discovery Resource Publication service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Function Discovery Resource Publication").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.43_FTP Publishing Service" `
  -item "Verify if FTP Publishing Service service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "FTP Publishing Service").StartType `
  -expected_value 'Disabled' `
  -only_if (Get-ServiceInfo -DisplayName "FTP Publishing Service").Exist
  
describe `
  -control "14.44_Group Policy Client" `
  -item "Verify if Group Policy Client service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Group Policy Client").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.45_Health Key and Certificate Management" `
  -item "Verify if Health Key and Certificate Management service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Health Key and Certificate Management").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.46_Human Interface Device Access" `
  -item "Verify if Human Interface Device Access service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Human Interface Device Access").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.47_IIS Admin Service" `
  -item "Verify if IIS Admin Service service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "IIS Admin Service").StartType `
  -expected_value 'Disabled' `
  -only_if (Get-ServiceInfo -DisplayName "IIS Admin Service").Exist
  
describe `
  -control "14.48_IKE and AuthIP IPsec Keying Modules" `
  -item "Verify if IKE and AuthIP IPsec Keying Modules service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "IKE and AuthIP IPsec Keying Modules").StartType `
  -expected_value 'Manual'

describe `
  -control "14.49_Interactive Services Detection" `
  -item "Verify if Interactive Services Detection service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Interactive Services Detection").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.50_Internet Connection Sharing (ICS)" `
  -item "Verify if Internet Connection Sharing (ICS) service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Internet Connection Sharing (ICS)").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.51_Intersite Messaging" `
  -item "Verify if Intersite Messaging service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Intersite Messaging").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.52_IP Helper" `
  -item "Verify if IP Helper service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "IP Helper").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.53_IPsec Policy Agent" `
  -item "Verify if IPsec Policy Agent service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "IPsec Policy Agent").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.54_KDC Proxy Server service (KPS)" `
  -item "Verify if KDC Proxy Server service (KPS) service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "KDC Proxy Server service (KPS)").StartType `
  -expected_value 'Manual' `
  -only_if (Get-ServiceInfo -DisplayName "KDC Proxy Server service (KPS)").Exist

describe `
  -control "14.55_Kerberos Key Distribution Center" `
  -item "Verify if Kerberos Key Distribution Center service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Kerberos Key Distribution Center").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.56_KtmRm for Distributed Transaction Coordinator" `
  -item "Verify if KtmRm for Distributed Transaction Coordinator service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "KtmRm for Distributed Transaction Coordinator").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.57_Link-Layer Topology Discovery Mapper" `
  -item "Verify if Link-Layer Topology Discovery Mapper service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Link-Layer Topology Discovery Mapper").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.58_Local Session Manager" `
  -item "Verify if Local Session Manager service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Local Session Manager").StartType `
  -expected_value 'Automatic' `
  -only_if (Get-ServiceInfo -DisplayName "Local Session Manager").Exist

describe `
  -control "14.59_Microsoft Software Shadow Copy Provider" `
  -item "Verify if Microsoft Software Shadow Copy Provider service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Microsoft Software Shadow Copy Provider").StartType `
  -expected_value 'Manual'

describe `
  -control "14.60_Netlogon" `
  -item "Verify if Netlogon service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Netlogon").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.61_Network Access Protection Agent" `
  -item "Verify if Network Access Protection Agent service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Network Access Protection Agent").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.62_Network Connections" `
  -item "Verify if Network Connections service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Network Connections").StartType `
  -expected_value 'Manual'

describe `
  -control "14.63_Network Connectivity Assistant" `
  -item "Verify if Network Connectivity Assistant service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Network Connectivity Assistant").StartType `
  -expected_value 'Manual' `
  -only_if (Get-ServiceInfo -DisplayName "Network Connectivity Assistant").Exist
describe `
  -control "14.64_Network List Service" `
  -item "Verify if Network List Service service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Network List Service").StartType `
  -expected_value 'Manual'

describe `
  -control "14.65_Network Location Awareness" `
  -item "Verify if Network Location Awareness service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Network Location Awareness").StartType `
  -expected_value 'Manual'

describe `
  -control "14.66_Network Store Interface Service" `
  -item "Verify if Network Store Interface Service service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Network Store Interface Service").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.67_Offline Files" `
  -item "Verify if Offline Files service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Offline Files").StartType `
  -expected_value 'Disabled' `
  -only_if (Get-ServiceInfo -DisplayName "Offline Files").Exist

describe `
  -control "14.68_Optimize drives" `
  -item "Verify if Optimize drives service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Optimize drives").StartType `
  -expected_value 'Manual' `
  -only_if (Get-ServiceInfo -DisplayName "Optimize drives").Exist

describe `
  -control "14.69_Performance Counter DLL Host" `
  -item "Verify if Performance Counter DLL Host service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Performance Counter DLL Host").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.70_Performance Logs & Alerts" `
  -item "Verify if Performance Logs & Alerts service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Performance Logs & Alerts").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.71_Plug and Play" `
  -item "Verify if Plug and Play service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Plug and Play").StartType `
  -expected_value 'Manual'

describe `
  -control "14.72_Portable Device Enumerator Service" `
  -item "Verify if Portable Device Enumerator Service service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Portable Device Enumerator Service").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.73_Power" `
  -item "Verify if Power service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Power").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.74_Print Spooler" `
  -item "Verify if Print Spooler service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Print Spooler").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.75_Printer Extensions and Notifications" `
  -item "Verify if Printer Extensions and Notifications service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Printer Extensions and Notifications").StartType `
  -expected_value 'Manual' `
  -only_if (Get-ServiceInfo -DisplayName "Printer Extensions and Notifications").Exist

describe `
  -control "14.76_Problem Reports and Solutions Control Panel Support" `
  -item "Verify if Problem Reports and Solutions Control Panel Support service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Problem Reports and Solutions Control Panel Support").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.77_Protected Storage" `
  -item "Verify if Protected Storage service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Protected Storage").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.78_Remote Access Auto Connection Manager" `
  -item "Verify if Remote Access Auto Connection Manager service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Remote Access Auto Connection Manager").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.79_Remote Access Connection Manager" `
  -item "Verify if Remote Access Connection Manager service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Remote Access Connection Manager").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.80_Remote Desktop Configuration" `
  -item "Verify if Remote Desktop Configuration service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Remote Desktop Configuration").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.81_Remote Desktop Services" `
  -item "Verify if Remote Desktop Services service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Remote Desktop Services").StartType `
  -expected_value 'Manual'

describe `
  -control "14.82_Remote Desktop Services UserMode Port Redirector" `
  -item "Verify if Remote Desktop Services UserMode Port Redirector service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Remote Desktop Services UserMode Port Redirector").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.83_Remote Procedure Call (RPC)" `
  -item "Verify if Remote Procedure Call (RPC) service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Remote Procedure Call (RPC)").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.84_Remote Procedure Call (RPC) Locator" `
  -item "Verify if Remote Procedure Call (RPC) Locator service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Remote Procedure Call (RPC) Locator").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.85_Remote Registry" `
  -item "Verify if Remote Registry service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Remote Registry").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.86_Resultant Set of Policy Provider" `
  -item "Verify if Resultant Set of Policy Provider service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Resultant Set of Policy Provider").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.87_Routing and Remote Access" `
  -item "Verify if Routing and Remote Access service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Routing and Remote Access").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.88_RPC Endpoint Mapper" `
  -item "Verify if RPC Endpoint Mapper service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "RPC Endpoint Mapper").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.89_Secondary Logon" `
  -item "Verify if Secondary Logon service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Secondary Logon").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.90_Secure Socket Tunneling Protocol Service" `
  -item "Verify if Secure Socket Tunneling Protocol Service service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Secure Socket Tunneling Protocol Service").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.91_Security Accounts Manager" `
  -item "Verify if Security Accounts Manager service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Security Accounts Manager").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.92_Server" `
  -item "Verify if Server service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Server").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.93_Shell Hardware Detection" `
  -item "Verify if Shell Hardware Detection service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Shell Hardware Detection").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.94_Simple Mail Transport Protocol (SMTP)" `
  -item "Verify if Simple Mail Transport Protocol (SMTP) service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Simple Mail Transport Protocol (SMTP)").StartType `
  -expected_value 'Disabled' `
  -only_if (Get-ServiceInfo -DisplayName "Simple Mail Transport Protocol (SMTP)").Exist

describe `
  -control "14.95_Smart Card" `
  -item "Verify if Smart Card service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Smart Card").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.96_SNMP Trap" `
  -item "Verify if SNMP Trap service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "SNMP Trap").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.97_Software Protection" `
  -item "Verify if Software Protection service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Software Protection").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.98_Special Administration Console Helper" `
  -item "Verify if Special Administration Console Helper service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Special Administration Console Helper").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.99_Spot Verifier" `
  -item "Verify if Spot Verifier service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "SSpot Verifier").StartType `
  -expected_value 'Manual' `
  -only_if (Get-ServiceInfo -DisplayName "Spot Verifier").Exist

describe `
  -control "14.100_SQL Server VSS Writer" `
  -item "Verify if SQL Server VSS Writer service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "SQL Server VSS Writer").StartType `
  -expected_value 'Manual' `
  -only_if (Get-ServiceInfo -DisplayName "SQL Server VSS Writer").Exist

describe `
  -control "14.101_SSDP Discovery" `
  -item "Verify if SSDP Discovery service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "SSDP Discovery").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.102_Storage Service" `
  -item "Verify if Storage Service service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Storage Service").StartType `
  -expected_value 'Manual' `
  -only_if (Get-ServiceInfo -DisplayName "Storage Service").Exist

describe `
  -control "14.103_Superfetch" `
  -item "Verify if Simple Mail Transport Protocol (SMTP) service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Superfetch").StartType `
  -expected_value 'Manual' `
  -only_if (Get-ServiceInfo -DisplayName "Superfetch").Exist

describe `
  -control "14.104_System Event Notification Service" `
  -item "Verify if System Event Notification Service service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "System Event Notification Service").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.105_System Events Broker" `
  -item "Verify if System Events Broker service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "System Events Broker").StartType `
  -expected_value 'Manual' `
  -only_if (Get-ServiceInfo -DisplayName "System Events Broker").Exist

describe `
  -control "14.106_Task Scheduler" `
  -item "Verify if Task Scheduler service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Task Scheduler").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.107_TCP/IP NetBIOS Helper" `
  -item "Verify if TCP/IP NetBIOS Helper service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "TCP/IP NetBIOS Helper").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.108_Telephony" `
  -item "Verify if Telephony service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Telephony").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.109_Telnet" `
  -item "There is no such thing as Telnet client service" `
  -current_value $null `
  -expected_value $null `
  -only_if $false

describe `
  -control "14.110_Themes" `
  -item "Verify if Themes service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Disabled").StartType `
  -expected_value 'Disabled' `
  -only_if (Get-ServiceInfo -DisplayName "Themes").Exist

describe `
  -control "14.111_Thread Ordering Server" `
  -item "Verify if Thread Ordering Server service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Thread Ordering Server").StartType `
  -expected_value 'Disabled' `

describe `
  -control "14.112_UPnP Device Host" `
  -item "Verify if UPnP Device Host service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "UPnP Device Host").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.113_User Access Logging Service" `
  -item "Verify if User Access Logging Service service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "User Access Logging Service").StartType `
  -expected_value 'Automatic' `
  -only_if (Get-ServiceInfo -DisplayName "User Access Logging Service").Exist

describe `
  -control "14.114_User Profile Service" `
  -item "Verify if User Profile Service service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "User Profile Service").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.115_Virtual Disk" `
  -item "Verify if Virtual Disk service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Virtual Disk").StartType `
  -expected_value 'Manual'

describe `
  -control "14.116_Volume Shadow Copy" `
  -item "Verify if Volume Shadow Copy service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Volume Shadow Copy").StartType `
  -expected_value 'Manual'

describe `
  -control "14.117_WebClient" `
  -item "Verify if WebClient service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "WebClient").StartType `
  -expected_value 'Disabled' `
  -only_if (Get-ServiceInfo -DisplayName "WebClient").Exist

describe `
  -control "14.118_Windows Audio" `
  -item "Verify if Windows Audio service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Windows Audio").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.119_Windows Audio Endpoint Builder" `
  -item "Verify if Windows Audio Endpoint Builder service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Windows Audio Endpoint Builder").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.120_Windows Color System" `
  -item "Verify if Windows Color System service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Windows Color System").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.121_Windows Driver Foundation - User-mode Driver Framework" `
  -item "Verify if Windows Driver Foundation - User-mode Driver Framework service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Windows Driver Foundation - User-mode Driver Framework").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.122_Windows Error Reporting Service" `
  -item "Verify if Windows Error Reporting Service service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Windows Error Reporting Service").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.123_Windows Event Collector" `
  -item "Verify if Windows Event Collector service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Windows Event Collector").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.124_Windows Event Log" `
  -item "Verify if Windows Event Log service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Windows Event Log").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.125_Windows Firewall" `
  -item "Verify if Windows Firewall service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Windows Firewall").StartType `
  -expected_value 'Automatic' `
  -only_if (Get-ServiceInfo -DisplayName "Windows Firewall").Exist

describe `
  -control "14.126_Windows Font Cache Service" `
  -item "Verify if Windows Font Cache Service service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Windows Font Cache Service").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.127_Windows Image Acquisition (WIA)" `
  -item "Verify if Windows Image Acquisition (WIA) service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Windows Image Acquisition (WIA)").StartType `
  -expected_value 'Disabled' `
  -only_if (Get-ServiceInfo -DisplayName "Windows Image Acquisition (WIA)").Exist
  
describe `
  -control "14.128_Windows Installer" `
  -item "Verify if Windows Installer service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Windows Installer").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.129_Windows Management Instrumentation" `
  -item "Verify if Windows Management Instrumentation service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Windows Management Instrumentation").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.130_Windows Modules Installer" `
  -item "Verify if Windows Modules Installer service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Windows Modules Installer").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.131_Windows Presentation Foundation Font Cache 3.0.0.0" `
  -item "Verify if Windows Presentation Foundation Font Cache 3.0.0.0 service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Windows Presentation Foundation Font Cache 3.0.0.0").StartType `
  -expected_value 'Manual'

describe `
  -control "14.132_Windows Process Activation Service" `
  -item "Verify if Windows Process Activation Service service startup type is Manual" `
  -current_value (Get-ServiceInfo -DisplayName "Windows Process Activation Service").StartType `
  -expected_value 'Manual' `
  -only_if (Get-ServiceInfo -DisplayName "Windows Process Activation Service").Exist

describe `
  -control "14.133_Windows Remote Management (WS-Management)" `
  -item "Verify if Windows Remote Management (WS-Management) service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Windows Remote Management (WS-Management)").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.134_Windows Search" `
  -item "Verify if Windows Search service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Windows Search").StartType `
  -expected_value 'Disabled' `
  -only_if (Get-ServiceInfo -DisplayName "Windows Search").Exist

describe `
  -control "14.135_Windows Store Service (WSService)" `
  -item "Verify if Windows Store Service (WSService) service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Windows Store Service (WSService)").StartType `
  -expected_value 'Disabled' `
  -only_if (Get-ServiceInfo -DisplayName "Windows Store Service (WSService)").Exist

describe `
  -control "14.136_Windows Time" `
  -item "Verify if Windows Time service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Windows Time").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.137_Windows Update" `
  -item "Verify if Windows Update service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Windows Update").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.138_WinHTTP Web Proxy Auto-Discovery Service" `
  -item "Verify if WinHTTP Web Proxy Auto-Discovery Service service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "WinHTTP Web Proxy Auto-Discovery Service").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.139_Wired AutoConfig" `
  -item "Verify if Wired AutoConfig service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "Wired AutoConfig").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.140_WMI Performance Adapter" `
  -item "Verify if WMI Performance Adapter service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "WMI Performance Adapter").StartType `
  -expected_value 'Disabled'

describe `
  -control "14.141_Workstation" `
  -item "Verify if Workstation service startup type is Automatic" `
  -current_value (Get-ServiceInfo -DisplayName "Workstation").StartType `
  -expected_value 'Automatic'

describe `
  -control "14.142_World Wide Web Publishing Service" `
  -item "Verify if World Wide Web Publishing Service service startup type is Disabled" `
  -current_value (Get-ServiceInfo -DisplayName "World Wide Web Publishing Service").StartType `
  -expected_value 'Disabled' `
  -only_if (Get-ServiceInfo -DisplayName "World Wide Web Publishing Service").Exist

describe `
  -control "14.143 Ensure unnecessary TCP/IP Services does not exist - EnableTcpChargen" `
  -item "EnableTcpChargen does not exist" `
  -current_value (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Services\SimpTcp' -Key 'EnableTcpChargen').KeyExist `
  -expected_value $false
  
describe `
  -control "14.143 Ensure unnecessary TCP/IP Services does not exist - EnableTcpDaytime" `
  -item "EnableTcpDaytime does not exist" `
  -current_value (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Services\SimpTcp' -Key 'EnableTcpDaytime').KeyExist `
  -expected_value $false

describe `
  -control "14.143 Ensure unnecessary TCP/IP Services does not exist - EnableTcpDiscard" `
  -item "EnableTcpDiscard does not exist" `
  -current_value (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Services\SimpTcp' -Key 'EnableTcpDiscard').KeyExist `
  -expected_value $false
  
describe `
  -control "14.143 Ensure unnecessary TCP/IP Services does not exist - EnableTcpEcho" `
  -item "EnableTcpEcho does not exist" `
  -current_value (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Services\SimpTcp' -Key 'EnableTcpEcho').KeyExist `
  -expected_value $false

describe `
  -control "14.143 Ensure unnecessary TCP/IP Services does not exist - EnableTcpQotd" `
  -item "EnableTcpQotd does not exist" `
  -current_value (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Services\SimpTcp' -Key 'EnableTcpQotd').KeyExist `
  -expected_value $false
  
describe `
  -control "14.143 Ensure unnecessary TCP/IP Services does not exist - EnableUdpChargen" `
  -item "EnableUdpChargen does not exist" `
  -current_value (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Services\SimpTcp' -Key 'EnableUdpChargen').KeyExist `
  -expected_value $false
  
describe `
  -control "14.143 Ensure unnecessary TCP/IP Services does not exist - EnableUdpDaytime" `
  -item "EnableUdpDaytime does not exist" `
  -current_value (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Services\SimpTcp' -Key 'EnableUdpDaytime').KeyExist `
  -expected_value $false
  
describe `
  -control "14.143 Ensure unnecessary TCP/IP Services does not exist - EnableUdpDiscard" `
  -item "EnableUdpDiscard does not exist" `
  -current_value (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Services\SimpTcp' -Key 'EnableUdpDiscard').KeyExist `
  -expected_value $false

describe `
  -control "14.143 Ensure unnecessary TCP/IP Services does not exist - EnableUdpEcho" `
  -item "EnableUdpEcho does not exist" `
  -current_value (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Services\SimpTcp' -Key 'EnableUdpEcho').KeyExist `
  -expected_value $false
  
describe `
  -control "14.143 Ensure unnecessary TCP/IP Services does not exist - EnableUdpQot" `
  -item "EnableUdpQot does not exist" `
  -current_value (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Services\SimpTcp' -Key 'EnableUdpQot').KeyExist `
  -expected_value $false
