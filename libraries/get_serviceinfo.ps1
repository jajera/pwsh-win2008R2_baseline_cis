function Get-ServiceInfo {
  Param(
  [Parameter(ParameterSetName = 'name')]
  [string]$Name,
  
  [Parameter(ParameterSetName = 'display')]
  [string]$DisplayName
  )

  if($PSCmdlet.ParameterSetName -eq 'name')
  {
    $service_info = Get-Service -Name $Name -ErrorAction SilentlyContinue
  }
  else 
  {
    $service_info = Get-Service -DisplayName $DisplayName -ErrorAction SilentlyContinue
  }

  $exist = $false

  if($null -ne $service_info) { $exist = $true }

  $val = @{
    BinaryPathName = if($exist){ $service_info.BinaryPathName } else { $null } 
    CanPauseAndContinue = if($exist){ $service_info.CanPauseAndContinue } else { $null }
    CanShutdown = if($exist){ $service_info.CanShutdown } else { $null }
    CanStop = if($exist){ $service_info.CanStop } else { $null }
    DependentServices = if($exist){ ($service_info.DependentServices | Sort-Object) -join ',' } else { $null }
    Exist = $exist
    StartType = if($exist){ $service_info.StartType } else { $null }
    Status = if($exist){ $service_info.Status } else { $null }
    ServicesDependedOn = if($exist){ ($service_info.ServicesDependedOn | Sort-Object) -join ',' } else { $null }
  }

  Write-Output (New-Object -TypeName PSObject -Prop $val)
}
