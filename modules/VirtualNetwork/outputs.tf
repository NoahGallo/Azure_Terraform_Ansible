output "virtual_network_id" {
    description = "The id of the virtual network"
    value = azurerm_virtual_network.virtual_network.id
}

output "virtual_network_name" {
    description = "Name of the virtual network"
    value = azurerm_virtual_network.virtual_network.name
}