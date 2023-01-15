describe_dual_trio_all `
  -control "15.1 C:\Windows\System32\arp.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\arp.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\arp.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\arp.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\arp.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\arp.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\arp.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.2 C:\Windows\System32\at.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\at.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\at.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\at.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\at.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\at.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\at.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.3 C:\Windows\System32\attrib.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\attrib.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\attrib.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\attrib.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\attrib.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\attrib.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\attrib.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.4 C:\Windows\System32\cacls.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\cacls.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\cacls.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\cacls.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\cacls.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\cacls.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\cacls.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_single_quad_all `
  -control "15.5 C:\Windows\System32\cmd.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\cmd.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\cmd.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -opr1 '-eq' `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\cmd.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\cmd.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -opr2 '-eq' `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\cmd.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\cmd.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true `
  -opr3 '-eq' `
  -item4 "Ensure NT AUTHORITY\INTERACTIVE has ReadAndExecute on C:\Windows\System32\cmd.exe" `
  -current_value4 (Test-UserFileRights -Path 'C:\Windows\System32\cmd.exe' -User 'NT AUTHORITY\INTERACTIVE' -Rights 'ReadAndExecute') `
  -expected_value4 $true `
  -opr4 '-eq' `

describe_dual_trio_all `
  -control "15.6 C:\Windows\System32\dcpromo.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\dcpromo.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\dcpromo.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\dcpromo.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\dcpromo.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\dcpromo.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\dcpromo.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.7 C:\Windows\System32\eventcreate.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\eventcreate.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\eventcreate.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\eventcreate.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\eventcreate.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\eventcreate.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\eventcreate.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.8 C:\Windows\System32\finger.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\finger.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\finger.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\finger.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\finger.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\finger.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\finger.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.9 C:\Windows\System32\ftp.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\ftp.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\ftp.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\ftp.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\ftp.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\ftp.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\ftp.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.10 C:\Windows\System32\gpupdate.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\gpupdate.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\gpupdate.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\gpupdate.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\gpupdate.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\gpupdate.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\gpupdate.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.11 C:\Windows\System32\icacls.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\icacls.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\icacls.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\icacls.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\icacls.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\icacls.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\icacls.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.12 C:\Windows\System32\ipconfig.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\ipconfig.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\ipconfig.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\ipconfig.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\ipconfig.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\ipconfig.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\ipconfig.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.13 C:\Windows\System32\nbtstat.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\nbtstat.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\nbtstat.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\nbtstat.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\nbtstat.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\nbtstat.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\nbtstat.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.14 C:\Windows\System32\net.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\net.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\net.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\net.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\net.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\net.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\net.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.15 C:\Windows\System32\netsh.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\netsh.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\netsh.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\netsh.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\netsh.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\netsh.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\netsh.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.16 C:\Windows\System32\netstat.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\netstat.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\netstat.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\netstat.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\netstat.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\netstat.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\netstat.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.17 C:\Windows\System32\nslookup.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\nslookup.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\nslookup.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\nslookup.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\nslookup.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\nslookup.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\nslookup.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.18 C:\Windows\System32\ping.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\ping.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\ping.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\ping.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\ping.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\ping.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\ping.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.19 C:\Windows\System32\reg.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\reg.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\reg.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\reg.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\reg.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\reg.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\reg.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.20 C:\Windows\System32\regedit.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\regedit.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\regedit.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\regedit.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\regedit.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\regedit.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\regedit.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.21 C:\Windows\System32\regedt32.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\regedt32.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\regedt32.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\regedt32.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\regedt32.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\regedt32.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\regedt32.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.22 C:\Windows\System32\regini.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\regini.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\regini.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\regini.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\regini.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\regini.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\regini.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.23 C:\Windows\System32\regsvr32.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\regsvr32.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\regsvr32.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\regsvr32.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\regsvr32.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\regsvr32.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\regsvr32.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.24 C:\Windows\System32\route.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\route.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\route.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\route.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\route.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\route.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\route.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.25 C:\Windows\System32\runonce.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\runonce.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\runonce.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\runonce.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\runonce.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\runonce.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\runonce.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.26 C:\Windows\System32\runas.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\runas.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\runas.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\runas.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\runas.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\runas.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\runas.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.27 C:\Windows\System32\sc.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\sc.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\sc.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\sc.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\sc.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\sc.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\sc.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.28 C:\Windows\System32\secedit.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\secedit.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\secedit.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\secedit.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\secedit.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\secedit.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\secedit.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.29 C:\Windows\System32\subst.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\subst.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\subst.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\subst.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\subst.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\subst.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\subst.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.30 C:\Windows\System32\systeminfo.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\systeminfo.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\systeminfo.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\systeminfo.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\systeminfo.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\systeminfo.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\systeminfo.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.31 C:\Windows\System32\syskey.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\syskey.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\syskey.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\syskey.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\syskey.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\syskey.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\syskey.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

  describe_dual_trio_all `
  -control "15.32 C:\Windows\System32\telnet.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\telnet.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\telnet.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\telnet.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\telnet.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\telnet.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\telnet.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true `
  -only_if (Test-Path 'C:\Windows\System32\telnet.exe')

describe_dual_trio_all `
  -control "15.33 C:\Windows\System32\tracert.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\tracert.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\tracert.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\tracert.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\tracert.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\tracert.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\tracert.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true

describe_dual_trio_all `
  -control "15.34 C:\Windows\System32\xcopy.exe access permissions" `
  -item1 "Ensure NT SERVICE\TrustedInstaller has FullControl on C:\Windows\System32\xcopy.exe" `
  -current_value1 (Test-UserFileRights -Path 'C:\Windows\System32\xcopy.exe' -User 'NT SERVICE\TrustedInstaller' -Rights 'FullControl')  `
  -expected_value1 $true `
  -item2 "Ensure BUILTIN\Administrators has ReadAndExecute on C:\Windows\System32\xcopy.exe" `
  -current_value2 (Test-UserFileRights -Path 'C:\Windows\System32\xcopy.exe' -User 'BUILTIN\Administrators' -Rights 'ReadAndExecute') `
  -expected_value2 $true `
  -item3 "Ensure NT AUTHORITY\SYSTEM has ReadAndExecute on C:\Windows\System32\xcopy.exe" `
  -current_value3 (Test-UserFileRights -Path 'C:\Windows\System32\xcopy.exe' -User 'NT AUTHORITY\SYSTEM' -Rights 'ReadAndExecute') `
  -expected_value3 $true
