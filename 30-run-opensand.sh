#!/bin/bash

cd ../openbach-extra/executors/references/

echo "#########################################"
echo "Executor OpenSAND Net Conf"
echo "#########################################"

python3 executor_opensand_net_conf.py --controller 10.10.0.4 --login openbach --password openbach fournuc  

echo "#########################################"
echo "Executor OpenSAND Satcom Conf"
echo "#########################################"

python3 executor_opensand_satcom_conf.py -h 

echo "#########################################"
echo "Executor OpenSAND Run"
echo "#########################################"

python3 executor_opensand_run.py -h

echo "#########################################"
echo "Executor OpenSAND Net Conf"
echo "#########################################"

python3 executor_opensand_net_conf.py --controller 10.10.0.4 --login openbach --password openbach fournuc --clear --entity  

cd ../examples/

echo "#########################################"
echo "OpenSAND Example"
echo "#########################################"

#python3 example_opensand.py --controller 10.10.0.4 --login openbach --password openbach fournuc --sat nuc2 10.10.0.2 --gateway nuc1 10.10.0.1  --satellite-terminal nuc3 --duration 10 run
python3 example_opensand.py -h
