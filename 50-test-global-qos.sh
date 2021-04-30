#!/bin/bash

cd ../openbach-extra/executors/references/

python3 executor_network_global.py fournuc --controller 10.10.0.5 --login openbach --password openbach --server-entity nuc1 --client-entity nuc3 --server-ip 10.10.1.1 --client-ip 10.10.2.3 --rate-limit 1G --loss-measurement --post-processing-entity ctrl run --file time_series figure --data /home/star/results_global_no_tun/1-3
#--rate limit is by default in kb/s, and iperf3 -u gives a data rate around 600 kb/s

python3 executor_network_global.py fournuc --controller 10.10.0.5 --login openbach --password openbach --server-entity nuc2 --client-entity nuc3 --server-ip 10.10.2.2 --client-ip 10.10.2.3 --rate-limit 1G --loss-measurement  --post-processing-entity ctrl run --file time_series figure --data /home/star/results_global_no_tun/2-3

