function Test-UserFileRights
{
  Param(
    [parameter(Mandatory=$true)]
    $Path,
    [parameter(Mandatory=$true)]
    $User,
    [parameter(Mandatory=$true)]
    $Rights
  )

  $Inherit = 'None'
  $Propagation = 'None'

  #################################################################

  Function Convert-ToSID {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidUsingEmptyCatchBlock", "", Justification="We don't care if converting to a SID fails, just that it failed or not")]
    param($account_name)
    try {
      $sid = New-Object -TypeName System.Security.Principal.SecurityIdentifier -ArgumentList $account_name
      return $sid.Value
    } catch {}

    if ($account_name -like '*\*') {
      $account_name_split = $account_name -split '\\'
      if ($account_name_split[0] -eq ".") {
        $domain = $env:COMPUTERNAME
      } else {
        $domain = $account_name_split[0]
      }
      $Username = $account_name_split[1]
    } elseif ($account_name -like "*@*") {
        $account_name_split = $account_name -split "@"
        $domain = $account_name_split[1]
        $Username = $account_name_split[0]
    } else {
        $domain = $null
        $Username = $account_name
    }

    if ($domain) {
      if ($domain -eq $env:COMPUTERNAME) {
        $adsi = [ADSI]("WinNT://$env:COMPUTERNAME,computer")
        $group = $adsi.psbase.children | Where-Object { $_.schemaClassName -eq "group" -and $_.Name -eq $Username }
      } else {
        $group = $null
      }
      if ($group) {
        $account = New-Object System.Security.Principal.NTAccount($Username)
      } else {
        $account = New-Object System.Security.Principal.NTAccount($domain, $Username)
      }
    } else {
      $adsi = [ADSI]("WinNT://$env:COMPUTERNAME,computer")
      $User = $adsi.psbase.children | Where-Object { $_.schemaClassName -eq "user" -and $_.Name -eq $Username }
      if ($User) {
        $account = New-Object System.Security.Principal.NTAccount($env:COMPUTERNAME, $Username)
      } else {
        $account = New-Object System.Security.Principal.NTAccount($Username)
      }
    }

    try {
      $account_sid = $account.Translate([System.Security.Principal.SecurityIdentifier])
    } catch {}

    return $account_sid.Value
  }

  function Get-UserSID {
    param(
      [String]$AccountName
    )

    $UserSID = $null
    $UserSID = Convert-ToSID -account_name $AccountName

    return $UserSID
  }
  
  #####################################################################################

  $sid = Get-UserSID -AccountName $User
  $colRights = [System.Security.AccessControl.FileSystemRights]$Rights
  $objType =[System.Security.AccessControl.AccessControlType]::Allow
  $InheritanceFlag = [System.Security.AccessControl.InheritanceFlags]$Inherit
  $PropagationFlag = [System.Security.AccessControl.PropagationFlags]$Propagation
  $objUser = New-Object System.Security.Principal.SecurityIdentifier($sid)
  $objACE = New-Object System.Security.AccessControl.FileSystemAccessRule ($objUser, $colRights, $InheritanceFlag, $PropagationFlag, $objType)
  
  $objACL = Get-ACL $Path -ErrorAction SilentlyContinue

# Check if the ACE exists already in the objects ACL list
  $match = $false

  # Workaround to handle special use case 'APPLICATION PACKAGE AUTHORITY\ALL APPLICATION PACKAGES' and
  # 'APPLICATION PACKAGE AUTHORITY\ALL RESTRICTED APPLICATION PACKAGES'- can't translate fully qualified name (win32 API bug/oddity)
  # 'ALL APPLICATION PACKAGES' exists only on Win2k12 and Win2k16 and 'ALL RESTRICTED APPLICATION PACKAGES' exists only in Win2k16
  $specialIdRefs = "ALL APPLICATION PACKAGES","ALL RESTRICTED APPLICATION PACKAGES"
  ForEach($rule in $objACL.Access){
    $idRefShortValue = ($rule.IdentityReference.Value).split('\')[-1]

    if ( $idRefShortValue -in $specialIdRefs ) 
    {
      $ruleIdentity = (New-Object Security.Principal.NTAccount $idRefShortValue).Translate([Security.Principal.SecurityIdentifier])
    }
    else 
    {
      $ruleIdentity = $rule.IdentityReference.Translate([System.Security.Principal.SecurityIdentifier])
    }
    
    If (($rule.FileSystemRights -eq $objACE.FileSystemRights) -And ($rule.AccessControlType -eq $objACE.AccessControlType) -And ($ruleIdentity -eq $objACE.IdentityReference) -And ($rule.IsInherited -eq $objACE.IsInherited) -And ($rule.InheritanceFlags -eq $objACE.InheritanceFlags) -And ($rule.PropagationFlags -eq $objACE.PropagationFlags)) 
    {
      $match = $true
      Break
    }
  }

  $match
}
