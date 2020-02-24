# Map of the remote data state
variable "lowerlevel_storage_account_name" {}
variable "lowerlevel_container_name" {}
variable "lowerlevel_resource_group_name" {}

variable "workspace" {}

#### blueprint_networking_shared_services

variable "resource_groups_network" {}

variable "networking_object" {
  description = "Network configuration object for shared services"
}

variable "enable_ddos_standard" {
  description = "Switch to enable DDoS protection standard"
}

variable "ddos_name" {
  description = "DDos name"
}

variable "public_ip_prefix_name" {
  description = "Public IP Prefix resource name" 
}

variable "prefix_length" {
  description = "Public IP Prefix length" 
}

variable "monitoring_node" {}

variable "monitoring_node_ip_offset" {
  description = "IP offset for monitoring node VM"
}

variable "adminusername" {

}

variable "adminpassword" {

}

