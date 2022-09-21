#variables
$RG = 'rg'
$Vm = 'vm'
$Ip = 'ip'
$Enviroment = '-test'
$Aplication = '-cert-'
$Location = 'westus3'
$Instance = '-001'
$RgName = $RG + $Enviroment + $Aplication + $Location 
$VmName = $Vm + $Enviroment + $Aplication + $Location + $Instance
$IpName = $Ip + $Enviroment + $Aplication + $Location 
$Credendial = (Get-Credential)
$Size = "Standard_B2s"

#Scrips
Connect-AzAccount
New-AzResourceGroup -Name $RgName -Location $Location
New-AzVm -ResourceGroupName $RgName -Name $VmName -Credential (Get-Credential) -Location $Location -Image UbuntuLTS `
 -OpenPorts 22 -PublicIpAddressName $IpName -Size $Size
$vm = (Get-AzVM -Name $VmName -ResourceGroupName $RgName )
$vm
$vm.HardwareProfile
$vm.StorageProfile
$vm | Get-AzVMSize #Lista todas os sizes de vm
$vmIp = (Get-AzPublicIpAddress -ResourceGroupName $RgName)
$Credendial.UserName
$vmIp.IpAddress
$Connection = $Credendial.UserName + '@' + $vmIp.IpAddress 
ssh $Connection
