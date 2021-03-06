output "prefix" {
  value = local.prefix
}

output "diagnostics_map" {
  depends_on = [module.diagnostics_logging.diagnostics_map]

  value = module.diagnostics_logging.diagnostics_map
}

#outputs the sec log repositories 
output "activity_logs_map" {
  depends_on = [module.activity_logs.seclogs_map]

  value = module.activity_logs.seclogs_map
}

#outputs of the rg data for hub 
output "resource_group_hub_ids" {
  value = module.resource_group_hub.ids 
}
output "resource_group_hub_names" {
  value = module.resource_group_hub.names
}

#log analytics workspace
output "log_analytics_workspace" {
  value = {
    "name"          = module.log_analytics.name
    "id"            = module.log_analytics.id
    "key"           = module.log_analytics.key
    "workspace_id"  = module.log_analytics.workspace_id
  }
}

output "location_map" {
  value = {
   "region1"   = var.location_map.region1
   "region2"   = var.location_map.region2
  }
}

output "recovery_vault_name" {
  value = module.recoveryservicesvault_backup.object.name
}

output "tags" {
  value = var.tags_hub
}
