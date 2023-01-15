
function Get-User {
  Param(
    [parameter(Mandatory=$true)]
    $User
  )

  $QueryUser = Get-CimInstance -Class Win32_UserAccount | Where-Object {$_.AccountType -eq 512 -and $_.Name -eq $user}
  $exist = $false

  if($null -ne $QueryUser) { $exist = $true }

  $val = @{
    Enabled = if($exist){ -not $QueryUser.Disabled[0] } else { $null }
    Exist = $exist
    FullName = if($exist){ $QueryUser.FullName[0] } else { $null }
    Lockout = if($exist){ $QueryUser.Lockout[0] } else { $null }
    PasswordChangeable = if($exist){ $QueryUser.PasswordChangeable[0] } else { $null }
    PasswordRequired = if($exist){ $QueryUser.PasswordRequired[0] } else { $null }
  }

  Write-Output (New-Object -TypeName PSObject -Prop $val)
}
