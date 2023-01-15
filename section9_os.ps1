describe_dual_duo_all `
  -control "9.1 (L1) Ensure 'Always install with elevated privileges' is set to 'Disabled'" `
  -item1 "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstallElevated key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer' -Key 'AlwaysInstallElevated').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstallElevated value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer' -Key 'AlwaysInstallElevated').Value `
  -expected_value2 0
