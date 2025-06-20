module "md-rg" {
  source = "../../module/azure-rg"
  rg     = var.prg
}

module "md-vnet" {
  source     = "../../module/azure-vnet"
  vnet       = var.pvnet
  depends_on = [module.md-rg]
}

module "md-stg" {
  source     = "../../module/azure-stg"
  stg        = var.pstg
  depends_on = [module.md-rg]
}

module "md-snet" {
  source     = "../../module/azure-snet"
  snet       = var.psnet
  depends_on = [module.md-vnet]
}
module "md-pip" {
  source     = "../../module/azure-pip"
  pip        = var.ppip
  depends_on = [module.md-rg]
}

module "md-nic" {
  source     = "../../module/azure-nic"
  nic        = var.pnic
  snet       = var.psnet
  pip        = var.ppip
  depends_on = [module.md-snet, module.md-pip]
}

module "md-vm" {
  source     = "../../module/azure-vm"
  vm         = var.pvm
  nic        = var.pnic
  depends_on = [module.md-nic]
}

module "md-nsg" {
  source     = "../../module/azure-nsg"
  nsg        = var.pnsg
  depends_on = [module.md-rg]
}
