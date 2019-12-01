services =   {
  0               = {
    name              = "jmpbox1"
    vm_num            = 1
    vm_size           = "Standard_D2s_v3"
    subnet            = "service-management"
    subnet_ip_offset  = 20
    vm_publisher      = "Canonical"
    vm_offer          = "UbuntuServer"
    vm_sku            = "16.04.0-LTS"
    vm_version        = "latest"
  }
}

resourcegroup = "resourcegroup_name_management"

ip_addr_diags = {
 log = [
#["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period] 
   ["DDoSProtectionNotifications", true, true, 30],
   ["DDoSMitigationFlowLogs", true, true, 30],
   ["DDoSMitigationReports", true, true, 30],
 ]

 metric = [
   ["AllMetrics", true, true, 30],
 ]
}


