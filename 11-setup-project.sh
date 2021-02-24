#!/bin/bash 

projectname=$1
nuc1=$2
nuc1IP=$3
nuc2=$4
nuc2IP=$5
nuc3=$6
nuc3IP=$7
nuc4=$8
nuc4IP=$9

echo "================================="
echo "Delete project"
echo "================================="
cd ../openbach-extra/apis/auditorium_scripts/
python3 delete_project.py $projectname
echo " "
cd ../../../openbach-example-4-agent/

echo "================================="
echo "Create project"
echo "================================="
cd ../openbach-extra/apis/auditorium_scripts/
python3 create_project.py $projectname
echo " "
cd ../../../openbach-example-4-agent/

echo "================================="
echo "Add entities to project"
echo "================================="
cd ../openbach-extra/apis/auditorium_scripts/
python3 add_entity.py $nuc1 $projectname -a $nuc1IP
python3 add_entity.py $nuc2 $projectname -a $nuc2IP
python3 add_entity.py $nuc3 $projectname -a $nuc3IP
python3 add_entity.py $nuc4 $projectname -a $nuc4IP
echo " "
cd ../../../openbach-example-4-agent/


