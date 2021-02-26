#!/bin/bash 

projectname=$1
inventorysimplified=$2

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
while read agentip agententity
do
	python3 add_entity.py $agententity $projectname -a $agentip
done < $inventorysimplified
echo " "
cd ../../../openbach-example-4-agent/


