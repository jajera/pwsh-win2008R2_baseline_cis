describe_dual_duo_all `
  -control "8.1 (L1) Ensure 'Set client connection encryption level' is set to 'Enabled: High'" `
  -item1 "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\MinEncryptionLevel key_exist" `
  -current_value1 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Key 'MinEncryptionLevel').KeyExist `
  -expected_value1 $true `
  -item2 "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\MinEncryptionLevel value" `
  -current_value2 (Get-RegistryKeyInfo -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -Key 'MinEncryptionLevel').Value `
  -expected_value2 3
