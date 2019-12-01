# Map of the remote data state
variable "lowerlevel_storage_account_name" {}
variable "lowerlevel_container_name" {}
variable "lowerlevel_key" {}                  # Keeping the key for the lower level0 access
variable "lowerlevel_resource_group_name" {}

variable "prefix" {

}

variable "resource_groups_hub" {
	description = "(Required) Map of the resource groups to create"
	type        = map(string)
}

variable "location_map" {
  description = "Default location to create the resources"
  type        = map(string)
}

variable "security_center" {
          description = "Attributes: [contact_email,contact_phone]"
            type        = map(string)
}

variable "analytics_workspace_name" {
          default = ""
}

variable "tags_hub" {
  description = "map of the tags to be applied"
  type    = map(string)
}

variable "azure_activity_logs_retention" {
            description = "Retention period to keep the Azure Activity Logs in the Azure Storage Account"
}

variable "solution_plan_map" {
          description = "map structure with the list of log analytics solutions to be deployed"
}

variable "azure_diagnostics_logs_retention" {
          description = "Retention period to keep the diagnostics Logs in the Azure Storage Account"
}


