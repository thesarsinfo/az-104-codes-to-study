#variables
$RG = 'rg'
$Vm = 'vm'
$Enviroment = '-test'
$Aplication = '-cert'
$Location = 'westus2'
$Instance = '-001'
$RgName = $NameRG + $Enviroment + $Aplication + $Location + $Instance
$VmName = $Vm + $Enviroment + $Aplication + $Location + $Instance
#Scrips
Get-Module Az
New-AzVm -ResouceGroupName $RgName -Name $VmName -Credential (Get-Credential) -Location $Location i