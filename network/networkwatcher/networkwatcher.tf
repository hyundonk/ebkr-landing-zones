# imported using below command
# terraform import azurerm_network_watcher.koreacentral /subscriptions/a9faab7f-03df-43e1-afa5-7ac794c596b6/resourceGroups/NetworkWatcherRG/providers/Microsoft.Network/networkWatchers/NetworkWatcher_koreacentral

resource "azurerm_resource_group" "rg" {
  name     = "NetworkWatcherRG"
  location = var.location
  tags     = var.tags

}

resource "azurerm_network_watcher" "koreacentral" {
	name                = "NetworkWatcher_${var.location}"
  location            = var.location
	resource_group_name = azurerm_resource_group.rg.name
}

