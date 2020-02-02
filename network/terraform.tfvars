# SAMPLE FILE FOR NETWORKING_SHARED_SERVICES BLUEPRINT
# Check documentation and design decisions on Wiki: https://dev.azure.com/azure-terraform/Blueprints/_wiki/ 

# enable_network_watcher = true  
# subnet_to_deploy_network_monitoring = "Network_Monitoring"

enable_ddos_standard = false
#enable_ddos_standard = true

public_ip_prefix_name = "public-ip-prefix"
prefix_length         = 28

ddos_name            = "ddos-protection-plan"

monitoring_node_ip_offset   =   4 # 4th available IP address in the subnet
 
networking_object = {
  vnet = {
    name                = "-service-vnet"
    address_space       = ["10.10.0.0/16"]
		dns                 = []
  }
  specialsubnets 				= {
    subnet_gateway          = {
      name                = "GatewaySubnet"
      cidr                = "10.10.0.160/27"
      service_endpoints   = []
    }
  }
  subnets = {
    subnet_fwext            = {
      name                = "service-fwext"
      cidr                = "10.10.0.0/26"
      service_endpoints   = []
    }
    subnet_fwint            = {
      name                = "service-fwint"
      cidr                = "10.10.0.64/26"
      service_endpoints   = []
    }
    subnet_management       = {
      name                = "service-management"
      cidr                = "10.10.0.128/27"
      service_endpoints   = []
    }
    subnet_servicegroup1        = {
      name                = "service-group1"
      cidr                = "10.10.1.0/24"
      service_endpoints   = []
    }
    subnet_servicegroup2        = {
      name                = "service-group2"
      cidr                = "10.10.2.0/24"
      service_endpoints   = []
    }
    subnet_fwtest_client        = {
      name                = "fwtest-client"
      cidr                = "10.10.3.0/24"
      service_endpoints   = []
    }
    subnet_fwtest_server        = {
      name                = "fwtest-server"
      cidr                = "10.10.4.0/24"
      service_endpoints   = []
    }
  }
}



 
