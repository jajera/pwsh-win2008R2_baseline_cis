function Get-JavaVersion {
  $output = & cmd /c "java -version 2>&1"
  return $output.split('"')[1]
}
