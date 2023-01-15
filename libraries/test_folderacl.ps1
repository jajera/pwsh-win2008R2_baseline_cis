
function Test-FolderACL
{
  Param(
    [parameter(Mandatory=$true)]
    $Path,
    [parameter(Mandatory=$true)]
    $AclReference
  )

  $path_acl = (Get-Acl $path -Audit -ErrorAction SilentlyContinue | Select-Object AuditToString).AuditToString.replace(' ',',').split(',', [System.StringSplitOptions]::RemoveEmptyEntries) | Sort-Object
  $match = $false

  if($null -ne $path_acl)
  {
    if($null -eq (Compare-Object -ReferenceObject $AclReference -DifferenceObject $path_acl -ErrorAction SilentlyContinue))
    {
      $match = $true 
    }
  }

  $match
}
