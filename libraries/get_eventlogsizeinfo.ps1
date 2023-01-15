function Get-EventLogSizeInfo()
{
  Param(
    [parameter(Mandatory=$true)]
    $DisplayName
  )

  $ELInfo = Get-EventLog -List | Where-Object { $_.LogDisplayName -eq $DisplayName }
  $exist = $false

  if($null -ne $ELInfo) { $exist = $true}
  

  $val = @{
    EnableRaisingEvents = if($exist){ $ELInfo.EnableRaisingEvents } else { $null }
    Exist = $exist
    MaximumKilobytes = if($exist){ $ELInfo.MaximumKilobytes } else { $null }
    MinimumRetentionDays = if($exist){ $ELInfo.MinimumRetentionDays } else { $null }
    OverflowAction = if($exist){ $ELInfo.OverflowAction } else { $null }
  }
  Write-Output (New-Object -TypeName PSObject -Prop $val)
}
