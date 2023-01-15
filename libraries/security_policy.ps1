### must be run with administrator rights
function Get-SecurityPolicy([string]$sec_pol_name)
{
  #export filename
  $export_file = "win_secpol-$($PID).cfg"

  #export the security policy using SECEDIT to temp file
  $export_task = Start-Process -FilePath secedit.exe -ArgumentList "/export /cfg $($export_file)" -PassThru -NoNewWindow -Wait

  if($export_task.ExitCode -ne 0)
  {
    Write-Error "Fail to export security policy with return code $($export_task.ExitCode)"    
  }
  
  #load security policy from temp file
  $user_rights_list = Get-Content $export_file

  #delete temp file
  if(Test-Path $export_file) { Remove-Item $export_file -Force }
  
  $sec_pol_val = ($user_rights_list | Select-String -Pattern "^$sec_pol_name").line
  $user_list = @()
  
  if($null -ne $sec_pol_val)
  {
    $sec_pol_val = ($sec_pol_val -replace $sec_pol_name,'' -replace '[=]','').Trim()
    $user_raw_list = $sec_pol_val.Split(',',[System.StringSplitOptions]::RemoveEmptyEntries) 

    foreach($user in $user_raw_list)
    {
      if($null -ne $user){
      if($user.Contains('*S'))
      {
        try
        {
          $user_list += (New-Object System.Security.Principal.SecurityIdentifier ($user -replace '[*]', '')).Translate([System.Security.Principal.NTAccount]).Value
        }
        catch
        {
          $user_list += $user -replace '[*]', ''
        }
      }
      else 
      {
        $user_list += $user
      }}
    }
  }
  return ($user_list | Sort-Object) -join ','
}
