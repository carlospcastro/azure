#!/bin/bash

# Setup variables

read -p 'Subscription ID: ' SubscriptionID
read -p 'Region: ' Region
read -p 'Resource Group Name: ' RG
read -p 'Network Security Group Name: ' NSG
az account set -s $SubscriptionID

echo "Creating resource group"
az group create --location $Region --name $RG

echo "Creating Network Security Group"
az network nsg create -g $RG -n $NSG 

echo "Apply NSG Inbound rules"
az network nsg rule create --access Allow --destination-address-prefixes '*' --destination-port-ranges 443 --direction Inbound --name AllowHttsInbound --nsg-name $NSG --priority 120 --protocol Tcp --resource-group $RG --source-address-prefixes Internet 
az network nsg rule create --access Allow --destination-address-prefixes '*' --destination-port-ranges 443 --direction Inbound --name AllowGatewayManagerInbound --nsg-name $NSG --priority 130 --protocol Tcp --resource-group $RG --source-address-prefixes GatewayManager 

echo "Apply NSG Outbound rules"
az network nsg rule create --access Allow --destination-address-prefixes '*' --destination-port-ranges 22 3389 --direction Outbound --name AllowSshRdpOutbound --nsg-name $NSG --priority 100 --protocol Tcp --resource-group $RG --source-address-prefixes '*' 
az network nsg rule create --access Allow --destination-address-prefixes AzureCloud --destination-port-ranges 443 --direction Outbound --name AllowAzureCloudOutbound --nsg-name $NSG --priority 110 --protocol Tcp --resource-group $RG --source-address-prefixes '*' 

az network bastion list -o table