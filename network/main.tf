provider "azurerm" {
  version = "<=1.35.0"
}


terraform {
    backend "azurerm" {
    }
}

data "terraform_remote_state" "landingzone_caf_foundations" {
  backend = "azurerm"
  config = {
    storage_account_name  = var.lowerlevel_storage_account_name
    container_name        = var.workspace
    #container_name        = var.lowerlevel_container_name 
    resource_group_name   = var.lowerlevel_resource_group_name
    key                   = "landingzone_caf_foundations.tfstate"
    #key                   = "tranquility.tfstate"
  }
}

locals {
    prefix                      = data.terraform_remote_state.landingzone_caf_foundations.outputs.prefix
    caf_foundations_accounting  = data.terraform_remote_state.landingzone_caf_foundations.outputs.blueprint_foundations_accounting 
    caf_foundations_security    = data.terraform_remote_state.landingzone_caf_foundations.outputs.blueprint_foundations_security
    global_settings             = data.terraform_remote_state.landingzone_caf_foundations.outputs.global_settings 

    tags												= local.global_settings.tags_hub
    location_map								= local.global_settings.location_map
    log_analytics_workspace   	= local.caf_foundations_accounting.log_analytics_workspace
    diagnostics_map           	= local.caf_foundations_accounting.diagnostics_map
    resource_group_hub_names  	= local.caf_foundations_accounting.resource_group_hub_names
}
