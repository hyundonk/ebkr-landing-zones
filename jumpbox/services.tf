module "jumpbox_pip" {
  source                            = "../modules/pip/"

  prefix                            = local.prefix
  services                          = var.services

  location                          = local.location_map["region1"]
  rg                                = local.resource_group_hub_names[var.resourcegroup]
  
  public_ip_prefix_id               = local.public_ip_prefix.id
  tags                              = local.tags
  
  diagnostics_settings              = var.ip_addr_diags
  diagnostics_map                   = local.diagnostics_map
  log_analytics_workspace_id        = local.log_analytics_workspace.id
}

module "jumpbox1" {
  source                            = "../modules/vm"
  
  prefix                            = local.prefix
  vm_num                            = var.services[0].vm_num
  
  vm_name                           = var.services[0].name
  vm_size                           = var.services[0].vm_size

  vm_publisher                      = var.services[0].vm_publisher
  vm_offer                          = var.services[0].vm_offer
  vm_sku                            = var.services[0].vm_sku
  vm_version                        = var.services[0].vm_version
  
  location                          = local.location_map["region1"]
  resource_group_name               = local.resource_group_hub_names[var.resourcegroup]
  tags                              = local.tags

  subnet_id                         = local.subnet_ids_map[var.services[0].subnet]
  subnet_prefix                     = local.subnet_prefix_map[var.services[0].subnet]

  subnet_ip_offset                  = var.services[0].subnet_ip_offset
  
  public_ip_id                      = module.jumpbox_pip.public_ip["0"].id
  
  admin_username                    = local.admin_username
  admin_password                    = local.admin_password

  boot_diagnostics_endpoint         = local.diagnostics_map.diags_sa_blob

  diag_storage_account_name         = null
  diag_storage_account_access_key   = null

  log_analytics_workspace_id        = null
  log_analytics_workspace_key       = null

  enable_network_watcher_extension  = false
  enable_dependency_agent           = false
}
