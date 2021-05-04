#!/bin/bash

MODE = $1

if [[$MODE =! "clear"]] && [[MODE =! "apply"]]
then
	echo "Wrong entry"
	echo "Choose clear or apply MODE"
	exit 1
fi

if [[$MODE == "clear"]] || [[$MODE == "apply"]]
then
	if [[$MODE =="clear"]]
	then
			#nuc1-ensI1
		nuc1EnsI1Datarate = 1G 
		nuc1EnsI1LossType = random
		nuc1EnsI1LossRate = 0
		nuc1EnsI1Delay = 0

			#nuc2-ensI1
                nuc2EnsI1Datarate = 1G
                nuc2EnsI1LossType = random
                nuc2EnsI1LossRate = 0
                nuc2EnsI1Delay = 0
			#nuc2-ensI2
                nuc2EnsI2Datarate = 1G
                nuc2EnsI2LossType = random
                nuc2EnsI2LossRate = 0
                nuc2EnsI2Delay = 0
			#nuc3-ensI2
                nuc3EnsI2Datarate = 1G
                nuc3EnsI2LossType = random
                nuc3EnsI2LossRate = 0
                nuc3EnsI2Delay = 0

		
	fi

	if [[$MODE == "apply"]]
	then
		read -p 'choose scenario : ' scenario
		case scenario in
			1) 
				echo " GEO-backhaul"
				 	#nuc1-ensI1
                		nuc1EnsI1Datarate = 50M
                		nuc1EnsI1LossType = random
                		nuc1EnsI1LossRate = 0
                		nuc1EnsI1Delay = 350

                        		#nuc2-ensI1
               			nuc2EnsI1Datarate = 10M
                		nuc2EnsI1LossType = random
                		nuc2EnsI1LossRate = 0
               			nuc2EnsI1Delay = 530
                        		#nuc2-ensI2
                		nuc2EnsI2Datarate = 50M
                		nuc2EnsI2LossType = random
                		nuc2EnsI2LossRate = 1
                		nuc2EnsI2Delay = 7
                        		#nuc3-ensI2
                		nuc3EnsI2Datarate = 10M
                		nuc3EnsI2LossType = random
        	        	nuc3EnsI2LossRate = 1
	                	nuc3EnsI2Delay = 7
			2)
                                echo " MEO-backhaul"
                                        #nuc1-ensI1
                                nuc1EnsI1Datarate = 50M
                                nuc1EnsI1LossType = random
                                nuc1EnsI1LossRate = 0
                                nuc1EnsI1Delay = 330

                                        #nuc2-ensI1
                                nuc2EnsI1Datarate = 10M
                                nuc2EnsI1LossType = random
                                nuc2EnsI1LossRate = 0
                                nuc2EnsI1Delay = 330
                                        #nuc2-ensI2
                                nuc2EnsI2Datarate = 50M
				nuc2EnsI2LossType = random
                                nuc2EnsI2LossRate = 0
                                nuc2EnsI2Delay = 7
                                        #nuc3-ensI2
                                nuc3EnsI2Datarate = 10M
                                nuc3EnsI2LossType = random
                                nuc3EnsI2LossRate = 0
                                nuc3EnsI2Delay = 7

			3)
                                echo " 5G through LEO - SR from RAN"
                                        #nuc1-ensI1
                                nuc1EnsI1Datarate = 50M
                                nuc1EnsI1LossType = random
                                nuc1EnsI1LossRate = 0
                                nuc1EnsI1Delay = 30


                                        #nuc2-ensI1
                                nuc2EnsI1Datarate = 10M
                                nuc2EnsI1LossType = random
                                nuc2EnsI1LossRate = 0
                                nuc2EnsI1Delay = 30
                                        #nuc2-ensI2
                                nuc2EnsI2Datarate = 50M
                                nuc2EnsI2LossType = random
                                nuc2EnsI2LossRate = 1
                                nuc2EnsI2Delay = 120
                                        #nuc3-ensI2
                                nuc3EnsI2Datarate = 10M
                                nuc3EnsI2LossType = random
                                nuc3EnsI2LossRate = 1
                                nuc3EnsI2Delay = 120

			4)
                                echo " 5G through LEO - SR from regenerative satellite"
                                        #nuc1-ensI1
                                nuc1EnsI1Datarate = 50M
                                nuc1EnsI1LossType = random
                                nuc1EnsI1LossRate = 0
                                nuc1EnsI1Delay = 90

                                        #nuc2-ensI1
                                nuc2EnsI1Datarate = 10M
                                nuc2EnsI1LossType = random
                                nuc2EnsI1LossRate = 0
                                nuc2EnsI1Delay = 90
                                        #nuc2-ensI2
                                nuc2EnsI2Datarate = 50M
                                nuc2EnsI2LossType = random
                                nuc2EnsI2LossRate = 1
                                nuc2EnsI2Delay = 60
                                        #nuc3-ensI2
                                nuc3EnsI2Datarate = 10M
                                nuc3EnsI2LossType = random
                                nuc3EnsI2LossRate = 1
                                nuc3EnsI2Delay = 60

			5)
                                echo " GEO access and WiFi"
                                        #nuc1-ensI1
                                nuc1EnsI1Datarate = 50M
                                nuc1EnsI1LossType = random
                                nuc1EnsI1LossRate = 0
                                nuc1EnsI1Delay = 530

                                        #nuc2-ensI1
                                nuc2EnsI1Datarate = 10M
                                nuc2EnsI1LossType = random
                                nuc2EnsI1LossRate = 0
                                nuc2EnsI1Delay = 530
                                        #nuc2-ensI2
                                nuc2EnsI2Datarate = 50M
                                nuc2EnsI2LossType = random
                                nuc2EnsI2LossRate = 2
                                nuc2EnsI2Delay = 7
                                        #nuc3-ensI2
                                nuc3EnsI2Datarate = 10M
                                nuc3EnsI2LossType = random
                                nuc3EnsI2LossRate = 2
                                nuc3EnsI2Delay = 7
			6)
                                echo " Secured tunnel"
                                        #nuc1-ensI1
                                nuc1EnsI1Datarate = 50M
                                nuc1EnsI1LossType = random
                                nuc1EnsI1LossRate = 0
                                nuc1EnsI1Delay = 30

                                        #nuc2-ensI1
                                nuc2EnsI1Datarate = 10M
                                nuc2EnsI1LossType = random
                                nuc2EnsI1LossRate = 0
                                nuc2EnsI1Delay = 30
                                        #nuc2-ensI2
                                nuc2EnsI2Datarate = 50M
                                nuc2EnsI2LossType = random
                                nuc2EnsI2LossRate = 1
                                nuc2EnsI2Delay = 515
                                        #nuc3-ensI2
                                nuc3EnsI2Datarate = 10M
                                nuc3EnsI2LossType = random
                                nuc3EnsI2LossRate = 1
                                nuc3EnsI2Delay = 515


		esac
	fi
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
