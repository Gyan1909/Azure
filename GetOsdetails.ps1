#Define arrays for specific RGs and VMs
$specResourceGroups = @("RG1name", "RG2name")
$specVMs = @("vmname1", "vmname2", "vmanme2")


# Get all VMs with their Resource Groups
$vms = az vm list --query "[].{resourceGroup: resourceGroup, name: name}" -o tsv

#Loop through each VM and Fetch the OS details
"ResourceGroup `tName `tOSName `tOSVersion"
foreach ($vm in $vms) {
    $vmDetails = $vm -split "`t"
    $resourceGroup = $vmDetails[0]
    $Name = $vmDetails[1]
    
    # Check if the VM belongs to the specified Resource Groups and the VM name is in the specified list
    if (($specResourceGroups -contains $resourceGroup) -and ($specVMs -contains $Name)) {
        $osDetails = az vm get-instance-view --resource-group $resourceGroup --name $Name --query "{osName: instanceView.osName, osVersion: instanceView.osVersion}" -o tsv
        "$resourceGroup `t$Name `t$osDetails"
    }
    
}
