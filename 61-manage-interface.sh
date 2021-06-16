#!/bin/bash

MODE=$1
SCEN=$2
LOSS=$3
MTU=1300

if [ $MODE != "clear" ] && [ $MODE != "apply" ]
then
	echo "Wrong entry"
	echo "Choose clear or apply MODE"
	exit 1
fi

if [ $MODE = "clear" ] || [ $MODE = "apply" ]
then
	if [ $MODE = "clear" ]
	then
			#nuc1-ensI1
		nuc1EnsI1Datarate="1G" 
		nuc1EnsI1LossType="random"
		nuc1EnsI1LossRate=0
		nuc1EnsI1Delay=0

			#nuc2-ensI1
                nuc2EnsI1Datarate="1G"
                nuc2EnsI1LossType="random"
                nuc2EnsI1LossRate=0
                nuc2EnsI1Delay=0
			#nuc2-ensI2
                nuc2EnsI2Datarate="1G"
                nuc2EnsI2LossType="random"
                nuc2EnsI2LossRate=0
                nuc2EnsI2Delay=0
			#nuc3-ensI2
                nuc3EnsI2Datarate="1G"
                nuc3EnsI2LossType="random"
                nuc3EnsI2LossRate=0
                nuc3EnsI2Delay=0

		
		echo "------------------------------"
        	echo "$MODE limits on interfaces"
        	echo "------------------------------"


        	cd ../openbach-extra/executors/references
		echo "from 1 to 2"
        	python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach fournuc --entity nuc1 --ifaces ensI1  --mode egress --operation $MODE --bandwidth $nuc1EnsI1Datarate --lm $nuc1EnsI1LossType --lmp $nuc1EnsI1LossRate --delay $nuc1EnsI1Delay run

		echo "from 2 to 1"
        	python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach fournuc --entity nuc2 --ifaces ensI1  --mode egress --operation $MODE --bandwidth $nuc2EnsI1Datarate --lm $nuc2EnsI1LossType --lmp $nuc2EnsI1LossRate --delay $nuc2EnsI1Delay run

		echo "from 2 to 3"
        	python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach fournuc --entity nuc2 --ifaces ensI2  --mode egress --operation $MODE --bandwidth $nuc2EnsI2Datarate --lm $nuc2EnsI2LossType --lmp $nuc2EnsI2LossRate --delay $nuc2EnsI2Delay run


		echo "from 3 to 2"
        	python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach fournuc --entity nuc3 --ifaces ensI2  --mode egress --operation $MODE --bandwidth $nuc3EnsI2Datarate --lm $nuc3EnsI2LossType --lmp $nuc3EnsI2LossRate --delay $nuc3EnsI2Delay run
		
	fi

	if [ $MODE = "apply" ]
	then
		echo "a- GEO-backhaul"
		echo "b- MEO-backhaul"
		echo "c- 5G through LEO - SR from RAN"
		echo "d-5G through LEO - SR from regenerative satellit"
		echo "e-GEO access and WiFi"
		echo "f- Secured tunnel"
		#read -p 'choose scenario : ' scenario
		#read -p 'with losses ? [y/n]' losses
		case $LOSS in
			"y")
				LOSS=1
				;;
			"n")
				LOSS=0
				;;
		esac
		case $SCEN in
			"a") 
				echo " GEO-backhaul"
				 	#nuc1-ensI1
                		nuc1EnsI1Datarate="50M"
                		nuc1EnsI1LossType="random"
				nuc1EnsI1LossRate=$((0*$LOSS))
                		nuc1EnsI1Delay=270
				nuc1EnsI1BufferSize=260

                        		#nuc2-ensI1
               			nuc2EnsI1Datarate="10M"
                		nuc2EnsI1LossType="random"
				nuc2EnsI1LossRate=$((0*$LOSS))
               			nuc2EnsI1Delay=270
				nuc2EnsI1BufferSize=260

                        		#nuc2-ensI2
                		nuc2EnsI2Datarate="50M"
                		nuc2EnsI2LossType="random"
				nuc2EnsI2LossRate=$((1*$LOSS))
                		nuc2EnsI2Delay=7
				nuc2EnsI2BufferSize=35
                        		#nuc3-ensI2
                		nuc3EnsI2Datarate="10M"
                		nuc3EnsI2LossType="random"
				nuc3EnsI2LossRate=$((1*$LOSS))
	                	nuc3EnsI2Delay=7
				nuc3EnsI2BufferSize=7
			
				;;
			b)
                                echo " MEO-backhaul"
                                        #nuc1-ensI1
                                nuc1EnsI1Datarate="50M"
                                nuc1EnsI1LossType="random"
				nuc1EnsI1LossRate=$((0*$LOSS))
                                nuc1EnsI1Delay=180
				nuc3EnsI2BufferSize=870

                                        #nuc2-ensI1
                                nuc2EnsI1Datarate="10M"
                                nuc2EnsI1LossType="random"
				nuc2EnsI1LossRate=$((0*$LOSS))
                                nuc2EnsI1Delay=180
				nuc2EnsI1BufferSize=174

                                        #nuc2-ensI2
                                nuc2EnsI2Datarate="50M"
				nuc2EnsI2LossType="random"
				nuc2EnsI2LossRate=$((1*$LOSS))
                                nuc2EnsI2Delay=7
				nuc3EnsI2BufferSize=35

                                        #nuc3-ensI2
                                nuc3EnsI2Datarate="10M"
                                nuc3EnsI2LossType="random"
				nuc3EnsI2LossRate=$((1*$LOSS))
                                nuc3EnsI2Delay=7
				nuc3EnsI2BufferSize=7

				;;
			c)
                                echo " 5G through LEO - SR from RAN"
                                        #nuc1-ensI1
                                nuc1EnsI1Datarate="50M"
                                nuc1EnsI1LossType="random"
				nuc1EnsI1LossRate=$((0*$LOSS))
                                nuc1EnsI1Delay=20
				nuc1EnsI1BufferSize=100

                                        #nuc2-ensI1
                                nuc2EnsI1Datarate="10M"
                                nuc2EnsI1LossType="random"
				nuc2EnsI1LossRate=$((0*$LOSS))
                                nuc2EnsI1Delay=20
				nuc2EnsI1BufferSize=20

                                        #nuc2-ensI2
                                nuc2EnsI2Datarate="50M"
                                nuc2EnsI2LossType="random"
				nuc2EnsI2LossRate=$((1*$LOSS))
                                nuc2EnsI2Delay=45
				nuc2EnsI2BufferSize=220

                                        #nuc3-ensI2
                                nuc3EnsI2Datarate="10M"
                                nuc3EnsI2LossType="random"
				nuc3EnsI2LossRate=$((1*$LOSS))
                                nuc3EnsI2Delay=45
				nuc3EnsI2BufferSize=44


				;;
			d)
                                echo " 5G through LEO - SR from regenerative satellite"
                                        #nuc1-ensI1
                                nuc1EnsI1Datarate="50M"
                                nuc1EnsI1LossType="random"
				nuc1EnsI1LossRate=$((0*$LOSS))
                                nuc1EnsI1Delay=45
				nuc1EnsI1BufferSize=220

                                        #nuc2-ensI1
                                nuc2EnsI1Datarate="10M"
                                nuc2EnsI1LossType="random"
				nuc2EnsI1LossRate=$((0*$LOSS))
                                nuc2EnsI1Delay=45
				nuc2EnsI1BufferSize=44

                                        #nuc2-ensI2
                                nuc2EnsI2Datarate="50M"
                                nuc2EnsI2LossType="random"
				nuc2EnsI2LossRate=$((1*$LOSS))
                                nuc2EnsI2Delay=20
				nuc2EnsI2BufferSize=100

                                        #nuc3-ensI2
                                nuc3EnsI2Datarate="10M"
                                nuc3EnsI2LossType="random"
				nuc3EnsI2LossRate=$((1*$LOSS))
                                nuc3EnsI2Delay=20
				nuc3EnsI2BufferSize=20

				;;
			e)
                                echo " GEO access and WiFi"
                                        #nuc1-ensI1
                                nuc1EnsI1Datarate="50M"
                                nuc1EnsI1LossType="random"
				nuc1EnsI1LossRate=$((0*$LOSS))
                                nuc1EnsI1Delay=270
				nuc1EnsI1BufferSize=1299

                                        #nuc2-ensI1
                                nuc2EnsI1Datarate="10M"
                                nuc2EnsI1LossType="random"
				nuc2EnsI1LossRate=$((0*$LOSS))
                                nuc2EnsI1Delay=270
				nuc2EnsI1BufferSize=260

                                        #nuc2-ensI2
                                nuc2EnsI2Datarate="50M"
                                nuc2EnsI2LossType="random"
				nuc2EnsI2LossRate=$((1*$LOSS))
                                nuc2EnsI2Delay=7
				nuc2EnsI2BufferSize=35

                                        #nuc3-ensI2
                                nuc3EnsI2Datarate="10M"
                                nuc3EnsI2LossType="random"
				nuc3EnsI2LossRate=$((1*$LOSS))
                                nuc3EnsI2Delay=7
				nuc3EnsI2BufferSize=7
				;;
			f)
                                echo " Secured tunnel"
                                        #nuc1-ensI1
                                nuc1EnsI1Datarate="50M"
                                nuc1EnsI1LossType="random"
				nuc1EnsI1LossRate=$((0*$LOSS))
                                nuc1EnsI1Delay=30
				nuc1EnsI1BufferSize=145

                                        #nuc2-ensI1
                                nuc2EnsI1Datarate="10M"
                                nuc2EnsI1LossType="random"
				nuc2EnsI1LossRate=$((0*$LOSS))
                                nuc2EnsI1Delay=30
				nuc2EnsI1BufferSize=29

                                        #nuc2-ensI2
                                nuc2EnsI2Datarate="50M"
                                nuc2EnsI2LossType="random"
				nuc2EnsI2LossRate=$((1*$LOSS))
                                nuc2EnsI2Delay=255
				nuc2EnsI2BufferSize=1230

                                        #nuc3-ensI2
                                nuc3EnsI2Datarate="10M"
                                nuc3EnsI2LossType="random"
				nuc3EnsI2LossRate=$((1*$LOSS))
                                nuc3EnsI2Delay=255
				nuc3EnsI2BufferSize=246
				;;

		esac
		echo "------------------------------"
        	echo "nuc1-ensI1"
                echo "nuc1EnsI1Datarate= $nuc1EnsI1Datarate"
                echo "nuc1EnsI1LossType= $nuc1EnsI1LossType"
                echo "nuc1EnsI1LossRate= $nuc1EnsI1LossRate"
                echo "nuc1EnsI1Delay= $nuc1EnsI1Delay"
		echo "nuc1EnsI1BufferSize= $nuc1EnsI1BufferSize"
		echo "nuc2-ensI1"
                echo "nuc2EnsI1Datarate= $nuc2EnsI1Datarate"
                echo "nuc2EnsI1LossType= $nuc2EnsI1LossType"
                echo "nuc2EnsI1LossRate= $nuc2EnsI1LossRate"
                echo "nuc2EnsI1Delay= $nuc2EnsI1Delay"
		echo "nuc2EnsI1BufferSize= $nuc1EnsI1BufferSize"
	 	echo "nuc2-ensI2"
                echo "nuc2EnsI2Datarate= $nuc2EnsI2Datarate"
                echo "nuc2EnsI2LossType= $nuc2EnsI2LossType"
                echo "nuc2EnsI2LossRate= $nuc2EnsI2LossRate"
                echo "nuc2EnsI2Delay= $nuc2EnsI2Delay"
		echo "nuc2EnsI2BufferSize= $nuc1EnsI1BufferSize"
		echo "nuc3-ensI2"
                echo "nuc3EnsI2Datarate= $nuc3EnsI2Datarate"
                echo "nuc3EnsI2LossType= $nuc3EnsI2LossType"
                echo "nuc3EnsI2LossRate= $nuc3EnsI2LossRate"
                echo "nuc3EnsI2Delay= $nuc3EnsI2Delay"
		echo "nuc1EnsI1BufferSize= $nuc1EnsI1BufferSize"

		echo "------------------------------"

		echo "------------------------------"
        	echo "$MODE limits on interfaces"
        	echo "------------------------------"


        	cd ../openbach-extra/executors/references
		echo "from 1 to 2"
        	python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach fournuc --entity nuc1 --ifaces ensI1  --mode egress --operation $MODE --bandwidth $nuc1EnsI1Datarate --lm $nuc1EnsI1LossType --lmp $nuc1EnsI1LossRate --delay $nuc1EnsI1Delay --buffer_size $nuc1EnsI1BufferSize run



		echo "from 2 to 1"
        	python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach fournuc --entity nuc2 --ifaces ensI1  --mode egress --operation $MODE --bandwidth $nuc2EnsI1Datarate --lm $nuc2EnsI1LossType --lmp $nuc2EnsI1LossRate --delay $nuc2EnsI1Delay --buffer_size $nuc2EnsI1BufferSize run

		echo "from 2 to 3"
        	python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach fournuc --entity nuc2 --ifaces ensI2  --mode egress --operation $MODE --bandwidth $nuc2EnsI2Datarate --lm $nuc2EnsI2LossType --lmp $nuc2EnsI2LossRate --delay $nuc2EnsI2Delay --buffer_size $nuc2EnsI2BufferSize run


		echo "from 3 to 2"
        	python3 executor_network_configure_link.py --controller 10.10.0.5 --login openbach --password openbach fournuc --entity nuc3 --ifaces ensI2  --mode egress --operation $MODE --bandwidth $nuc3EnsI2Datarate --lm $nuc3EnsI2LossType --lmp $nuc3EnsI2LossRate --delay $nuc3EnsI2Delay --buffer_size $nuc3EnsI2BufferSize run

	
	fi
	
fi
