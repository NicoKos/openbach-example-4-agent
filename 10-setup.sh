#!/bin/bash
  
controllername=controller-nuc
projectname=fournuc
installalljobs=true
nuc1=nuc1
nuc1IP=10.10.0.1
nuc2=nuc2
nuc2IP=10.10.0.2
nuc3=nuc3
nuc3IP=10.10.0.3
nuc4=nuc4
nuc4IP=10.10.0.4
cp $controllername ../openbach-extra/apis/auditorium_scripts/controller
cp $controllername ../openbach-extra/executors/examples/controller
cp $controllername ../openbach-extra/executors/references/controller
cp $controllername ../openbach-extra/validation_suite/controller
joblist="ip_route d-itg_recv d-itg_send owamp-server owamp-client hping dashjs_client tc_configure_link histogram time_series web_browsing_qoe nuttcp apache2 voip_qoe_dest voip_qoe_src tcp_conf_linux synchronization tcpdump_pcap pcap_postprocessing kernel_compile quic opensand dambox"

echo "######################" 
echo "### Set up project ###" 
echo "######################" 

bash 11-setup-project.sh $projectname $nuc1 $nuc1IP $nuc2 $nuc2IP $nuc3 $nuc3IP $nuc4 $nuc4IP

echo "######################" 
echo "### Set up jobs    ###" 
echo "######################" 

if $installalljobs
then 
	bash 12-setup-jobs.sh $nuc1IP $nuc2IP $nuc3IP $nuc4IP "$joblist"
fi 

