resource_groups_activedirectory = {
  ADDS-CLUSTER    = {
  	name = "-adds-cluster"
    location = "koreacentral"
  }
}

adds_clusters =   {
	1 = {
		name          = "ebaykr"
		postfix				= "kz"
		vm_num        = 2
		vm_size       = "Standard_D2s_v3"
  	subnet_ip_offset  = 4
		subnet				= "subnet-ad-ebaykorea"
		vm_publisher      = "MicrosoftWindowsServer"
  	vm_offer          = "WindowsServer"
  	vm_sku            = "2016-Datacenter"
  	vm_version        = "latest"
	}
	2 = {
		name          = "gmarketdc"
		postfix				= "gz"
		vm_num        = 2
		vm_size       = "Standard_D2s_v3"
  	subnet_ip_offset  = 4
		subnet				= "subnet-ad-gmarket"
		vm_publisher      = "MicrosoftWindowsServer"
  	vm_offer          = "WindowsServer"
  	vm_sku            = "2016-Datacenter"
  	vm_version        = "latest"
	}
	3 = {
		name          = "aunctiondc"
		postfix				= "az"
		vm_num        = 2
		vm_size       = "Standard_D2s_v3"
  	subnet_ip_offset  = 4
		subnet				= "subnet-ad-auction"
		vm_publisher      = "MicrosoftWindowsServer"
  	vm_offer          = "WindowsServer"
  	vm_sku            = "2016-Datacenter"
  	vm_version        = "latest"
	}
}


