
module "network_monitoring_vm" {
  source                            = "../../modules/vm"
  
  prefix                            = var.prefix
  vm_num                            = 1
 
  vm_name                           = "nmon"
  vm_size                           = "Standard_D2s_v3"

  location                          = var.location
  resource_group_name               = var.rg
  tags                              = var.tags

  
  subnet_id                         = var.subnet_id 
  subnet_prefix                     = var.subnet_prefix

	subnet_ip_offset                  = var.subnet_ip_offset

  admin_username                    = var.admin_username
  admin_password                    = var.admin_password

  boot_diagnostics_endpoint         = var.boot_diagnostics_endpoint

  diag_storage_account_name         = var.diag_storage_account_name
  diag_storage_account_access_key   = var.diag_storage_account_access_key

  log_analytics_workspace_id        = var.log_analytics_workspace_id
  log_analytics_workspace_key       = var.log_analytics_workspace_key
  
  enable_network_watcher_extension  = true
  enable_dependency_agent           = true
}

