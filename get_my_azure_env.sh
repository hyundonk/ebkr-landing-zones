#!/bin/bash
        echo "Setting environment variables from Key Vault..."

#        cd ${blueprint_name}

#        tf_name="${blueprint_name}.tfstate"

        # Get parameters of the terraform state from keyvault. Note we are using tags to retrieve the level0
        export keyvault=$(az resource list --tag kvtfstate=level0 | jq -r .[0].name) && echo " - keyvault_name: ${keyvault}"

        # Set the security context under the devops app
        echo ""
        echo "Identity of the pilot in charge of delivering the landing zone"
        export ARM_SUBSCRIPTION_ID=$(az keyvault secret show -n tfstate-sp-devops-subscription-id --vault-name ${keyvault} | jq -r .value) && echo " - subscription id: ${ARM_SUBSCRIPTION_ID}"
        export ARM_CLIENT_ID=$(az keyvault secret show -n tfstate-sp-devops-client-id --vault-name ${keyvault} | jq -r .value) && echo " - client id: ${ARM_CLIENT_ID}"
        export ARM_CLIENT_SECRET=$(az keyvault secret show -n tfstate-sp-devops-client-secret --vault-name ${keyvault} | jq -r .value)
        export ARM_TENANT_ID=$(az keyvault secret show -n tfstate-sp-devops-tenant-id --vault-name ${keyvault} | jq -r .value) && echo " - tenant id: ${ARM_TENANT_ID}"
 
        export TF_VAR_prefix=$(az keyvault secret show -n tfstate-prefix --vault-name ${keyvault} | jq -r .value)
        echo ""
        export TF_VAR_lowerlevel_storage_account_name=$(az keyvault secret show -n tfstate-storage-account-name --vault-name ${keyvault} | jq -r .value)
        export TF_VAR_lowerlevel_resource_group_name=$(az keyvault secret show -n tfstate-resource-group --vault-name ${keyvault} | jq -r .value)
        export TF_VAR_lowerlevel_key=$(az keyvault secret show -n tfstate-blob-name --vault-name ${keyvault} | jq -r .value)
        export TF_VAR_lowerlevel_container_name=$(az keyvault secret show -n tfstate-container --vault-name ${keyvault} | jq -r .value)
        
        # todo to be replaced with SAS key - short ttl or msi with the rover
		id=$(az resource list --tag stgtfstate=level0 | jq -r .[0].id)
        stg=$(az storage account show --ids ${id})
        export storage_account_name=$(echo ${stg} | jq -r .name) && echo " - storage_account_name: ${storage_account_name}"
        export resource_group=$(echo ${stg} | jq -r .resourceGroup) && echo " - resource_group: ${resource_group}"
        export ARM_ACCESS_KEY=$(az storage account keys list --account-name ${storage_account_name} --resource-group ${resource_group} | jq -r .[0].value)

 
