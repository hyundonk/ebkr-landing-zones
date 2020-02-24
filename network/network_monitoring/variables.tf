variable "prefix" {
   description = "prefix"
}

variable "node" {}

variable "location" {
   description = "Location of the Virtual Machine to use for network watcher" 
}

variable "rg" {
  description = "Resource group of the Virtual Machine to use for network watcher"
}

variable "subnet_id" {
  description = "Subnet of the Virtual Machine to use for network watcher"
}

variable "subnet_prefix" {
  description = "Subnet prefix of the Virtual Machine to use for network watcher"
}

variable "tags" {
  description = "Tags of the Virtual Machine to use for network watcher"
}

variable "admin_username" {

}

variable "admin_password" {

}

variable "boot_diagnostics_endpoint" {
  description = "boot diagnostics endpoint URL"
}

variable "diag_storage_account_name" {

}

variable "diag_storage_account_access_key" {

}

variable "log_analytics_workspace_id" {
  description = "Log analytics workspace id"
}

variable "log_analytics_workspace_key" {
  description = "Log analytics workspace key"
}


