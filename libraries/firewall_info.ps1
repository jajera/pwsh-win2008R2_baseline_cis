function Get-NetFirewallInfo()
{
  Param(
    [parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateSet('Current', 'Domain', 'Private', 'Public')]
    $ProfileName
  )

  $Profile0 = switch ($ProfileName) {
    "Current" { 'currentprofile'; break}
    "Domain"  { 'domainprofile'; break}
    "Private" { 'privateprofile'; break}
    "Public"  { 'publicprofile'; break}
  }

  $val = @{
    AllowLocalIPsecRules = ''
    AllowLocalFirewallRules = ''
    AllowUnicastResponseToMulticast = ''
    DefaultInboundAction = ''
    DefaultOutboundAction = ''
    Enabled = $false
    LogFileName = ''
    LogMaxSizeKilobytes = ''
    NotifyOnListen = ''
  }

  $cmd = netsh advfirewall show $Profile0
  $FirewallPolicy = ((($cmd | Select-String -Pattern "^Firewall Policy").line -split '  ')[-1]).Trim()

  #Inbound
  if($FirewallPolicy -like '*blockinboundalways*') { $Inbound = 'BlockAlways' }
  elseif($FirewallPolicy -like '*blockinbound*') { $Inbound = 'Block' }
  elseif($FirewallPolicy -like '*allowinbound*') { $Inbound = 'Allow' }
  elseif($FirewallPolicy -like '*notconfigured*') { $Inbound = 'NotConfigured' }

  #Outbound
  if($FirewallPolicy -like '*blockoutbound*') { $Outbound = 'Block' }
  elseif($FirewallPolicy -like '*allowoutbound*') { $Outbound = 'Allow' }
  elseif($FirewallPolicy -like '*notconfigured*') { $Outbound = 'NotConfigured' }

  #Multicast
  $UnicastResponseToMulticast = ((($cmd | Select-String -Pattern "^UnicastResponseToMulticast").line -split '  ')[-1]).Trim()

  if($UnicastResponseToMulticast -like '*Enable*') { $AllowUnicastResponseToMulticast = $true }
  elseif($UnicastResponseToMulticast -like '*Disable*') { $AllowUnicastResponseToMulticast = $false }
  elseif($UnicastResponseToMulticast -like '*notconfigured*') { $AllowUnicastResponseToMulticast = 'NotConfigured' }

  #AllowLocalFirewallRules
  $LocalFirewallRules = ((($cmd | Select-String -Pattern "^LocalFirewallRules").line -split '  ')[-1]).Trim()

  if($LocalFirewallRules -like '*Enable*') { $AllowLocalFirewallRules = $true }
  elseif($LocalFirewallRules -like '*Disable*') { $AllowLocalFirewallRules = $false }
  elseif($LocalFirewallRules -like '*N/A (GPO-store only)*') { $AllowLocalFirewallRules = 'NotConfigured' }

  #AllowLocalIPsecRules
  $LocalIPsecRules = ((($cmd | Select-String -Pattern "^LocalConSecRules").line -split '  ')[-1]).Trim()

  if($LocalIPsecRules -like '*Enable*') { $AllowLocalIPsecRules = $true }
  elseif($LocalIPsecRules -like '*Disable*') { $AllowLocalIPsecRules = $false }
  elseif($LocalIPsecRules -like '*N/A (GPO-store only)*') { $AllowLocalIPsecRules = 'NotConfigured' }

  #AllowUserNotification
  $UserNotification = ((($cmd | Select-String -Pattern "^InboundUserNotification").line -split '  ')[-1]).Trim()

  if($UserNotification -like '*Enable*') { $AllowUserNotification = $true }
  elseif($UserNotification -like '*Disable*') { $AllowUserNotification = $false }
  elseif($UserNotification -like '*N/A (GPO-store only)*') { $AllowUserNotification = 'NotConfigured' }

  $val.Enabled = if(((($cmd | Select-String -Pattern "^State").line -split '  ')[-1]).Trim() -eq 'ON') { $true }
  $val.LogFileName = ((($cmd | Select-String -Pattern "^FileName").line -split '  ')[-1]).Trim()
  $val.LogMaxSizeKilobytes = ((($cmd | Select-String -Pattern "^MaxFileSize").line -split '  ')[-1]).Trim()
  $val.AllowUnicastResponseToMulticast = $AllowUnicastResponseToMulticast
  $val.DefaultInboundAction = $Inbound
  $val.DefaultOutboundAction = $Outbound
  $val.AllowLocalIPsecRules = $AllowLocalIPsecRules
  $val.AllowLocalFirewallRules = $AllowLocalFirewallRules
  $val.NotifyOnListen = $AllowUserNotification

  Write-Output (New-Object -TypeName PSObject -Prop $val)
}
