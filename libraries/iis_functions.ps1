function Get-AppCmdPath()
{
  if(Test-Path 'C:\Windows\System32\inetsrv\appcmd.exe')
  {
    $path = 'C:\Windows\System32\inetsrv\appcmd.exe'
  }
  elseif(Test-Path 'C:\Windows\SysWOW64\inetsrv\appcmd.exe')
  {
    $path = 'C:\Windows\SysWOW64\inetsrv\appcmd.exe'
  }
  else 
  {
    throw "Appcmd.exe was not found!"
  }
  return $path
}

function Get-IISSites()
{
  $cmd = cmd /c "$(Get-AppCmdPath) list site"

  $IISSiteNames = @()
  foreach($IISSite in $cmd)
  {
    $IISSiteNames += $IISSite.Split('"')[1]
  }

  return $IISSiteNames
}

Get-IISSiteHostHeader
{
  Param (
    [Parameter(Mandatory=$True)]
    [ValidateNotNullOrEmpty()]
      $Site = "Default Web Site"
  )

  if(Test-Path 'C:\Windows\System32\inetsrv\appcmd.exe')
  {
    $cmd = C:\Windows\System32\inetsrv\appcmd.exe list site $Site /xml
  }
  elseif(Test-Path 'C:\Windows\SysWOW64\inetsrv\appcmd.exe')
  {
    $cmd = C:\Windows\SysWOW64\inetsrv\appcmd.exe list site $Site /xml
  }
  else 
  {
    throw "Appcmd.exe was not found!"
  }

  [xml]$Config = $cmd

  $http_bindings = $Config.appcmd.SITE.bindings
  $null_header = $false
  
  foreach($http_binding in $http_bindings.Split(','))
  {
    if($http_binding.split(':')[2] -eq "")
    {
      $null_header = $true
      break
    }
  }
  
  return $null_header
}

function Get-IISSiteSetting()
{
  Param (
    [Parameter(Mandatory=$False)]
    [ValidateNotNullOrEmpty()]
      $Site = 'Default Web Site',

    [Parameter(Mandatory=$True)]
    [ValidateNotNullOrEmpty()]
      $Section,

    [Parameter(Mandatory=$True)]
    [ValidateNotNullOrEmpty()]
    [ValidateSet('AllowDoubleEscaping', 'AllowUnlistedVerb', 'AllowUnlistedFileExtension', 'AllowHighBitCharacters', `
        'MaxAllowedContentLength', 'MaxQueryString', 'MaxUrl', 'DenyByConcurrentRequests', 'DenyByRequestRate', 'AllowVerbTrace', `
        'AllowWriteOnExecuteOrScript', 'NotListedIsapisAllowed', 'NotListedCgisAllowed', 'AllowAuthorizationAllUsers', `
        'DefaultIISLogDirectory', 'DefaultIISLoggingEnabled', 'VirtualPathInSystemDrive', `
        'AllowSiteDirectoryBrowse', 'AnonymousAuthenticationUser', 'AnonymousAuthenticationEnabled', 'FormsAuthenticationEnabled', `
        'FormsAuthenticationRequireSSL', 'FormsAuthenticationUseCookies', 'FormsAuthenticationCookiesProtection', `
        'FormsAuthenticationPasswordFormat', 'FormsAuthenticationCredentialsDefined', 'DenyAuthorizationAllUsers', `
        'AllowAuthorizationAdministrators', 'FormsAuthentication', 'RequireSSL', 'FtpSslControlChannel', 'FtpSslDataChannel', `
        'FtpAuthenticationDenyByFailure', 'HttpHstsHeader', 'LoggingEventFormat', 'LoggingEventDestination', `
        'AspDeploymentRetail', 'AspEnableDebug', 'AspCustomErrorMsg', 'AspErrorMode', 'AspTracingEnabled', `
        'AspEnableHttpOnlyCookies', 'AspMachineKey', 'AspTrustLevel', 'AspSessionStateUseCookies')]
      $Item
    )

  if(Test-Path 'C:\Windows\System32\inetsrv\appcmd.exe')
  {
    $cmd = C:\Windows\System32\inetsrv\appcmd.exe list config $Site /section:$($Section)
  }
  elseif(Test-Path 'C:\Windows\SysWOW64\inetsrv\appcmd.exe')
  {
    $cmd = C:\Windows\SysWOW64\inetsrv\appcmd.exe list config $Site /section:$Section
  }
  else 
  {
    throw "Appcmd.exe was not found!"
  }

  [xml]$Config = $cmd

  if($Item -eq 'AllowDoubleEscaping')
  {
    #allow_double_escaping
    if($Config.'system.webServer'.security.requestFiltering.allowDoubleEscaping -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'AllowUnlistedVerb')
  {
    #allow_unlisted_verb
    if($Config.'system.webServer'.security.requestFiltering.verbs.allowUnlisted -eq $false)
    {
      return $false
    }
    else
    {
      return $true
    }
  }
  elseif($Item -eq 'AllowUnlistedFileExtension')
  {
    #allow_unlisted_file_extension
    if($Config.'system.webServer'.security.requestFiltering.fileExtensions.allowUnlisted -eq $false)
    {
      return $false
    }
    else
    {
      return $true
    }
  }
  elseif($Item -eq 'AllowHighBitCharacters')
  {
    #allow_high_bit_characters
    if($Config.'system.webServer'.security.requestFiltering.allowHighBitCharacters -eq $false)
    {
      return $false
    }
    else
    {
      return $true
    }
  }
  elseif($Item -eq 'MaxAllowedContentLength')
  {
    #max_allowed_content_length
    if($null -eq $Config.'system.webServer'.security.requestFiltering.requestLimits.maxAllowedContentLength)
    {
      return 30000000
    }
    else
    {
      return $Config.'system.webServer'.security.requestFiltering.requestLimits.maxAllowedContentLength
    }
  }
  elseif($Item -eq 'MaxQueryString')
  {
    #max_query_string
    if($null -eq $Config.'system.webServer'.security.requestFiltering.requestLimits.maxQueryString)
    {
      return 2048
    }
    else
    {
      return $Config.'system.webServer'.security.requestFiltering.requestLimits.maxQueryString
    }
  }
  elseif($Item -eq 'MaxUrl')
  {
    #max_url
    if($null -eq $Config.'system.webServer'.security.requestFiltering.requestLimits.maxUrl)
    {
      return 4096
    }
    else
    {
      return $Config.'system.webServer'.security.requestFiltering.requestLimits.maxUrl
    }
  }
  elseif($Item -eq 'AllowVerbTrace')
  {
    #allow_verb_trace
    if(($Config.'system.webServer'.security.requestFiltering.verbs.add | Where-Object {$_.verb -eq 'TRACE'}).allowed -eq 'false')
    {
      return $false
    }
    else
    {
      return $true
    }
  }
  elseif($Item -eq 'DenyByConcurrentRequests')
  {
    #deny_by_concurrent_requests
    if($Config.'system.webServer'.security.dynamicIpSecurity.denyByConcurrentRequests.enabled -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'DenyByRequestRate')
  {
    #deny_ip_based_on_requests_rate
    if($Config.'system.webServer'.security.dynamicIpSecurity.denyByRequestRate.enabled -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'AllowWriteOnExecuteOrScript')
  {
    #allow_write_on_execute_or_script
    $HandlerActions = $Config.'system.webServer'.handlers.accessPolicy.Replace(' ', '').Split(',')

    if(($HandlerActions.Contains('Script') -or $HandlerActions.Contains('Execute')) -and $HandlerActions.Contains('Write'))
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'NotListedIsapisAllowed')
  {
    #not_listed_isap_is_allowed
    if($Config.'system.webServer'.security.isapiCgiRestriction.notListedIsapisAllowed -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'NotListedCgisAllowed')
  {
    #not_listed_cgi_is_allowed
    if($Config.'system.webServer'.security.isapiCgiRestriction.notListedCgisAllowed -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'DefaultIISLogDirectory')
  {
    #default_iis_log_directory
    return $Config.'system.applicationHost'.sites.siteDefaults.logFile.directory
  }
  elseif($Item -eq 'DefaultIISLoggingEnabled')
  {
    #default_iis_logging_enabled
    if($Config.'system.webServer'.httpLogging.dontLog -eq $false)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'VirtualPathInSystemDrive')
  {
    #virtual_path_in_system_drive
    $virtual_dir_path = (($Config.'system.applicationHost'.sites.site | Where-Object {$_.name -eq $Site}).application | `
    Where-Object {$_.path -eq '/'}).virtualDirectory.physicalPath

    if($virtual_dir_path.StartsWith('%SystemDrive%') -or ($virtual_dir_path.StartsWith((Get-WmiObject Win32_OperatingSystem).SystemDrive)))
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'AllowSiteDirectoryBrowse')
  {
    #allow_site_directory_browse
    if($Config.'system.webServer'.directoryBrowse.enabled -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'AnonymousAuthenticationUser')
  {
    #anonymous_authentication_user
    return $Config.'system.webServer'.security.authentication.anonymousAuthentication.userName
  }
  elseif($Item -eq 'AnonymousAuthenticationEnabled')
  {
    #anonymous_authentication_enabled
    if($Config.'system.webServer'.security.authentication.anonymousAuthentication.enabled -eq $false)
    {
      return $false
    }  
    else
    {
      return $true
    }
  }
  elseif($Item -eq 'FormsAuthenticationEnabled')
  {
    #forms_authentication_enabled
    if($Config.'system.web'.authentication.mode -eq 'Forms')
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'FormsAuthenticationRequireSSL')
  {
    #forms_authentication_require_ssl
    if($Config.'system.web'.authentication.forms.requireSSL -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'FormsAuthenticationUseCookies')
  {
    #forms_authentication_use_cookies
    if($Config.'system.web'.authentication.forms.cookieless -eq 'UseCookies')
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'FormsAuthenticationCookiesProtection')
  {
    #forms_authentication_cookies_protection
    if($Config.'system.web'.authentication.forms.protection -eq 'All' -or $null -eq $Config.'system.web'.authentication.forms.protection)
    {
      return 'All'
    }
    else
    {
      return $Config.'system.web'.authentication.forms.protection
    }
  }
  elseif($Item -eq 'FormsAuthenticationPasswordFormat')
  {
    #forms_authentication_password_format
    if($null -eq $Config.'system.web'.authentication.forms.credentials.passwordFormat)
    {
      return 'SHA1'
    }
    else
    {
      return $Config.'system.web'.authentication.forms.credentials.passwordFormat
    }
  }
  elseif($Item -eq 'FormsAuthenticationCredentialsDefined')
  {
    #forms_authentication_credentials_defined
    return ($Config.'system.web'.authentication.forms.credentials.user).name -join ','
  }
  elseif($Item -eq 'DenyAuthorizationAllUsers')
  {
    #deny_authorization_all_users
    if($null -ne ($Config.'system.webServer'.security.authorization.add | Where-Object {$_.accessType -eq 'Deny' -and $_.users -eq '*' }))
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'AllowAuthorizationAdministrators')
  {
    #allow_authorization_administrators
    if($null -ne ($Config.'system.webServer'.security.authorization.add | Where-Object {$_.accessType -eq 'Allow' -and $_.roles -eq 'Administrators' }))
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'FormsAuthentication')
  {
    #forms_authentication
    if($null -ne ($Config.'system.web'.authentication.forms))
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'RequireSSL')
  {
    #require_ssl
    if($Config.'system.webServer'.security.access.sslFlags -eq 'Ssl')
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'FtpSslControlChannel')
  {
    #ftp_ssl_control_channel
    if($null -eq $Config.'system.applicationHost'.sites.siteDefaults.ftpServer.security.ssl.controlChannelPolicy)
    {
      return 'SslRequire'
    }
    else
    {
      return $Config.'system.applicationHost'.sites.siteDefaults.ftpServer.security.ssl.controlChannelPolicy
    }
  }
  elseif($Item -eq 'FtpSslDataChannel')
  {
    #ftp_ssl_data_channel
    if($null -eq $Config.'system.applicationHost'.sites.siteDefaults.ftpServer.security.ssl.dataChannelPolicy)
    {
      return 'SslRequire'
    }
    else
    {
      return $Config.'system.applicationHost'.sites.siteDefaults.ftpServer.security.ssl.dataChannelPolicy
    }
  }
  elseif($Item -eq 'FtpAuthenticationDenyByFailure')
  {
    #ftp_authentication_deny_by_failure
    if($Config.'system.ftpServer'.security.authentication.denyByFailure.enabled -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'HttpHstsHeader')
  {
    #http_hsts_header
    return ($Config.'system.webServer'.httpProtocol.customHeaders.add | Where-Object {$_.name -eq 'Strict-Transport-Security'}).value
  }
  elseif($Item -eq 'LoggingEventFormat')
  {
    #logging_event_format
    #return $Config.'system.applicationHost'.sites.siteDefaults.logFile.logFormat
    $log_format = ($Config.'system.applicationHost'.sites.site | Where-Object {$_.name -eq $Site}).logfile.logFormat
    if($null -eq $log_format)
    {
      return 'W3C'
    }
    else
    {
      return $log_format
    }
  }
  elseif($Item -eq 'LoggingEventDestination')
  {
    #logging_event_destination
    $log_destination = ($Config.'system.applicationHost'.sites.site | Where-Object {$_.name -eq $Site}).logfile.logTargetW3C
    if($null -eq $log_destination)
    {
      return 'File'
    }
    else
    {
      return $log_destination
    }
  }
  elseif($Item -eq 'AspDeploymentRetail')
  {
    #asp_deployment_retail
    if($Config.'system.web'.deployment.retail -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'AspEnableDebug')
  {
    #asp_enable_debug
    if($Config.'system.web'.compilation.debug -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'AspCustomErrorMsg')
  {
    #asp_custom_error_msg
    if($null -eq $Config.'system.web'.customErrors.mode)
    {
      return 'RemoteOnly'
    }
    else
    {
      return $Config.'system.web'.customErrors.mode
    }
  }
  elseif($Item -eq 'AspErrorMode')
  {
    #asp_error_mode
    if($null -eq $Config.'system.webServer'.httpErrors.errorMode)
    {
      return 'DetailedLocalOnly'
    }
    else
    {
      return $Config.'system.webServer'.httpErrors.errorMode
    }
  }
  elseif($Item -eq 'AspTracingEnabled')
  {
    #asp_tracing_enabled
    if($Config.'system.web'.trace.enabled -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'AspSessionStateUseCookies')
  {
    #asp_session_state_use_cookies
    if($Config.'system.web'.sessionState.cookieless -eq $false)
    {
      return $false
    }
    else
    {
      return $true
    }
  }
  elseif($Item -eq 'AspEnableHttpOnlyCookies')
  {
    #asp_enable_http_only_cookies
    if($Config.'system.web'.httpCookies.httpOnlyCookies -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'AspMachineKey')
  {
    #asp_machine_key
    if($null -eq $Config.'system.web'.machineKey.validation)
    {
      return 'SHA1'
    }
    else
    {
      return $Config.'system.web'.machineKey.validation
    }
  }
  elseif($Item -eq 'AspTrustLevel')
  {
    #asp_trust_level
    return $Config.'system.web'.trust.level
  }

}

function Get-IISSiteAssignedPool()
{
  Param (
    [Parameter(Mandatory=$True)]
    [ValidateNotNullOrEmpty()]
      $Site
    )

  if(Test-Path 'C:\Windows\System32\inetsrv\appcmd.exe')
  {
    $cmd = C:\Windows\System32\inetsrv\appcmd.exe list app /xml
  }
  elseif(Test-Path 'C:\Windows\SysWOW64\inetsrv\appcmd.exe')
  {
    $cmd = C:\Windows\SysWOW64\inetsrv\appcmd.exe list app /xml
  }
  else
  {
    throw "Appcmd.exe was not found!"
  }

  [xml]$Config = $cmd
  return ($Config.appcmd.APP | Where-Object {$_.'SITE.NAME' -eq $Site}).'APPPOOL.NAME'

}

function Get-IISPools()
{
  if(Test-Path 'C:\Windows\System32\inetsrv\appcmd.exe')
  {
    $cmd = C:\Windows\System32\inetsrv\appcmd.exe list apppools /xml
  }
  elseif(Test-Path 'C:\Windows\SysWOW64\inetsrv\appcmd.exe')
  {
    $cmd = C:\Windows\SysWOW64\inetsrv\appcmd.exe list apppools /xml
  }
  else 
  {
    throw "Appcmd.exe was not found!"
  }

  [xml]$Config = $cmd
  $Pools= @()

  foreach($Pool in $Config.appcmd.APPPOOL)
  {
    $Pools += $Pool.'APPPOOL.NAME'
  }

  return $Pools
  
}

function Get-PoolRuntimeVersion()
{
  Param (
    [Parameter(Mandatory=$True)]
    [ValidateNotNullOrEmpty()]
      $PoolName0
    )

    if(Test-Path 'C:\Windows\System32\inetsrv\appcmd.exe')
    {
      $cmd = C:\Windows\System32\inetsrv\appcmd.exe list apppool /xml
    }
    elseif(Test-Path 'C:\Windows\SysWOW64\inetsrv\appcmd.exe')
    {
      $cmd = C:\Windows\SysWOW64\inetsrv\appcmd.exe list apppool /xml
    }
    else 
    {
      throw "Appcmd.exe was not found!"
    }

    [xml]$Config = $cmd
    return ($Config.appcmd.APPPOOL | Where-Object {$_.'APPPOOL.NAME' -eq $PoolName0}).RuntimeVersion

}

function Find-IISPoolExist()
{
  Param (
    [Parameter(Mandatory=$True)]
    [ValidateNotNullOrEmpty()]
      $PoolName
    )

    if(Test-Path 'C:\Windows\System32\inetsrv\appcmd.exe')
    {
      $cmd = C:\Windows\System32\inetsrv\appcmd.exe list apppools
    }
    elseif(Test-Path 'C:\Windows\SysWOW64\inetsrv\appcmd.exe')
    {
      $cmd = C:\Windows\SysWOW64\inetsrv\appcmd.exe list apppools
    }
    else 
    {
      throw "Appcmd.exe was not found!"
    }

    $IISPoolNames = @()
    foreach($IISPool in $cmd)
    {
      $IISPoolNames += $IISPool.Split('"')[1]
    }

    return $IISPoolNames.Contains($PoolName)

}

function Get-IISPoolSetting()
{
  Param (
    [Parameter(Mandatory=$False)]
    [ValidateNotNullOrEmpty()]
      $Pool = 'DefaultAppPool',

    [Parameter(Mandatory=$True)]
    [ValidateNotNullOrEmpty()]
    [ValidateSet('PoolIdentity')]
      $Item
    )

  if(Test-Path 'C:\\Windows\\System32\\inetsrv\\appcmd.exe')
  {
    $cmd = C:\\Windows\\System32\\inetsrv\\appcmd.exe list apppools $Pool /config:*
  }
  elseif(Test-Path 'C:\\Windows\\SysWOW64\\inetsrv\\appcmd.exe')
  {
    $cmd = C:\\Windows\\SysWOW64\\inetsrv\\appcmd.exe list apppools $Pool /config:*
  }
  else 
  {
    throw "Appcmd.exe was not found!"
  }

  [xml]$Config = $cmd

  if($Item -eq 'PoolIdentity')
  {
    #pool_identity
     return $Config.add.processModel.identityType
  }
}



################################# REDO
if(Test-Path 'C:\\Windows\\System32\\inetsrv\\appcmd.exe')
{
  $cmd = C:\\Windows\\System32\\inetsrv\\appcmd.exe list apps /xml
}
elseif(Test-Path 'C:\\Windows\\SysWOW64\\inetsrv\\appcmd.exe')
{
  $cmd = C:\\Windows\\SysWOW64\\inetsrv\\appcmd.exe list apps /xml
}
else 
{
  throw "Appcmd.exe was not found!"
}

[xml]$Config = $cmd
$SiteAssignedPools= @()

foreach($App in $Config.appcmd.APP)
{
    $row = New-Object PSObject
    $row | Add-Member -MemberType NoteProperty -Name "Site" -Value $App.'SITE.NAME'
    $row | Add-Member -MemberType NoteProperty -Name "Pool" -Value $App.'APPPOOL.NAME'
    $SiteAssignedPools += $row
}

$UniqueSiteAssignedPools = $SiteAssignedPools | Sort-Object Pool,Site -Unique | Select-Object *
$AssignedPools = $UniqueSiteAssignedPools.Pool
$UniqueAssignedPools = $AssignedPools | Select-Object -Unique

$CheckDuplicate = Compare-Object -ReferenceObject $AssignedPools -DifferenceObject $UniqueAssignedPools

if($CheckDuplicate)
{
  return $CheckDuplicate.InputObject -join ','
}
else
{
  return $null
}
##############################################################


function Get-IISServerSetting()
{
  Param (
    [Parameter(Mandatory=$True)]
    [ValidateNotNullOrEmpty()]
      $Section,

    [Parameter(Mandatory=$True)]
    [ValidateNotNullOrEmpty()]
    [ValidateSet('AllowSiteDirectoryBrowse', 'AnonymousAuthenticationUser', 'DenyAuthorizationAllUsers', 'AllowAuthorizationAdministrators', `
      'FormsAuthentication', 'FormsAuthenticationEnabled', 'FormsAuthenticationRequireSSL', 'FormsAuthenticationUseCookies', 'FormsAuthenticationCookiesProtection', `
      'FormsAuthenticationPasswordFormat', 'FormsAuthenticationCredentialsDefined', 'RequireSSL', 'AspDeploymentRetail', `
      'AspEnableDebug', 'AspCustomErrorMsg', 'AspErrorMode', 'AspTracingEnabled', 'AspEnableHttpOnlyCookies', 'AspMachineKey', `
      'AspTrustLevel', 'FormsAuthenticationUseCookies', 'AspSessionStateUseCookies', 'MaxAllowedContentLength', `
      'MaxUrl', 'MaxQueryString', 'AllowHighBitCharacters', 'AllowDoubleEscaping', 'AllowVerbTrace', 'AllowUnlistedFileExtension', `
      'AllowWriteOnExecuteOrScript', 'NotListedIsapisAllowed', 'NotListedCgisAllowed', 'DenyByConcurrentRequests', 'DenyByRequestRate', `
      'DefaultIISLogDirectory', 'DefaultIISLoggingEnabled', 'LoggingEventFormat', 'LoggingEventDestination', 'FtpSslControlChannel', `
      'FtpSslDataChannel', 'FtpAuthenticationDenyByFailure')]
      $Item
    )

  if(Test-Path 'C:\\Windows\\System32\\inetsrv\\appcmd.exe')
  {
    $cmd = C:\\Windows\\System32\\inetsrv\\appcmd.exe list config /section:$($Section)
  }
  elseif(Test-Path 'C:\\Windows\\SysWOW64\\inetsrv\\appcmd.exe')
  {
    $cmd = C:\\Windows\\SysWOW64\\inetsrv\\appcmd.exe list config /section:$Section
  }
  else 
  {
    throw "Appcmd.exe was not found!"
  }

  [xml]$Config = $cmd

  if($Item -eq 'AllowSiteDirectoryBrowse')
  {
    #allow_site_directory_browse
    if($Config.'system.webServer'.directoryBrowse.enabled -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'AnonymousAuthenticationUser')
  {
    #anonymous_authentication_user
    return $Config.'system.webServer'.security.authentication.anonymousAuthentication.userName
  }
  elseif($Item -eq 'DenyAuthorizationAllUsers')
  {
    #deny_authorization_all_users
    if($null -ne ($Config.'system.webServer'.security.authorization.add | Where-Object {$_.accessType -eq 'Deny' -and $_.users -eq '*' }))
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'AllowAuthorizationAdministrators')
  {
    #allow_authorization_administrators
    if($null -ne ($Config.'system.webServer'.security.authorization.add | Where-Object {$_.accessType -eq 'Allow' -and $_.roles -eq 'Administrators' }))
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'FormsAuthentication')
  {
    #forms_authentication
    if($null -ne ($Config.'system.web'.authentication.forms))
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'FormsAuthenticationEnabled')
  {
    #forms_authentication_enabled
    if($Config.'system.web'.authentication.mode -eq 'Forms')
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'FormsAuthenticationRequireSSL')
  {
    #forms_authentication_require_ssl
    if($Config.'system.web'.authentication.forms.requireSSL -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'FormsAuthenticationUseCookies')
  {
    #forms_authentication_use_cookies
    if($Config.'system.web'.authentication.forms.cookieless -eq 'UseCookies')
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'FormsAuthenticationCookiesProtection')
  {
    #forms_authentication_cookies_protection
    if($Config.'system.web'.authentication.forms.protection -eq 'All' -or $null -eq $Config.'system.web'.authentication.forms.protection)
    {
      return 'All'
    }
    else
    {
      return $Config.'system.web'.authentication.forms.protection
    }
  }
  elseif($Item -eq 'FormsAuthenticationPasswordFormat')
  {
    #forms_authentication_password_format
    if($null -eq $Config.'system.web'.authentication.forms.credentials.passwordFormat)
    {
      return 'SHA1'
    }
    else
    {
      return $Config.'system.web'.authentication.forms.credentials.passwordFormat
    }
  }
  elseif($Item -eq 'FormsAuthenticationCredentialsDefined')
  {
    #forms_authentication_credentials_defined
    return ($Config.'system.web'.authentication.forms.credentials.user).name -join ','
  }
  elseif($Item -eq 'RequireSSL')
  {
    #require_ssl
    if($Config.'system.webServer'.security.access.sslFlags -eq 'Ssl')
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'AspDeploymentRetail')
  {
    #asp_deployment_retail
    if($Config.'system.web'.deployment.retail -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'AspEnableDebug')
  {
    #asp_enable_debug
    if($Config.'system.web'.compilation.debug -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'AspCustomErrorMsg')
  {
    #asp_custom_error_msg
    if($null -eq $Config.'system.web'.customErrors.mode)
    {
      return 'RemoteOnly'
    }
    else
    {
      return $Config.'system.web'.customErrors.mode
    }
  }
  elseif($Item -eq 'AspErrorMode')
  {
    #asp_error_mode
    if($null -eq $Config.'system.webServer'.httpErrors.errorMode)
    {
      return 'DetailedLocalOnly'
    }
    else
    {
      return $Config.'system.webServer'.httpErrors.errorMode
    }
  }
  elseif($Item -eq 'AspTracingEnabled')
  {
    #asp_tracing_enabled
    if($Config.'system.web'.trace.enabled -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'AspEnableHttpOnlyCookies')
  {
    #asp_enable_http_only_cookies
    if($Config.'system.web'.httpCookies.httpOnlyCookies -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'AspMachineKey')
  {
    #asp_machine_key
    if($null -eq $Config.'system.web'.machineKey.validation)
    {
      return 'SHA1'
    }
    else
    {
      return $Config.'system.web'.machineKey.validation
    }
  }
  elseif($Item -eq 'AspTrustLevel')
  {
    #asp_trust_level
    return $Config.'system.web'.trust.level
  }
  elseif($Item -eq 'AspSessionStateUseCookies')
  {
    #asp_session_state_use_cookies
    if($Config.'system.web'.sessionState.cookieless -eq $false)
    {
      return $false
    }
    else
    {
      return $true
    }
  }
  elseif($Item -eq 'MaxAllowedContentLength')
  {
    #max_allowed_content_length
    if($Config.'system.webServer'.security.requestFiltering.requestLimits.maxAllowedContentLength -eq $null)
    {
      return 30000000
    }
    else
    {
      return $Config.'system.webServer'.security.requestFiltering.requestLimits.maxAllowedContentLength
    }
  }
  elseif($Item -eq 'MaxUrl')
  {
    #max_url
    if($Config.'system.webServer'.security.requestFiltering.requestLimits.maxUrl -eq $null)
    {
      return 4096
    }
    else
    {
      return $Config.'system.webServer'.security.requestFiltering.requestLimits.maxUrl
    }
  }
  elseif($Item -eq 'MaxQueryString')
  {
    #max_query_string
    if($Config.'system.webServer'.security.requestFiltering.requestLimits.maxQueryString -eq $null)
    {
      return 2048
    }
    else
    {
      return $Config.'system.webServer'.security.requestFiltering.requestLimits.maxQueryString
    }
  }
  elseif($Item -eq 'AllowHighBitCharacters')
  {
    #allow_high_bit_characters
    if($Config.'system.webServer'.security.requestFiltering.allowHighBitCharacters -eq $false)
    {
      return $false
    }
    else
    {
      return $true
    }
  }
  elseif($Item -eq 'AllowDoubleEscaping')
  {
    #allow_double_escaping
    if($Config.'system.webServer'.security.requestFiltering.allowDoubleEscaping -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'AllowVerbTrace')
  {
    #allow_verb_trace
    if(($Config.'system.webServer'.security.requestFiltering.verbs.add | Where-Object {$_.verb -eq 'TRACE'}).allowed -eq 'false')
    {
      return $false
    }
    else
    {
      return $true
    }
  }
  elseif($Item -eq 'AllowUnlistedFileExtension')
  {
    #allow_unlisted_file_extension
    if($Config.'system.webServer'.security.requestFiltering.fileExtensions.allowUnlisted -eq $false)
    {
      return $false
    }
    else
    {
      return $true
    }
  }
  elseif($Item -eq 'AllowWriteOnExecuteOrScript')
  {
    #allow_write_on_execute_or_script
    $HandlerActions = $Config.'system.webServer'.handlers.accessPolicy.Replace(' ', '').Split(',')

    if(($HandlerActions.Contains('Script') -or $HandlerActions.Contains('Execute')) -and $HandlerActions.Contains('Write'))
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'NotListedIsapisAllowed')
  {
    #not_listed_isap_is_allowed
    if($Config.'system.webServer'.security.isapiCgiRestriction.notListedIsapisAllowed -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'NotListedCgisAllowed')
  {
    #not_listed_cgi_is_allowed
    if($Config.'system.webServer'.security.isapiCgiRestriction.notListedCgisAllowed -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'DenyByConcurrentRequests')
  {
    #deny_by_concurrent_requests
    if($Config.'system.webServer'.security.dynamicIpSecurity.denyByConcurrentRequests.enabled -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'DenyByRequestRate')
  {
    #deny_ip_based_on_requests_rate
    if($Config.'system.webServer'.security.dynamicIpSecurity.denyByRequestRate.enabled -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'DefaultIISLogDirectory')
  {
    #default_iis_log_directory
    return $Config.'system.applicationHost'.sites.siteDefaults.logFile.directory
  }
  elseif($Item -eq 'DefaultIISLoggingEnabled')
  {
    #default_iis_logging_enabled
    if($Config.'system.webServer'.httpLogging.dontLog -eq $false)
    {
      return $true
    }
    else
    {
      return $false
    }
  }
  elseif($Item -eq 'LoggingEventFormat')
  {
    #logging_event_format
    if($null -eq $Config.'system.applicationHost'.sites.siteDefaults.logFile.logFormat)
    {
      return 'W3C'
    }
    else
    {
      return $Config.'system.applicationHost'.sites.siteDefaults.logFile.logFormat
    }          
    return $Config.'system.applicationHost'.sites.siteDefaults.logFile.logFormat
  }
  elseif($Item -eq 'LoggingEventDestination')
  {
    #logging_event_destination
    if($null -eq $Config.'system.applicationHost'.sites.siteDefaults.logFile.logTargetW3C)
    {
      return 'File'
    }
    else
    {
      return $Config.'system.applicationHost'.sites.siteDefaults.logFile.logTargetW3C
    }
  }
  elseif($Item -eq 'FtpSslControlChannel')
  {
    #ftp_ssl_control_channel
    if($null -eq $Config.'system.applicationHost'.sites.siteDefaults.ftpServer.security.ssl.controlChannelPolicy)
    {
      return 'SslRequire'
    }
    else
    {
      return $Config.'system.applicationHost'.sites.siteDefaults.ftpServer.security.ssl.controlChannelPolicy
    }
  }
  elseif($Item -eq 'FtpSslDataChannel')
  {
    #ftp_ssl_data_channel
    if($null -eq $Config.'system.applicationHost'.sites.siteDefaults.ftpServer.security.ssl.dataChannelPolicy)
    {
      return 'SslRequire'
    }
    else
    {
      return $Config.'system.applicationHost'.sites.siteDefaults.ftpServer.security.ssl.dataChannelPolicy
    }
  }
  elseif($Item -eq 'FtpAuthenticationDenyByFailure')
  {
    #ftp_authentication_deny_by_failure
    if($Config.'system.ftpServer'.security.authentication.denyByFailure.enabled -eq $true)
    {
      return $true
    }
    else
    {
      return $false
    }
  }

}
