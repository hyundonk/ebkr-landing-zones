output "subnet_prefix_map" {
  value = module.virtual_network.subnet_prefix_map
}

output "subnet_ids_map" {
  value = module.virtual_network.subnet_ids_map
}

output "shared_services_vnet_object" {
  value = module.virtual_network.vnet
}

output "shared_services_nsg_table" {
  value = module.virtual_network.nsg_vnet
}

/*
output "shared_services_subnet_table" {
  value = module.virtual_network.vnet_subnets
}
*/

output "ddos_protection" {
  value = module.ddos_protection_std.ddos_protection
}

output "public_ip_prefix" {
  value = module.public_ip_prefix.public_ip_prefix
}
