describe `
  -control "13.1 Determine who holds the password for the default administrative account and if this is consistent with the security policy" `
  -item "No tests defined for this control" `
  -current_value "" `
  -expected_value "" `
  -only_if $false

describe `
  -control "13.2 Identify all other administrative accounts. Determine who the responsible parties are for each of these accounts. All admin accounts should be assigned to an owner who will be responsible for the account. There should be no excessive or unnecessary accounts" `
  -item "No tests defined for this control" `
  -current_value "" `
  -expected_value "" `
  -only_if $false

describe `
  -control "13.3 All service accounts must be clearly defined" `
  -item "No tests defined for this control" `
  -current_value "" `
  -expected_value "" `
  -only_if $false

describe `
  -control "13.4 All default application passwords should be changed upon installation of applications" `
  -item "No tests defined for this control" `
  -current_value "" `
  -expected_value "" `
  -only_if $false

describe `
  -control "13.5 All default application passwords should be changed upon installation of applications" `
  -item "No tests defined for this control" `
  -current_value "" `
  -expected_value "" `
  -only_if $false

describe `
  -control "13.6 Ensure 'Remove default password for automatic logon'" `
  -item "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\DefaultPassword key_exist" `
  -current_value (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Key 'DefaultPassword').KeyExist `
  -expected_value $false 
