data "azurerm_subnet" "az-snet" {
  for_each             = var.snet
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

data "azurerm_public_ip" "az-pip" {
  for_each            = var.pip
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}
