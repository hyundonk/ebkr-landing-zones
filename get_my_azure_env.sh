#!/bin/bash
        echo "Getting launchpad coordinates:"

				id=$(az storage account list --query "[?tags.tfstate=='level0']" | jq -r .[0].id)
        stg=$(az storage account show --ids ${id})

        export TF_VAR_lowerlevel_storage_account_name=$(echo ${stg} | jq -r .name) && echo " - storage_account_name: ${TF_VAR_lowerlevel_storage_account_name}"
        export TF_VAR_lowerlevel_resource_group_name=$(echo ${stg} | jq -r .resourceGroup) && echo " - resource_group: ${TF_VAR_lowerlevel_resource_group_name}"
        # todo to be replaced with SAS key - short ttl or msi with the rover
        export ARM_ACCESS_KEY=$(az storage account keys list --account-name ${TF_VAR_lowerlevel_storage_account_name} --resource-group ${TF_VAR_lowerlevel_resource_group_name} | jq -r .[0].value)


        # Get parameters of the terraform state from keyvault. Note we are using tags to retrieve the level0
        export keyvault=$(az resource list --tag tfstate=level0 | jq -r .[0].name) && echo " - keyvault_name: ${keyvault}"

				export TF_VAR_lowerlevel_container_name=$(az keyvault secret show -n launchpad-blob-container --vault-name ${keyvault} | jq -r .value) && echo " - container: ${TF_VAR_lowerlevel_container_name}"
				export TF_VAR_lowerlevel_key=$(az keyvault secret show -n launchpad-blob-name --vault-name ${keyvault} | jq -r .value) && echo " - tfstate file: ${TF_VAR_lowerlevel_key}" 

        # Set the security context under the devops app
        echo ""
        echo "Identity of the pilot in charge of delivering the landing zone"
				export LAUNCHPAD_NAME=$(az keyvault secret show -n launchpad-name --vault-name ${keyvault} | jq -r .value) && echo " - Name: ${LAUNCHPAD_NAME}"
        export ARM_TENANT_ID=$(az keyvault secret show -n launchpad-tenant-id --vault-name ${keyvault} | jq -r .value) && echo " - tenant id: ${ARM_TENANT_ID}"
        export ARM_SUBSCRIPTION_ID=$(az keyvault secret show -n launchpad-subscription-id --vault-name ${keyvault} | jq -r .value) && echo " - subscription id: ${ARM_SUBSCRIPTION_ID}"
        export ARM_CLIENT_ID=$(az keyvault secret show -n launchpad-application-id --vault-name ${keyvault} | jq -r .value) && echo " - client id: ${ARM_CLIENT_ID}"
        export ARM_CLIENT_SECRET=$(az keyvault secret show -n launchpad-service-principal-client-secret --vault-name ${keyvault} | jq -r .value)
        export TF_VAR_prefix=$(az keyvault secret show -n launchpad-prefix --vault-name ${keyvault} | jq -r .value)
        echo ""
        
 
