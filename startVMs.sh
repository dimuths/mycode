#!/bin/bash 
# To Start my VMs with MyDNS Server 
# Creat by Dimuth Deja 23.01.2017
message= "Start my VMs in backend"
echo "$message" 
echo "List my all VMs first"

VBoxManage  list vms

VBoxManage startvm MyDNS --type headless
sleep 8
VBoxManage startvm "Win7_Desktop" --type gui

echo "All VMs are up now"

exit 0
