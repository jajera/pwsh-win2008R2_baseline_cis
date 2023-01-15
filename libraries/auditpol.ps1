### must be run with administrator rights
function Get-AuditPol([string]$audit_pol_name)
{
  #query audit policy value
  $auditpol = (Auditpol /get /subcategory:$audit_pol_name /r 2>&1) | Where-Object {$_}
  $target = "Not Defined"
 
  if(-not($auditpol[0] -like '*0x00000057*'))
  {
    foreach($line in $auditpol)
    {
      try
      {
        if($line.Contains($audit_pol_name))
        {
          $target = $line.Split(',')[4]
        }
      }
      catch {}
    }
  }
  return $target
}
