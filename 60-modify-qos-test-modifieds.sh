#!/bin/bash
# move the scripts in the right folder

cd ../openbach-extra/executors/references/

echo "------------------------------"
echo "clear interfaces"
echo "------------------------------"

python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach fournuc --entity nuc1 --ifaces ensI1 --mode egress --operation clear --bandwidth 10M --delay 10 run 

python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach fournuc --entity nuc2 --ifaces  ensI1,ensI2 --mode egress --operation clear --bandwidth 20M --delay 20 run 

python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach fournuc --entity nuc3 --ifaces ensI2 --mode egress --operation clear --bandwidth 20M --delay 20 run    
		
# This scenario sets the interfaces to limits of bandwidth and latency of both NUCs on the data path (10.10.0.0/24)

echo "------------------------------"
echo "set limits on interfaces"
echo "------------------------------"
	
#from 1 to 2
python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach fournuc --entity nuc1 --ifaces ensI1  --mode egress --operation apply --bandwidth 50M --lm random --lmp 0 --delay 10 run 

#from 2 to 1
python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach fournuc --entity nuc2 --ifaces ensI1  --mode egress --operation apply --bandwidth 10M --lm random --lmp 0 --delay 20 run

#from 2 to 3
python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach fournuc --entity nuc2 --ifaces ensI2  --mode egress --operation apply --bandwidth 10M --lm random --lmp 0 --delay 5 run

#from 3 to 2
python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach fournuc --entity nuc3 --ifaces ensI2  --mode egress --operation apply --bandwidth 10M --lm random --lmp 0 --delay 10 run

echo "------------------------------"
echo "test settings"
echo "------------------------------"

python3 executor_network_global.py fournuc --controller 10.10.0.5 --login openbach --password openbach --server-entity nuc1 --client-entity nuc3 --server-ip 10.10.1.1 --client-ip 10.10.2.3 --rate-limit 1G --loss-measurement --post-processing-entity ctrl run --file time_series figure --data /home/star/results_global_modified_QoS_no_tun/1-3
#--rate limit is by default in kb/s, and iperf3 -u gives a data rate around 600 kb/s

python3 executor_network_global.py fournuc --controller 10.10.0.5 --login openbach --password openbach --server-entity nuc2 --client-entity nuc3 --server-ip 10.10.2.2 --client-ip 10.10.2.3 --rate-limit 1G --loss-measurement  --post-processing-entity ctrl run --file time_series figure --data /home/star/results_global_modified_QoS_no_tun/2-3

python3 executor_network_global.py fournuc --controller 10.10.0.5 --login openbach --password openbach --server-entity nuc1 --client-entity nuc2 --server-ip 10.10.1.1 --client-ip 10.10.1.2 --rate-limit 1G --loss-measurement  --post-processing-entity ctrl run --file time_series figure --data /home/star/results_global_modified_QoS_no_tun/1-2

echo "------------------------------"
echo "clear interfaces"
echo "------------------------------"

python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach testobachnuc --entity nuc1 --ifaces ensI1 --mode egress --operation clear --bandwidth 10M --delay 10 run

python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach testobachnuc --entity nuc2 --ifaces ensI1,ensI2 --mode egress --operation clear --bandwidth 20M --delay 20 run

python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach fournuc --entity nuc3 --ifaces ensI2 --mode egress --operation clear --bandwidth 20M --delay 20 run
