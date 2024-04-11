variable "linux_vm_resource_group" {
    description = "Resource group of the Linux VM"
}

variable "linux_vm_location" {
    description = "Location of the Linux VM"
}

variable "public_ip_name" {
    description = "Name of the public ip"
}

variable "network_interface_name" {
    description = "Name of the network interface"
}

variable "linux_vm_name" {
    description = "Name of the Linux VM"
}

variable "linux_vm_size" {
    description = "Size of the Linux VM"
}

variable "linux_vm_admin_username" {
    description = "Admin Username of the Linux VM"
}

variable "linux_vm_ssh_public_key_location" {
    description = "Location of the public ssh key file for the linux vm"
}

variable "linux_vm_subnet_id" {
    description = "ID of the subnet where the VM will be created"
}