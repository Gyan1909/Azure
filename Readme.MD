he Powershell script named "GetOSDetails.ps1" This powershell script used to get OS details (Like OS name and OS version) for the specified list and specfied Resource Group.

Pre-requisites for the script is install Azure CLI in your machine. And then connect to Azure via az login command and config your subscription to the subscription for which you want to run this code.

In the code in place of RG1name and RG2name you can place your Resource Group names and In place of vmnam1 and vmname2 you can provide your VMnames.

If you want all the VM names within a subscription then you would need to modify the "if" statement and place the below statement in that line. "if ($specResourceGroups -contains $resourceGroup -or $specVMs -contains $Name) {"
