function Test-HotfixInstalled {
  Param(
  [parameter(ParameterSetName = 'id')]
  [string]$ID,
  [parameter(ParameterSetName = 'ids')]
  [System.Collections.ArrayList]$IDs,
  [parameter(Mandatory=$false)]
  [bool]$AllInstalled = $false
  )

  $Exist = $false

  if($PSBoundParameters.ContainsKey('ID'))
  {
   if(Get-HotFix -Id $ID -ErrorAction SilentlyContinue) { $Exist = $true }
  }

  if($PSBoundParameters.ContainsKey('IDs'))
  {
    $HotFixInstalledList = (Get-HotFix).HotFixID

    if(-not[string]::IsNullOrWhiteSpace($HotFixInstalledList))
    {
      if($AllInstalled)
      {
        $Exist = $true

        foreach($HotFix in $IDs){$HotFix
          if(-not[string]::IsNullOrWhiteSpace($HotFix.Trim()) -and (-not($HotFixInstalledList.Contains($HotFix.Trim())))){
            $Exist = $false
            break
          }
        }
      }
      else 
      {
        foreach($HotFix in $IDs){
        $HotFix 
          if((-not[string]::IsNullOrWhiteSpace($HotFix.Trim())) -and $HotFixInstalledList.Contains($HotFix.Trim())){
            $Exist = $true
            break
          }
        }
      }
    }
  }
  $Exist
}
