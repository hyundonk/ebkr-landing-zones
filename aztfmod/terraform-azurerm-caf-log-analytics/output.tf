output "id" {
  description = "Output the object ID"
  value      = azurerm_log_analytics_workspace.log_analytics.id
}

output "name" {
  description = "Output the object name"
  value      = azurerm_log_analytics_workspace.log_analytics.name
}

output "key" {
  description = "Output the primary shared key"
  value      = azurerm_log_analytics_workspace.log_analytics.primary_shared_key
}


output "object" {
  description = "Output the full object"
  value      = azurerm_log_analytics_workspace.log_analytics
}

output "workspace_id" {
  description = "Output the workspace ID"
  value      = azurerm_log_analytics_workspace.log_analytics.workspace_id
}  
