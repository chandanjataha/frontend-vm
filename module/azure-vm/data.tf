data "azurerm_network_interface" "az-nic" {
  for_each            = var.nic
  name                = each.value.name
  resource_group_name = each.value.resource_group_name

}
