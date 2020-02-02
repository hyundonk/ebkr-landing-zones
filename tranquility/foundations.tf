
module "resource_group_hub" {
  source = "git://github.com/aztfmod/resource_group.git?ref=v0.3"

  prefix          = var.prefix
  resource_groups = var.resource_groups_hub
  location        = var.location_map["region1"]
  tags            = var.tags_hub
}

#Specify the subscription logging repositories 
module "activity_logs" {
  source = "git://github.com/aztfmod/terraform-azurerm-caf-activity-logs.git?ref=v0.1.1"
  #source = "git://github.com/aztfmod/activity_logs.git?ref=v0.5"

  prefix              = var.prefix
  resource_group_name = module.resource_group_hub.names["resourcegroup_name_core_sec"]
  location            = var.location_map["region1"]
  tags                = var.tags_hub
  logs_rentention     = var.azure_activity_logs_retention
}

#Specify the operations diagnostic logging repositories 
module "diagnostics_logging" {
  source = "../aztfmod/terraform-azurerm-caf-diagnostics-logging"
  #source = "git://github.com/aztfmod/diagnostics_logging.git?ref=v0.1"
  #source  = "aztfmod/caf-diagnostics-logging/azurerm"
  #source  = "./terraform-azurerm-caf-diagnostics-logging/"
  #version = "0.1.2"

  prefix                = var.prefix
  resource_group_name   = module.resource_group_hub.names["resourcegroup_name_operations"]
  location              = var.location_map["region1"]
  tags                  = var.tags_hub

  #name                  = "opslogsebfgf1r"
  #convention            = "passthrough"
}

# Create the Azure Monitor - Log Analytics workspace
module "log_analytics" {
  source = "../aztfmod/terraform-azurerm-caf-log-analytics"
  #source = "git://github.com/aztfmod/log_analytics.git?ref=v0.1"

  prefix              = var.prefix
  name                = var.analytics_workspace_name
  resource_group_name = module.resource_group_hub.names["resourcegroup_name_operations"]
  location            = var.location_map["region1"]
  tags                = var.tags_hub
  solution_plan_map   = var.solution_plan_map
}

# Create the Azure Security Center workspace
module "security_center" {
  source = "git://github.com/aztfmod/azure_security_center.git?ref=v0.8"

  contact_email = var.security_center["contact_email"]
  contact_phone = var.security_center["contact_phone"]
  scope_id      = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  workspace_id  = module.log_analytics.id
}

# Create recovery services vault for VM backup
module "recoveryservicesvault_backup" {
  source  = "aztfmod/caf-site-recovery/azurerm"
  version = "0.1.2"

  resource_group_name               = module.resource_group_hub.names["resourcegroup_name_backup"]
  asr_vault_name                    = "${var.prefix}-backup-asr-vault"
  location                          = var.location_map["region1"]
  tags                              = var.tags_hub
 
  diagnostics_map                   = module.diagnostics_logging.diagnostics_map
  diagnostics_settings              = var.asr_diags
  
  la_workspace_id                   = module.log_analytics.id
}


