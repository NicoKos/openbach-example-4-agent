#!/bin/bash

cd ../openbach-extra/executors/references/

python3 executor_network_rate.py fournuc --controller 10.10.0.5 --login openbach --password openbach --server-entity nuc1 --client-entity nuc2 --server-ip 10.10.1.1 --rate-limit 700 --post-processing-entity ctrl run --file time_series figure --data /home/star/results_QoS
#--rate limit is by default in kb/s, and iperf3 -u gives a data rate around 600 kb/s
