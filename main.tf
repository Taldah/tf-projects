#module "vnetgalim" {
#  source = "./src/vnetgalim"
#}

#module "storagegalim" {
#  source              = "./src/storagegalim"
#  resource_group_name = module.vnetgalim.rg_name_out
#}

module "runbook" {
  source = "./src/runbook"
  
}