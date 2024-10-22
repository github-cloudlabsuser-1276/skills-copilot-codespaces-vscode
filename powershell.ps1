# Define parameters
param (
    [string]$storageAccountName,
    [string]$resourceGroupName,
    [string]$location = "West Europe"
)

# Authenticate to Azure
Connect-AzAccount

# Create resource group if it doesn't exist
if (-not (Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue)) {
    New-AzResourceGroup -Name $resourceGroupName -Location $location
}

# Create the storage account
$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroupName `
                                        -Name $storageAccountName `
                                        -Location $location `
                                        -SkuName Standard_LRS `
                                        -Kind StorageV2

# Output storage account details
$storageAccount | Format-List