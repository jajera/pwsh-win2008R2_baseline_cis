
function Get-LocalGroupMembers {
  Param(
    [parameter(Mandatory=$true)]
    $Group
  )
  
  $computer = [ADSI]("WinNT://.,computer")
  $cmd = try{ $computer.psbase.children.find($Group) } catch { $null }
  $result = ""
  $members = @()

  if($null -ne $cmd)
  {
    $result = $cmd.psbase.invoke("Members") | ForEach-Object { $_.GetType().InvokeMember("Name", 'GetProperty', $null, $_, $null) }
  }

  foreach($member in $result)
  {
    $members += $member
  }
  
  return $members | Sort-Object
}
