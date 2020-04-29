$licencepath = "${env:ProgramFiles(x86)}\Microsoft Office\root\Licenses16"
$kmshost = "kms.srv.crsoo.com"
$ospp = "${env:ProgramFiles(x86)}\Microsoft Office\Office16\ospp.vbs"

$licence = "XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99"
#$licence = "MWYG8-HM3WH-JQTYR-X8JK3-GHT22"
#$licence = "PYQN8-3BXR6-MTMH8-DH2TR-K4TDY"

$(
	write-output "----------------------------------------------------------------------------------------------------"
	write-output "----------------------------------------------------------------------------------------------------"
	Get-Date
	write-output "Activate Licence"

	write-output "set key"
	cscript "$ospp" /inpkey:$licence

	write-output "status"
	cscript "$ospp" /dstatus
	write-output ""
) >> "$env:public\licence.txt"