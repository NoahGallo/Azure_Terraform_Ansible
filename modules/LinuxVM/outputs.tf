output "linux_vm_private_ip" {
    value = azurerm_network_interface.linux_vm_interface.private_ip_address
}

output "linux_vm_public_ip" {
    value = azurerm_public_ip.public_ip.ip_address
}