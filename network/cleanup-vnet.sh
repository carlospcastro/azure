#!/bin/bash

####################################
# carlospcastro@gmail.com          #
# Mon Jan 18 20:27:36 CET 2021     #
####################################

# Setup variables
read -p 'Subscription ID: ' SubscriptionID
read -p 'Vnet Name: ' VnetName
read -p `Resource Group: ` RG

az account set -s $SubscriptionID

az network vnet delete -g $RG -n  $VnetName