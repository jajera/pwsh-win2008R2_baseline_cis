function Get-FileInfo {
  Param(
    [parameter(Mandatory=$true)]
    $FilePath
  )

  $query_file = Get-Item -Path $FilePath -ErrorAction SilentlyContinue

  $exist = $true

  if($null -eq $query_file) { $exist = $false}

  $val = @{
    CreationTime = if($exist) { $query_file.CreationTime } else { $null }
    Exist = $exist
    FileExtension =  if($exist) { $query_file.Extension } else { $null }
    FileName =  if($exist) { $query_file.VersionInfo.FileName } else { $null }
    FileVersion =  if($exist) { ("{0}.{1}.{2}.{3}" -f $query_file.VersionInfo.FileMajorPart, $query_file.VersionInfo.FileMinorPart, $query_file.VersionInfo.FileBuildPart, $query_file.VersionInfo.FilePrivatePart) } else { $null }
    LastAccessTime =  if($exist) { $query_file.LastAccessTime } else { $null }
    LastWriteTime =  if($exist) { $query_file.LastWriteTime } else { $null }
    ParentPath =  if($exist) { $query_file.DirectoryName } else { $null }
    ReadOnly =  if($exist) { $query_file.IsReadOnly } else { $null }
    Size =  if($exist) { $query_file.Length } else { $null }
  }

  Write-Output (New-Object -TypeName PSObject -Prop $val)
}
