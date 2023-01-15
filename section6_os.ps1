
describe_dual_duo_all `
  -control "6.1 (L1) Ensure 'Turn off Autoplay' is set to 'Enabled: All drives'" `
  -item1 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDriveTypeAutoRun key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Key 'NoDriveTypeAutoRun').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDriveTypeAutoRun value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer' -Key 'NoDriveTypeAutoRun').Value `
  -expected_value2 255
