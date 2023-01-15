describe `
  -control "16.1 Ensure that the POSIX subsystem has been removed" `
  -item "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Subsystems\Posix path_exist" `
  -current_value (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Subsystems\Posix' -Key '').PathExist `
  -expected_value $false
