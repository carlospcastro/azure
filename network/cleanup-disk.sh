#!/bin/bash

####################################
# carlospcastro@gmail.com          #
# Mon Jan 18 20:27:36 CET 2021     #
####################################

# Setup variables
read -p 'Subscription ID: ' SubscriptionID
read -p 'Disk list: ' List
read -p `Resource Group: ` RG

for i in `cat $List`; do az disk delete --name $i --resource-group  $RG  ; done