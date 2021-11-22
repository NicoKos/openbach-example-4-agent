#!/bin/bash

# Checking the ansible version that is used 
echo "################################################"
echo "Check ansible version - the results should be"
echo "ansible 2.10.5"
echo "################################################"
ansible --version

# Cloning openbach 
echo "################################################"
echo "Cloning the openbach and openbach-extra repositories"
cd ../
git clone https://github.com/CNES/openbach/openbach.git
git clone https://github.com/CNES/openbach-extra/openbach-extra.git
echo "################################################"
echo ""

# Update the repository
echo "################################################"
cd openbach/
git checkout master
git pull
cd ../
cd openbach-extra/
git checkout master
git pull
cd ../
echo "################################################"
echo ""

# Preparing the ansible inventory
echo "################################################"
cd openbach-example-4-agent/
cp nuc-inventory ../openbach/ansible/inventory/
cd ../openbach/ansible/

echo "################################################"
echo "Testing that ansible can ping everyone"
ansible -i inventory/nuc-inventory -u star -k -m ping all
echo "################################################"
echo ""

echo "################################################"
echo "Starting installation"
ansible-playbook -i inventory/nuc-inventory uninstall.yml -u star -k -K
ansible-playbook -i inventory/nuc-inventory install.yml -u star -k -K
echo "################################################"
echo ""

