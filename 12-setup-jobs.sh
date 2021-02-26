#!/bin/bash

inventorysimplified=$1
joblist=$2

echo "================================="
echo "Delete Jobs from Controller"
echo "================================="

cd ../openbach-extra/apis/auditorium_scripts/
for job in $joblist
do 
	python3 delete_job.py $job 
done

echo "================================="
echo "Add Jobs on Controller"
echo "================================="

python3 add_job.py -f ../../../openbach/src/jobs/core_jobs/network/ip_route ip_route
python3 add_job.py -f ../../../openbach/src/jobs/admin_jobs/synchronization synchronization
python3 add_job.py -f ../../../openbach/src/jobs/core_jobs/network/d-itg_recv d-itg_recv
python3 add_job.py -f ../../../openbach/src/jobs/core_jobs/network/d-itg_send d-itg_send
python3 add_job.py -f ../../../openbach-extra/externals_jobs/stable_jobs/network/owamp-client owamp-client
python3 add_job.py -f ../../../openbach-extra/externals_jobs/stable_jobs/network/owamp-server owamp-server
python3 add_job.py -f ../../../openbach-extra/externals_jobs/stable_jobs/network/hping hping
python3 add_job.py -f ../../../openbach-extra/externals_jobs/stable_jobs/service/dashjs_client dashjs_client
python3 add_job.py -f ../../../openbach/src/jobs/core_jobs/network/tc_configure_link tc_configure_link 
python3 add_job.py -f ../../../openbach/src/jobs/core_jobs/post_processing/histogram histogram 
python3 add_job.py -f ../../../openbach/src/jobs/core_jobs/post_processing/time_series time_series
python3 add_job.py -f ../../../openbach/src/jobs/core_jobs/service/web_browsing_qoe web_browsing_qoe
python3 add_job.py -f ../../../openbach/src/jobs/core_jobs/service/apache2 apache2
python3 add_job.py -f ../../../openbach-extra/externals_jobs/stable_jobs/transport/nuttcp nuttcp 
python3 add_job.py -f ../../../openbach-extra/externals_jobs/stable_jobs/service/voip_qoe/voip_qoe_dest voip_qoe_dest 
python3 add_job.py -f ../../../openbach-extra/externals_jobs/stable_jobs/service/voip_qoe/voip_qoe_src voip_qoe_src
python3 add_job.py -f ../../../openbach-extra/externals_jobs/stable_jobs/transport/tcp_conf_linux tcp_conf_linux 
python3 add_job.py -f ../../../openbach/src/jobs/core_jobs/transport/tcpdump_pcap tcpdump_pcap 
python3 add_job.py -f ../../../openbach/src/jobs/core_jobs/post_processing/pcap_postprocessing pcap_postprocessing
python3 add_job.py -f ../../../openbach/src/jobs/admin_jobs/kernel_compile kernel_compile 
python3 add_job.py -f ../../../openbach-extra/externals_jobs/stable_jobs/service/quic quic
python3 add_job.py -f ../../../openbach-extra/externals_jobs/stable_jobs/access/opensand opensand
python3 add_job.py -f ../../../openbach-extra/externals_jobs/stable_jobs/network/dambox dambox

echo "================================="
echo "Uninstall then install jobs on agents"
echo "================================="

while read agentip agententity
do
	for job in $joblist
	do
		python3 uninstall_jobs.py -j $job -a $agentip
		python3 install_jobs.py -j $job -a $agentip
	done
done < $inventorysimplified
cd ../../../openbach-example-4-agent/
