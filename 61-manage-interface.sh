#!/bin/bash

# move the scripts in the right folder


if [[$MODE =! "clear"]] && [[MODE =! "apply"]]
then
	echo "Wrong entry"
	echo "Chose clear or apply MODE"
	exit 1
fi

if [[$MODE == "clear"]] || [[$MODE == "apply"]]
then



cd ..openbach-extra/executors/references/

echo "------------------------------"
echo "$MODE limits on interfaces"
echo "------------------------------"
	
#from 1 to 2
python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach fournuc --entity nuc1 --ifaces ensI1  --mode egress --operation $MODE --bandwidth $NUC1_ensI1_datarate --lm $NUC1_ensI1_loss_type --lmp $NUC1_ensI1_loss_rate --delay $NUC1_ensI1_delay run
 


#from 2 to 1
python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach fournuc --entity nuc2 --ifaces ensI1  --mode egress --operation $MODE --bandwidth $NUC2_ensI1_datarate --lm $NUC2_ens1_loss_type --lmp $NUC2_ensI1_loss_rate --delay $NUC2_ensI1_delay run

#from 2 to 3
python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach fournuc --entity nuc2 --ifaces ensI2  --mode egress --operation $MODE --bandwidth $NUC2_ensI2_datarate --lm $NUC2_ensI2_loss_type --lmp $NUC2_ensI2_loss_rate --delay $NUC2_ensI2_delay run


#from 3 to 2
python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach fournuc --entity nuc3 --ifaces ensI2  --mode egress --operation $MODE --bandwidth $NUC3_ensI2_datarate --lm $NUC3_ensI2_loss_type --lmp $NUC3_ensI2_loss_rate --delay $NUC3_ensI2_delay run

fi
