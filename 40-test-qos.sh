#!/bin/bash

cd ../openbach-extra/executors/references/

python3 executor_network_rate.py --controller 10.10.0.5 --login openbach --password openbach --server-entity 10.10.0.1 --client-entity 10.10.0.3 --server-ip 10.10.0.1 fournuc  --rate-limit 700
