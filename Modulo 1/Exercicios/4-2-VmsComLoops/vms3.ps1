#variables
$RG = 'rg'
$Vm = 'vm'
$Ip = 'ip'
$Enviroment = '-test'
$Aplication = '-cert-'
$Location = 'westus3'
$Instance = '00'
$RgName = $RG + $Enviroment + $Aplication + $Location 
$VmName = $Vm + $Enviroment + $Aplication + $Location + $Instance
$IpName = $Ip + $Enviroment + $Aplication + $Location + $Instance
$Credendial = (Get-Credential)
$Size = "Standard_B2s"
$NumMachines = 3

#Scrips
New-AzResourceGroup -Name $RgName -Location $Location
for ($i = 0; $i -lt $NumMachines; $i++)
{
    $VmName += $i
    $IpName += $i
    Write-Host "Nome da Maquina: " $VmName
    New-AzVm -ResourceGroupName $RgName -Name $VmName -Credential $Credendial -Location $Location -Image UbuntuLTS `
        -OpenPorts 22 -PublicIpAddressName $IpName -Size $Size
    $vm = (Get-AzVM -Name $VmName -ResourceGroupName $RgName )
    $vm
}  

