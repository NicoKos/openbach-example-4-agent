#!/bin/bash

cd ../openbach-extra/executors/references/

python3 executor_network_rate.py fournuc --controller 10.10.0.5 --login openbach --password openbach --server-entity nuc1 --client-entity nuc3 --server-ip 10.10.1.1 --rate-limit 700
