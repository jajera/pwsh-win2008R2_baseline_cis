function Get-InstalledSoftware {
  Param(
    [parameter(Mandatory=$true)]
    $Name
  )

  $search_paths = @('HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*',
    'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*')

  if([Environment]::Is64BitOperatingSystem) 
  {
    $search_paths += @('HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
    'HKCU:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*')
  }

  Get-ItemProperty $search_paths -ErrorAction SilentlyContinue `
    | Where-Object {$_.DisplayName -match $Name -or $_.PSChildName -match $Name} `
    | Select-Object -Property DisplayName,DisplayVersion,InstallDate,InstallLocation,Publisher,EstimatedSize
}
