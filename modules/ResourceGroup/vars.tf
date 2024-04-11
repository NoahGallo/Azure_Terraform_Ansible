variable "resource_group_name" {
    description = "The name of the Azure Resource Group"
    default = "TerraFormTestRG"
}

variable "location" {
    default = "West Europe"
    description = "The Azure region/location where the Resource Group will be created"
}