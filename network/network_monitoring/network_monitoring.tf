
resource "random_string" "random_postfix" {
    length  = 3
    upper   = false
    special = false
}

resource "azurerm_storage_account" "flowlog" {
  name                      = "${var.prefix}flowlogs${random_string.random_postfix.result}"
  resource_group_name       = var.rg
  location                  = var.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  access_tier               = "Hot"
  enable_https_traffic_only = true
  tags                      = var.tags
}

resource "azurerm_log_analytics_workspace" "flowlog" {
  name                = "${var.prefix}flowlogs${random_string.random_postfix.result}"
  location            = var.location
  resource_group_name = var.rg
  sku                 = "PerGB2018"
  tags                = var.tags
}

module "network_monitoring_vm" {
	source 														= "git://github.com/hyundonk/aztf-module-vm.git"
  
  prefix                            = var.prefix
  
	vm_num                            = var.node.vm_num
  vm_name                           = var.node.name
  vm_size                           = var.node.vm_size

  location                          = var.location
  resource_group_name               = var.rg
  tags                              = var.tags

  subnet_id                         = var.subnet_id 
  subnet_prefix                     = var.subnet_prefix
	subnet_ip_offset                  = var.node.subnet_ip_offset

	vm_publisher											= var.node.vm_publisher
	vm_offer													= var.node.vm_offer
	vm_sku														= var.node.vm_sku
	vm_version												= var.node.vm_version

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

