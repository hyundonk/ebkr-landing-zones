##export the logging details for EH and SA
##export one object with both

output "diagnostics_map" {
    depends_on = [
        azurerm_storage_account.log, 
        azurerm_eventhub_namespace.log,
        azurerm_eventhub_namespace.log
        ]

    value = "${
        map(
            "diags_sa", "${azurerm_storage_account.log.id}",
            "diags_sa_name", "${azurerm_storage_account.log.name}",
            "diags_sa_access_key", "${azurerm_storage_account.log.primary_access_key}",
            "diags_sa_blob", "${azurerm_storage_account.log.primary_blob_endpoint}",
            "eh_name",  "${azurerm_eventhub_namespace.log.name}",
            "eh_id", "${azurerm_eventhub_namespace.log.id}"
        )
    }"
}
