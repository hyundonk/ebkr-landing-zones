module "resource_group" {
	source  = "aztfmod/caf-resource-group/azurerm"
	version = "0.1.1"
		
	prefix          = local.prefix
  resource_groups = var.resource_groups_network
  tags            = local.tags
}

locals {
  LIVE-VNET = lookup(module.resource_group.names, "LIVE-VNET", null)
}

## Cant be deleted or modified as per https://github.com/terraform-providers/terraform-provider-azurerm/issues/4059 
module "ddos_protection_std" {
  source = "./ddos_protection"

  enable_ddos_standard              = var.enable_ddos_standard
  name                              = var.ddos_name
  rg                                = local.LIVE-VNET
  location                          = local.location_map["region1"]
  tags                              = local.tags
}

module "public_ip_prefix" {
  source = "./public_ip_prefix"

  name                              = "${local.prefix}-${var.public_ip_prefix_name}"
  rg                                = local.LIVE-VNET
  location                          = local.location_map["region1"]
  tags                              = local.tags

  prefix_length                     = var.prefix_length
}

module "virtual_network" {
  source  = "../aztfmod/terraform-azurerm-caf-virtual-network/"
  
  virtual_network_rg                = local.LIVE-VNET
  prefix                            = local.prefix
  location                          = local.location_map["region1"]
  networking_object                 = var.networking_object
  tags                              = local.tags
  diagnostics_map                   = local.diagnostics_map
  log_analytics_workspace           = local.log_analytics_workspace
  enable_ddos_standard              = var.enable_ddos_standard
  ddos_protection_standard          = module.ddos_protection_std.ddos_protection
}

module "network_monitoring" {
  source  = "./network_monitoring"
  
  prefix                            = local.prefix

  location                          = local.location_map["region1"]
  rg                                = local.LIVE-VNET
  tags                              = local.tags

	node															= var.monitoring_node

  subnet_id                         = module.virtual_network.subnet_ids_map["service-management"]
  subnet_prefix                     = module.virtual_network.subnet_prefix_map["service-management"]

  admin_username                    = var.adminusername
  admin_password                    = var.adminpassword

  boot_diagnostics_endpoint         = local.diagnostics_map.diags_sa_blob

  diag_storage_account_name         = local.diagnostics_map.diags_sa
  diag_storage_account_access_key   = local.diagnostics_map.diags_sa_primary_access_key

  log_analytics_workspace_id        = local.log_analytics_workspace.object.workspace_id
  log_analytics_workspace_key       = local.log_analytics_workspace.object.primary_shared_key
}


