output "public_ip_prefix" {
    depends_on = [azurerm_public_ip_prefix.prefix]
    value = azurerm_public_ip_prefix.prefix
}
