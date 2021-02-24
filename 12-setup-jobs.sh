#!/bin/bash

nuc1IP=$1
nuc2IP=$2
nuc3IP=$3
nuc4IP=$4
joblist=$5

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

for agents in $nuc1IP $nuc2IP $nuc3IP $nuc4IP
do
	for job in $joblist
	do
		python3 uninstall_jobs.py -j $job -a $agents
		python3 install_jobs.py -j $job -a $agents
	done
done
cd ../../../openbach-example-4-agent/
