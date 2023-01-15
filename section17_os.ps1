describe `
  -control "17.1 Ensure Windows native auditing feature for '%Systemdrive' is set to 'Everyone group, Failure checkbox for Delete, Change permission, Take ownership'" `
  -item "'%Systemdrive' has Everyone: Failure checkboxes for the 'Delete, Change permission, and Take ownership'" `
  -current_value (Test-FolderACL -Path 'C:\' -AclReference @('Everyone', 'Failure', 'Delete', 'ChangePermissions', 'TakeOwnership')) `
  -expected_value $true

describe `
  -control "17.2 Ensure Windows native auditing feature for 'HKLM\Software' is set to 'Everyone group, Failure checkbox for Delete, Change permission, Take ownership'" `
  -item "'HKLM\Software' has Everyone: Failure checkboxes for the 'Delete, Change permission, and Take ownership'" `
  -current_value (Test-FolderACL -Path 'HKLM:\Software' -AclReference @('Everyone', 'Failure', 'Delete', 'ChangePermissions', 'TakeOwnership')) `
  -expected_value $true

describe `
  -control "17.3 Ensure Windows native auditing feature for 'HKLM\System' is set to 'Everyone group, Failure checkbox for Delete, Change permission, Take ownership'" `
  -item "'HKLM\System' has Everyone: Failure checkboxes for the 'Delete, Change permission, and Take ownership'" `
  -current_value (Test-FolderACL -Path 'HKLM:\System' -AclReference @('Everyone', 'Failure', 'Delete', 'ChangePermissions', 'TakeOwnership')) `
  -expected_value $true
