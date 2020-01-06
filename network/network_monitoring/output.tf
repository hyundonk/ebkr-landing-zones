output "workspace_id" {
  description = "Output the workspace ID"
  value      = azurerm_log_analytics_workspace.flowlog.workspace_id
} 

output "storage_account_id" {
  description = "storage account id"
  value      = azurerm_storage_account.flowlog.id
} 
