#!/bin/bash

####################################
# carlospcastro@gmail.com          #
# Fri Oct 09 19:33:00 CET 2020     #
####################################

# Setup variables

read -p 'Subscription ID: ' SubscriptionID
read -p 'Region: ' Region
read -p 'Resource Group Name: ' RG
read -p 'Virtual Network Name: ' VNET_NAME
az account set -s $SubscriptionID

echo "Get information about subnet"
az network vnet subnet list -g $RG --vnet-name $VNET_NAME --query '[[].name, [].networkSecurityGroup.id]'
