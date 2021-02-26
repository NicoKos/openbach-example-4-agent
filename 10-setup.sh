#!/bin/bash
  
controllername=controller-nuc
projectname=fournuc
installalljobs=true
inventoryname=nuc-inventory
cat $inventoryname | grep '[0-9]' | awk '{split($0, a, " "); split(a[2], b, "="); print a[1], b[2]}' > inventorysimplified.txt

cp $controllername ../openbach-extra/apis/auditorium_scripts/controller
cp inventorysimplified.txt ../openbach-extra/apis/auditorium_scripts/inventorysimplified.txt
cp $controllername ../openbach-extra/executors/examples/controller
cp $controllername ../openbach-extra/executors/references/controller
cp $controllername ../openbach-extra/validation_suite/controller
#joblist="ip_route d-itg_recv d-itg_send owamp-server owamp-client hping dashjs_client tc_configure_link histogram time_series web_browsing_qoe nuttcp apache2 voip_qoe_dest voip_qoe_src tcp_conf_linux synchronization tcpdump_pcap pcap_postprocessing kernel_compile quic opensand dambox"
joblist="ip_route d-itg_recv d-itg_send owamp-server owamp-client hping dashjs_client tc_configure_link histogram time_series web_browsing_qoe nuttcp apache2 voip_qoe_dest voip_qoe_src tcp_conf_linux synchronization tcpdump_pcap pcap_postprocessing kernel_compile quic dambox"

echo "######################" 
echo "### Set up project ###" 
echo "######################" 

bash 11-setup-project.sh $projectname inventorysimplified.txt

echo "######################" 
echo "### Set up jobs    ###" 
echo "######################" 

if $installalljobs
then 
	bash 12-setup-jobs.sh inventorysimplified.txt "$joblist"
fi 

rm ../openbach-extra/apis/auditorium_scripts/inventorysimplified.txt
rm inventorysimplified.txt
