variable "subnet_name" {
    description = "Name of the subnet to be created"
}

variable "resource_group_name" {
    description = "Name of the resource group where the subnet will be created"
}

variable "subnet_virtual_network" {
    description = "Name of the virtual network where the subnet will be created"
}

variable "subnet_address_prefix" {
    description = "The address prefix for the subnet (Example: 10.0.1.0/24)"
}