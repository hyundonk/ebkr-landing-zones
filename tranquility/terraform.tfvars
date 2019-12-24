# input variables 
#
# Azure Subscription activity logs retention period
azure_activity_logs_retention = 365

# Azure diagnostics logs retention period
azure_diagnostics_logs_retention = 60

# Set of resource groupds to land the blueprint
resource_groups_hub = {
	resourcegroup_name_network          = "-network"	
	resourcegroup_name_core_sec         = "-core-sec"	
	resourcegroup_name_operations       = "-operations"
	resourcegroup_name_firewall         = "-firewall"
	resourcegroup_name_activedirectory	= "-activedirectory"
	resourcegroup_name_monitor		      = "-monitor"
	resourcegroup_name_management		    = "-management"
	resourcegroup_name_security_monitor	= "-security-monitor"
}

location_map = {
  region1   = "koreacentral"
  region2   = "southeastasia"
}

#Set of tags for core operations: includes core resources for hub
tags_hub = {
  environment     = "DEV"
  owner           = "hyuk"
  deploymentType  = "Terraform"
  costCenter      = "1664"
  BusinessUnit    = "SHARED"
  DR              = "NON-DR-ENABLED"
}

analytics_workspace_name = "lalogs"

#Azure Security Center Configuration 
security_center = {
  contact_email   = "myemail@mydomain.com" 
  contact_phone   = "+821111111111"
}

solution_plan_map = {
  NetworkMonitoring = {
    "publisher" = "Microsoft"
    "product"   = "OMSGallery/NetworkMonitoring"
  },
  ADAssessment = {
    "publisher" = "Microsoft"
    "product"   = "OMSGallery/ADAssessment"
  },
  ADReplication = {
    "publisher" = "Microsoft"
    "product"   = "OMSGallery/ADReplication"
  },
  AgentHealthAssessment = {
    "publisher" = "Microsoft"
    "product"   = "OMSGallery/AgentHealthAssessment"
  },
  DnsAnalytics = {
    "publisher" = "Microsoft"
    "product"   = "OMSGallery/DnsAnalytics"
  },
  KeyVaultAnalytics = {
    "publisher" = "Microsoft"
    "product"   = "OMSGallery/KeyVaultAnalytics"
  }
}
