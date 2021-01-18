#!/bin/bash

####################################
# carlospcastro@gmail.com          #
# Mon Jan 18 20:27:36 CET 2021     #
####################################

# Setup variables
read -p 'Subscription ID: ' SubscriptionID

az account set -s $SubscriptionID
az network nsg list --query '{NSG:[].name, RG:[].resourceGroup}' -o yaml