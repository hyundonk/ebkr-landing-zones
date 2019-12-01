data "azurerm_client_config" "current" {
}

provider "azurerm" {
	version = "<=1.31"
	#version = "<=1.33.0"
}

terraform {
  backend "azurerm" {
  }
}

data "terraform_remote_state" "level0_launchpad" {
	backend = "azurerm"
	config = {
		storage_account_name 	= var.lowerlevel_storage_account_name
		container_name 			  = var.lowerlevel_container_name
    resource_group_name   = var.lowerlevel_resource_group_name
    key                   = var.lowerlevel_key
	}
}

locals {
	prefix = data.terraform_remote_state.level0_launchpad.outputs.prefix
}