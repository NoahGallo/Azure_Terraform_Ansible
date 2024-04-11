resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  resource_group_name = var.linux_vm_resource_group
  location            = var.linux_vm_location
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "linux_vm_interface" {
  name                = var.network_interface_name
  location            = var.linux_vm_location
  resource_group_name = var.linux_vm_resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.linux_vm_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                = var.linux_vm_name
  resource_group_name = var.linux_vm_resource_group
  location            = var.linux_vm_location
  size                = var.linux_vm_size
  admin_username      = var.linux_vm_admin_username
  network_interface_ids = [
    azurerm_network_interface.linux_vm_interface.id,
  ]

  admin_ssh_key {
    username   = var.linux_vm_admin_username
    public_key = file("${var.linux_vm_ssh_public_key_location}")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}