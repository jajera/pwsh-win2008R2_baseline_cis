function Get-FeatureInfo {
  Param(
    [parameter(Mandatory=$true)]
    $Name
  )

  $cmd = dism /online /get-featureinfo /featurename:$Name

  $val = @{
    Exist = $false
    FeatureName = $null
    DisplayName = $null
    Description = $null
    Enabled = $false
  }
  
  if((-not[string]::IsNullOrWhiteSpace($cmd)) -and (-not (($cmd -join '') -like '*Error: 0x800f080c*')) -and (-not (($cmd -join '') -like '*Error: 87*'))) 
  { 
    $val.Exist = $true
    $val.FeatureName = if($exist){ (($cmd | Select-String -Pattern "^Feature Name").line -split ':')[1].Trim() } else { $null }
    $val.DisplayName = if($exist){ (($cmd | Select-String -Pattern "^Display Name").line -split ':')[1].Trim() } else { $null }
    $val.Description = if($exist){ (($cmd | Select-String -Pattern "^Description").line -split ':')[1].Trim() } else { $null }
    $val.Enabled = if($exist){ (($cmd | Select-String -Pattern "^Description").line -split ':')[1].Trim() -eq 'Enabled' } else { $false }
  }

  Write-Output (New-Object -TypeName PSObject -Prop $val)
}
