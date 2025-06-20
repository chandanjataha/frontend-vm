prg = {
  rg1 = {
    name     = "dv-rg"
    location = "West US 3"
  }
}

pvnet = {
    vnet1 = {
        name  = "dv-vnet"
        location = "West US 3"
        resource_group_name = "dv-rg"
        address_space = ["10.0.0.0/16"]
    }
}

pstg = {
  stg1 = {
    name = "dvstgchandanstorage010"
    location = "West US 3"
    resource_group_name = "dv-rg"
    account_tier = "Standard"
    account_replication_type = "LRS"
  }
}

psnet = {
  snet1 = {
    name = "dv-snet1"
    resource_group_name = "dv-rg"
    virtual_network_name = "dv-vnet"
    address_prefixes = ["10.0.2.0/26"]
  }
}

ppip = {
  pip1 = {
    name = "dv-pip"
    location = "westus3"
    resource_group_name = "dv-rg"
    allocation_method = "Static"
  }
}

pnic = {
  nic1 = {
    name = "dv-nic"
    location = "westus3"
    resource_group_name = "dv-rg"
     snet = "snet1"
     pip = "pip1"
    #ip_configuration
    ip_name = "internal"
    private_ip_address_allocation = "Dynamic"
    
  }
}

pvm = {
  vm1 = {
    name = "dv-vm"
    location = "westus3"
    resource_group_name =  "dv-rg"
    size = "Standard_D2s_V3"
    admin_username = "vmuser"
    admin_password = "Password@123"
    disable_password_authentication = false
    nic = "nic1"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher = "Canonical"
    offer = "0001-com-ubuntu-server-jammy"
    sku = "22_04-lts"
    version = "latest"
  }
}

pnsg ={
  nsg1 = {
        name = "dv-nsg"
        location = "westus3"
        resource_group_name = "dv-rg"
        sec_name = "test123"
        priority = 100
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_range = "*"
        source_address_prefix = "*"
        destination_address_prefix = "*"
  }
}