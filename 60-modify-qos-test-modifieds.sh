#!/bin/bash
# move the scripts in the right folder


echo "------------------------------"
echo "clear interfaces"
echo "------------------------------"

sh 61-manage-interface.sh clear

echo "------------------------------"
echo "set limits on interfaces"
echo "------------------------------"
	
sh 61-manage-interface.sh apply

echo "------------------------------"
echo "test settings"
echo "------------------------------"

sh 62-launch-test.sh

echo "------------------------------"
echo "clear interfaces"
echo "------------------------------"

sh 61-manage-interface.sh clear
