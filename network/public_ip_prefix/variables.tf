variable "location" {
  description = "(Required) Define the region to be protected by DDoS protection"
}

variable "rg" {
  description = "(Required) Define the resource group name where to deploy public IP prefix"
}

variable "name" {
  description = "(Required) Name of public IP prefix"
}

variable "prefix_length" {
  description = "(Required) prefix length of public IP prefix"
}

variable "tags" {
  description = "(Required) Tags of public IP prefix"
}
