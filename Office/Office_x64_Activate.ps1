param(
    [Parameter(Mandatory=$false, ValueFromPipeline = $false)] [string] $LicencePath = "${env:ProgramFiles}\Microsoft Office\root\Licenses16"
	, [Parameter(Mandatory=$false, ValueFromPipeline = $false)] [string] $KmsHost = "kms.srv.crsoo.com"
    , [Parameter(Mandatory=$false, ValueFromPipeline = $true)] [string] $OSPP = "${env:ProgramFiles}\Microsoft Office\Office16\ospp.vbs"
    , [Parameter(Mandatory=$true, ValueFromPipeline = $true)] [string] $data
)

write-host "Licence Path: $LicencePath" 
write-host "KMS Host: $KmsHost" 
write-host "OSPP: $OSPP" 

$LicenceKey = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($data))
write-host "----------------------------------------------------------------------------------------------------" 

cscript "$OSPP" /inslic:"$LicencePath\ProPlusVL_KMS_Client-ppd.xrm-ms"
cscript "$OSPP" /inslic:"$LicencePath\ProPlusVL_KMS_Client-ul.xrm-ms"
cscript "$OSPP" /inslic:"$LicencePath\ProPlusVL_KMS_Client-ul-oob.xrm-ms"
cscript "$OSPP" /inslic:"$LicencePath\pkeyconfig-office.xrm-ms"

write-host "----------------------------------------------------------------------------------------------------" 
write-host "set key"
cscript "$OSPP" /inpkey:$LicenceKey

write-host "----------------------------------------------------------------------------------------------------" 
write-host "set host"
cscript "$OSPP" /sethst:$KmsHost

write-host "----------------------------------------------------------------------------------------------------" 
write-host "status"
cscript "$OSPP" /dstatus
write-host
write-host Retail to Volume License conversion finished.
write-host
