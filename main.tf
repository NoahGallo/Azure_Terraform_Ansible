module "resource_group" {
    source = "./modules/ResourceGroup"
    resource_group_name = "terraformtestrg"
    location = "westeurope"
}

module "virtual_network" {
    source = "./modules/VirtualNetwork"
    virtual_network_name = "terraformvirtualnetwork"
    virtual_network_address_space = "10.0.0.0/16"
    virtual_network_resource_group = module.resource_group.resource_group_name
    virtual_network_location = module.resource_group.location
}

module "subnet" {
    source = "./modules/Subnet"
    resource_group_name = module.resource_group.resource_group_name
    subnet_virtual_network = module.virtual_network.virtual_network_name
    subnet_name = "terraformubuntuvmsubnet"
    subnet_address_prefix = "10.0.0.0/24"
}

module "linux_vm" {
    source = "./modules/LinuxVM"
    linux_vm_resource_group = module.resource_group.resource_group_name
    linux_vm_admin_username = "azureuser"
    linux_vm_location = module.resource_group.location
    linux_vm_name = "terraformubuntuvm"
    linux_vm_size = "Standard_D2s_v3"
    linux_vm_ssh_public_key_location = "/home/noah/.ssh/id_rsa.pub"
    public_ip_name = "terraformubuntuvmpublicip"
    network_interface_name = "terraformubuntuvmnic"
    linux_vm_subnet_id = module.subnet.subnet_id
}