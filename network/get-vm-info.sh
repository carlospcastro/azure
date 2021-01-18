#!/bin/bash

####################################
# carlospcastro@gmail.com          #
# Mon Jan 18 20:27:36 CET 2021     #
####################################

# Setup variables
read -p 'Subscription ID: ' SubscriptionID

az account set -s $SubscriptionID

az vm list --query '[*].{name: name, resourceGroup: resourceGroup, Status: tags.Status, DevOwnerEmail: tags.DevOwnerEmail}' -o table