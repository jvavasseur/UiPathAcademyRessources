$licencepath = "${env:ProgramFiles(x86)}\Microsoft Office\root\Licenses16"
$kmshost = "kms.srv.crsoo.com"
$ospp = "${env:ProgramFiles(x86)}\Microsoft Office\Office16\ospp.vbs"


$(
	write-output "----------------------------------------------------------------------------------------------------"
	write-output "----------------------------------------------------------------------------------------------------"
	Get-Date
	write-output "Remove Licence"

	cscript "$ospp" /unpkey:WFG99
	#cscript "$ospp" /unpkey:BTDRB
	write-output ""
) >> "$env:public\licence.txt"