#Get hostname
$hostname = [System.Net.Dns]::GetHostName()

#Get report file location
$old_report = "$(Split-Path $MyInvocation.MyCommand.Path)\reports\$($hostname).csv"

#Delete the old report file if exist and append header
"Hostname`tControl`tItem`tExpected_Value`tCurrent_Value`tStatus" | Out-File -Encoding Ascii $old_report

#import module dependencies
Import-Module "$(Split-Path $MyInvocation.MyCommand.Path)\libraries\common.ps1"
Import-Module "$(Split-Path $MyInvocation.MyCommand.Path)\libraries\security_policy.ps1"
Import-Module "$(Split-Path $MyInvocation.MyCommand.Path)\libraries\auditpol.ps1"
Import-Module "$(Split-Path $MyInvocation.MyCommand.Path)\libraries\regkey_info.ps1"
Import-Module "$(Split-Path $MyInvocation.MyCommand.Path)\libraries\firewall_info.ps1"
Import-Module "$(Split-Path $MyInvocation.MyCommand.Path)\libraries\get_user.ps1"
Import-Module "$(Split-Path $MyInvocation.MyCommand.Path)\libraries\get_serviceinfo.ps1"
Import-Module "$(Split-Path $MyInvocation.MyCommand.Path)\libraries\get_featureinfo.ps1"
Import-Module "$(Split-Path $MyInvocation.MyCommand.Path)\libraries\test_userfilerights.ps1"
Import-Module "$(Split-Path $MyInvocation.MyCommand.Path)\libraries\test_folderacl.ps1"
Import-Module "$(Split-Path $MyInvocation.MyCommand.Path)\libraries\get_eventlogsizeinfo.ps1"
# Import-Module "$(Split-Path $MyInvocation.MyCommand.Path)\libraries\get_installedsoftware.ps1"
# Import-Module "$(Split-Path $MyInvocation.MyCommand.Path)\libraries\get_fileinfo.ps1"
# Import-Module "$(Split-Path $MyInvocation.MyCommand.Path)\libraries\test_hotfixinstalled.ps1"
# Import-Module "$(Split-Path $MyInvocation.MyCommand.Path)\libraries\get_javaversion.ps1"
Import-Module "$(Split-Path $MyInvocation.MyCommand.Path)\libraries\get_localgroupmembers.ps1"
#Import-Module "$(Split-Path $MyInvocation.MyCommand.Path)\libraries\iis_functions.ps1"

#run baseline check
& "$(Split-Path $MyInvocation.MyCommand.Path)\section1_os.ps1"
& "$(Split-Path $MyInvocation.MyCommand.Path)\section2_os.ps1"
& "$(Split-Path $MyInvocation.MyCommand.Path)\section3_os.ps1"
& "$(Split-Path $MyInvocation.MyCommand.Path)\section4_os.ps1"
& "$(Split-Path $MyInvocation.MyCommand.Path)\section5_os.ps1"
& "$(Split-Path $MyInvocation.MyCommand.Path)\section6_os.ps1"
& "$(Split-Path $MyInvocation.MyCommand.Path)\section7_os.ps1"
& "$(Split-Path $MyInvocation.MyCommand.Path)\section8_os.ps1"
& "$(Split-Path $MyInvocation.MyCommand.Path)\section9_os.ps1"
& "$(Split-Path $MyInvocation.MyCommand.Path)\section10_os.ps1"
& "$(Split-Path $MyInvocation.MyCommand.Path)\section11_os.ps1"
& "$(Split-Path $MyInvocation.MyCommand.Path)\section12_os.ps1"
& "$(Split-Path $MyInvocation.MyCommand.Path)\section13_os.ps1"
& "$(Split-Path $MyInvocation.MyCommand.Path)\section14_os.ps1"
& "$(Split-Path $MyInvocation.MyCommand.Path)\section15_os.ps1"
& "$(Split-Path $MyInvocation.MyCommand.Path)\section16_os.ps1"
& "$(Split-Path $MyInvocation.MyCommand.Path)\section17_os.ps1"

#unload module dependencies
Remove-Module common
Remove-Module security_policy
Remove-Module auditpol
Remove-Module regkey_info
Remove-Module firewall_info
Remove-Module get_user
Remove-Module get_serviceinfo
Remove-Module get_featureinfo
Remove-Module test_userfilerights
Remove-Module test_folderacl
Remove-Module get_eventlogsizeinfo
# Remove-Module get_installedsoftware
# Remove-Module get_fileinfo
# Remove-Module test_hotfixinstalled
# Remove-Module get_javaversion
Remove-Module get_localgroupmembers
#Remove-Module iis_functions
