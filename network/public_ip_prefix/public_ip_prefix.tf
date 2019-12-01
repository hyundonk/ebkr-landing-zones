
resource "azurerm_public_ip_prefix" "prefix" {
	name                = var.name
  location            = var.location
  resource_group_name = var.rg
  tags                = var.tags
  
	prefix_length 			= var.prefix_length
	sku 					= "Standard"
}

