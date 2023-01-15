
function Get-RegistryKeyInfo()
{
  Param(
    [parameter(Mandatory=$true)]
    $Path, 
    [parameter(Mandatory=$false)]
    $Key = $null
    )

  $hive = $path.Split("\")[0]
  $sub_path = $path.Substring($hive.Length + 1)

  $hive_alias = switch ($hive) {
    "HKEY_CLASSES_ROOT" { "HKCR" }
    "HKEY_CURRENT_USER" { "HKCR" }
    "HKEY_LOCAL_MACHINE" { "HKLM" }
    "HKEY_USERS" { "HKU"  }
    "HKEY_CURRENT_CONFIG" { "HKCC" }
    Default { $hive }
  }

  $val = @{
    PathExist = $false
    KeyExist = $false
    Value = $null
  }

    if($hive_alias)
    {
    try {
      if(Get-ItemProperty -Path ($hive_alias + ':\' + $sub_path) -ErrorAction SilentlyContinue)
      {
        $val.PathExist = $true

        function Get-RegValue([String] $KeyPath, [String] $Name)
        {
          $RegValue = (Get-ItemProperty -LiteralPath $KeyPath -Name $Name -ErrorAction SilentlyContinue -ErrorVariable err_var).$Name
          if(-not [string]::IsNullOrEmpty($err_var))
          {
            return $null
          }
          else
          {
            return $RegValue
          }
        } 

        $reg_key = Get-RegValue -KeyPath ($hive_alias + ':\' + $sub_path) -Name $key  
        if($null -ne $reg_key)
        {
          $val.KeyExist = $true
          $val.Value = $reg_key
        }
      }
    }
    catch {
      # $val = "#error"
    }
  } 
  Write-Output (New-Object -TypeName PSObject -Prop $val)
}
