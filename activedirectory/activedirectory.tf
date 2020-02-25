module "resource_group" {
	source  = "aztfmod/caf-resource-group/azurerm"
	version = "0.1.1"
		
	prefix          = local.prefix
  resource_groups = var.resource_groups_activedirectory
  tags            = local.tags
}

locals {
  ADDS-CLUSTER = lookup(module.resource_group.names, "ADDS-CLUSTER", null)
}

module "ad_cluster1" {
	source 														= "git://github.com/hyundonk/aztf-module-vm.git"
  
	vm_num                            = var.adds_clusters[1].vm_num
  vm_name                           = var.adds_clusters[1].name
  vm_size                           = var.adds_clusters[1].vm_size
	
	postfix														= var.adds_clusters[1].postfix	
  
	location                          = local.location_map["region1"]
  resource_group_name							  = local.ADDS-CLUSTER
  tags                              = local.tags

	subnet_id                         = local.subnet_ids_map[var.adds_clusters[1].subnet]
  subnet_prefix                     = local.subnet_prefix_map[var.adds_clusters[1].subnet]

	subnet_ip_offset                  = var.adds_clusters[1].subnet_ip_offset

	vm_publisher											= var.adds_clusters[1].vm_publisher
	vm_offer													= var.adds_clusters[1].vm_offer
	vm_sku														= var.adds_clusters[1].vm_sku
	vm_version												= var.adds_clusters[1].vm_version

  admin_username                    = var.adminusername
  admin_password                    = var.adminpassword

  boot_diagnostics_endpoint         = local.diagnostics_map.diags_sa_blob

	diag_storage_account_name         = local.diagnostics_map.diags_sa
  diag_storage_account_access_key   = local.diagnostics_map.diags_sa_primary_access_key

  log_analytics_workspace_id        = local.log_analytics_workspace.object.workspace_id
  log_analytics_workspace_key       = local.log_analytics_workspace.object.primary_shared_key
}

module "ad_cluster2" {
	source 														= "git://github.com/hyundonk/aztf-module-vm.git"
  
	vm_num                            = var.adds_clusters[2].vm_num
  vm_name                           = var.adds_clusters[2].name
  vm_size                           = var.adds_clusters[2].vm_size
	
	postfix														= var.adds_clusters[2].postfix	
  
	location                          = local.location_map["region1"]
  resource_group_name							  = local.ADDS-CLUSTER
  tags                              = local.tags

	subnet_id                         = local.subnet_ids_map[var.adds_clusters[2].subnet]
  subnet_prefix                     = local.subnet_prefix_map[var.adds_clusters[2].subnet]

	subnet_ip_offset                  = var.adds_clusters[2].subnet_ip_offset

	vm_publisher											= var.adds_clusters[2].vm_publisher
	vm_offer													= var.adds_clusters[2].vm_offer
	vm_sku														= var.adds_clusters[2].vm_sku
	vm_version												= var.adds_clusters[2].vm_version

  admin_username                    = var.adminusername
  admin_password                    = var.adminpassword

  boot_diagnostics_endpoint         = local.diagnostics_map.diags_sa_blob

	diag_storage_account_name         = local.diagnostics_map.diags_sa
  diag_storage_account_access_key   = local.diagnostics_map.diags_sa_primary_access_key

  log_analytics_workspace_id        = local.log_analytics_workspace.object.workspace_id
  log_analytics_workspace_key       = local.log_analytics_workspace.object.primary_shared_key
}

module "ad_cluster3" {
	source 														= "git://github.com/hyundonk/aztf-module-vm.git"
  
	vm_num                            = var.adds_clusters[3].vm_num
  vm_name                           = var.adds_clusters[3].name
  vm_size                           = var.adds_clusters[3].vm_size
	
	postfix														= var.adds_clusters[3].postfix	
  
	location                          = local.location_map["region1"]
  resource_group_name							  = local.ADDS-CLUSTER
  tags                              = local.tags

	subnet_id                         = local.subnet_ids_map[var.adds_clusters[3].subnet]
  subnet_prefix                     = local.subnet_prefix_map[var.adds_clusters[3].subnet]

	subnet_ip_offset                  = var.adds_clusters[3].subnet_ip_offset

	vm_publisher											= var.adds_clusters[3].vm_publisher
	vm_offer													= var.adds_clusters[3].vm_offer
	vm_sku														= var.adds_clusters[3].vm_sku
	vm_version												= var.adds_clusters[3].vm_version

  admin_username                    = var.adminusername
  admin_password                    = var.adminpassword

  boot_diagnostics_endpoint         = local.diagnostics_map.diags_sa_blob

	diag_storage_account_name         = local.diagnostics_map.diags_sa
  diag_storage_account_access_key   = local.diagnostics_map.diags_sa_primary_access_key

  log_analytics_workspace_id        = local.log_analytics_workspace.object.workspace_id
  log_analytics_workspace_key       = local.log_analytics_workspace.object.primary_shared_key
}

