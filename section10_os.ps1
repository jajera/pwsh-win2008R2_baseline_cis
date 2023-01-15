$UserHives = Get-ChildItem Registry::HKEY_USERS | Where-Object {$_.Name -match '^HKEY_USERS\\S-1-5-21-[\d\-]+$'}

foreach($Hive in $UserHives)
{
  $Path = Join-Path $Hive.PSPath "Software\Policies\Microsoft\Windows\Control Panel\Desktop"
  $Key = 'ScreenSaveActive'
  $Item = Get-ItemProperty -Path $Path -Name $Key -ErrorAction SilentlyContinue
  $ItemValue = ""
  $Exist = $false

  if($Item) 
  {
    $ItemValue = (Get-RegistryKeyInfo -Path $Path -Key $Key).Value
    $Exist = $true
  }

  describe_single_duo_one `
    -control "10.1 (L1) Ensure 'Enable screen saver' is set to 'Enabled'" `
    -item1 "$($Path)\$($Key) key_exist" `
    -current_value1 $Exist `
    -expected_value1 $false `
    -item2 "$($Path)\$($Key) key_value" `
    -current_value2 $ItemValue `
    -expected_value2 1
}

foreach($Hive in $UserHives)
{
  $Path = Join-Path $Hive.PSPath "Software\Policies\Microsoft\Windows\Control Panel\Desktop"
  $Key = 'ScreenSaverIsSecure'
  $Item = Get-ItemProperty -Path $Path -Name $Key -ErrorAction SilentlyContinue
  $ItemValue = ""
  $Exist = $false

  if($Item) 
  {
    $ItemValue = (Get-RegistryKeyInfo -Path $Path -Key $Key).Value
    $Exist = $true
  }

  describe_single_duo_one `
    -control "10.2 (L1) Password protect for Screen Saver is set to 'Enabled'" `
    -item1 "$($Path)\$($Key) key_exist" `
    -current_value1 $Exist `
    -expected_value1 $false `
    -item2 "$($Path)\$($Key) key_value" `
    -current_value2 $ItemValue `
    -expected_value2 1
}

foreach($Hive in $UserHives)
{
  $Path = Join-Path $Hive.PSPath "Software\Policies\Microsoft\Windows\Control Panel\Desktop"
  $Key = 'ScreenSaveTimeOut'
  $Item = Get-ItemProperty -Path $Path -Name $Key -ErrorAction SilentlyContinue
  $ItemValue = ""
  $Exist = $false

  if($Item) 
  {
    $ItemValue = (Get-RegistryKeyInfo -Path $Path -Key $Key).Value
    $Exist = $true
  }

  describe_single_duo_one `
    -control "10.3 (L1) Ensure 'Screen saver timeout' is set to 'Enabled: 15 minutes'" `
    -item1 "$($Path)\$($Key) key_exist" `
    -current_value1 $Exist `
    -expected_value1 $false `
    -item2 "$($Path)\$($Key) key_value" `
    -current_value2 $ItemValue `
    -expected_value2 900
}
