# SAMPLE FILE FOR NETWORKING_SHARED_SERVICES BLUEPRINT
# Check documentation and design decisions on Wiki: https://dev.azure.com/azure-terraform/Blueprints/_wiki/ 

# enable_network_watcher = true  
# subnet_to_deploy_network_monitoring = "Network_Monitoring"

resource_groups_network = {
  LIVE-VNET    = {
  	name = "-network-live"
    location = "koreacentral"
  }
}

enable_ddos_standard = false
#enable_ddos_standard = true
ddos_name            = "ddos-protection-plan"

public_ip_prefix_name = "public-ip-prefix"
prefix_length         = 28

monitoring_node_ip_offset   =   4 # 4th available IP address in the subnet
 
networking_object = {
  vnet = {
    name                = "-live-vnet"
    address_space       = ["172.18.0.0/16"]
		dns                 = []
  }
  specialsubnets 				= {
    subnet_gateway          = {
      name                = "GatewaySubnet"
      cidr                = "172.18.0.160/27"
      service_endpoints   = []
    }
  }
  subnets = {
    subnet-ad-gmarket   = {
      name                = "subnet-ad-gmarket"
      cidr                = "172.18.0.0/28"
      service_endpoints   = []
    }
    subnet-ad-auction   = {
      name                = "subnet-ad-auction"
      cidr                = "172.18.0.16/28"
      service_endpoints   = []
    }
    subnet-ad-ebaykorea   = {
      name                = "subnet-ad-ebaykorea"
      cidr                = "172.18.0.32/28"
      service_endpoints   = []
    }
    subnet-firewall-ext   = {
      name                = "subnet-firewall-ext"
      cidr                = "172.18.64.0/27"
      service_endpoints   = []
    }
    subnet-firewall-int   = {
      name                = "subnet-firewall-int"
      cidr                = "172.18.0.96/27"
      service_endpoints   = []
    }
    subnet-loadbalancers  = {
      name                = "subnet-loadbalancers"
      cidr                = "172.18.1.0/24"
      service_endpoints   = []
    }
    subnet-gmarket-1			= {
      name                = "subnet-gmarket-1"
      cidr                = "172.18.11.0/24"
      service_endpoints   = []
    }
    subnet-gmarket-2			= {
      name                = "subnet-gmarket-2"
      cidr                = "172.18.12.0/24"
      service_endpoints   = []
    }
    subnet-gmarket-3			= {
      name                = "subnet-gmarket-3"
      cidr                = "172.18.13.0/24"
      service_endpoints   = []
    }
    subnet-gmarket-4			= {
      name                = "subnet-gmarket-4"
      cidr                = "172.18.14.0/24"
      service_endpoints   = []
    }
    subnet-gmarket-5			= {
      name                = "subnet-gmarket-5"
      cidr                = "172.18.15.0/24"
      service_endpoints   = []
    }
    subnet-g9						= {
      name                = "subnet-g9"
      cidr                = "172.18.16.0/24"
      service_endpoints   = []
    }
    subnet-esmplus			= {
      name                = "subnet-esmplus"
      cidr                = "172.18.17.0/24"
      service_endpoints   = []
    }
    subnet-ebaykorea		= {
      name                = "subnet-ebaykorea"
      cidr                = "172.18.18.0/24"
      service_endpoints   = []
    }
    subnet-auction-1		= {
      name                = "subnet-auction-1"
      cidr                = "172.18.21.0/24"
      service_endpoints   = []
    }
    subnet-auction-2		= {
      name                = "subnet-auction-2"
      cidr                = "172.18.22.0/24"
      service_endpoints   = []
    }
    subnet-auction-3		= {
      name                = "subnet-auction-3"
      cidr                = "172.18.23.0/24"
      service_endpoints   = []
    }
    subnet-auction-4		= {
      name                = "subnet-auction-4"
      cidr                = "172.18.24.0/24"
      service_endpoints   = []
    }
    subnet-auction-5		= {
      name                = "subnet-auction-5"
      cidr                = "172.18.25.0/24"
      service_endpoints   = []
    }
    subnet_management       = {
      name                = "service-management"
      cidr                = "172.18.0.128/27"
      service_endpoints   = []
    }
  }
}

monitoring_node =   {
	name          = "nmon"
	vm_num        = 1
	vm_size       = "Standard_D2s_v3"
	#subnet        = "service-group1"
  subnet_ip_offset  = 4
	vm_publisher      = "MicrosoftWindowsServer"
  vm_offer          = "WindowsServer"
  vm_sku            = "2016-Datacenter"
  vm_version        = "latest"
}
 
