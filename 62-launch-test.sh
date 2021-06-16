#!/bin/bash

cd ../openbach-extra/executors/references

rep=$1

#read -p 'results repository : ' rep

python3 executor_network_global.py fournuc --controller 10.10.0.5 --login openbach --password openbach --server-entity nuc1 --client-entity nuc3 --server-ip 10.10.1.1 --client-ip 100.100.2.3 --rate-limit 1G --loss-measurement --post-processing-entity ctrl run --file time_series figure  --file histogram figure --data /home/star/$rep/1-3

python3 executor_network_global.py fournuc --controller 10.10.0.5 --login openbach --password openbach --server-entity nuc2 --client-entity nuc3 --server-ip 100.100.2.2 --client-ip 100.100.2.3 --rate-limit 1G --loss-measurement  --post-processing-entity ctrl run --file time_series figure --file histogram figure --data /home/star/$rep/2-3

python3 executor_network_global.py fournuc --controller 10.10.0.5 --login openbach --password openbach --server-entity nuc1 --client-entity nuc2 --server-ip 10.10.1.1 --client-ip 10.10.1.2 --rate-limit 1G --loss-measurement  --post-processing-entity ctrl run --file time_series figure --file histogram figure --data /home/star/$rep/1-2

