#!/bin/bash
echo "Getting launchpad coordinates:"

id=$(az storage account list --query "[?tags.tfstate=='level0']" | jq -r .[0].id)
export TF_VAR_workspace="sandpit"

stg=$(az storage account show --ids ${id})

export TF_VAR_lowerlevel_storage_account_name=$(echo ${stg} | jq -r .name) && echo " - storage_account_name: ${TF_VAR_lowerlevel_storage_account_name}"
export TF_VAR_lowerlevel_resource_group_name=$(echo ${stg} | jq -r .resourceGroup) && echo " - resource_group: ${TF_VAR_lowerlevel_resource_group_name}"
# todo to be replaced with SAS key - short ttl or msi with the rover
export ARM_ACCESS_KEY=$(az storage account keys list --account-name ${TF_VAR_lowerlevel_storage_account_name} --resource-group ${TF_VAR_lowerlevel_resource_group_name} | jq -r .[0].value)

export TF_VAR_adminusername=$(az keyvault secret show -n adminusername --vault-name ${keyvault} | jq -r .value)
export TF_VAR_adminpassword=$(az keyvault secret show -n adminpassword --vault-name ${keyvault} | jq -r .value)
 
export tf_name="${PWD##*/}.tfstate" && echo " - tf_name: ${tf_name}"

terraform init \
  -reconfigure \
  -backend=true \
  -lock=false \
  -backend-config storage_account_name=${TF_VAR_lowerlevel_storage_account_name} \
  -backend-config container_name=${TF_VAR_workspace} \
  -backend-config access_key=${ARM_ACCESS_KEY} \
  -backend-config key=${tf_name}   
