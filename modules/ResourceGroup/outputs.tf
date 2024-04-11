output "resource_group_name" {
    description = "The name of the created Azure Resource Group"
    value = azurerm_resource_group.resource_group.name
}

output "location" {
    description = "The location of the Resource Group"
    value = azurerm_resource_group.resource_group.location
}