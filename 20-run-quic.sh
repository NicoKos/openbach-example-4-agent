#!/bin/bash

mkdir /home/star/Desktop/results_quic

cd ../openbach-extra/executors/examples/

python3 quic_configure_link.py --controller 10.10.0.4 --login openbach --password openbach fournuc --bandwidth-server-to-client 10M --bandwidth-client-to-server 1M --delay-server-to-client 25 --delay-client-to-server 25 --up-iface ensI1 --down-iface ensI2 --server nuc1 --server-ip 10.10.1.1 --server-implementation picoquic --client nuc3 --client-implementation picoquic --resources 10M_file.txt --download-dir /tmp/ --server-log-dir /tmp/ --client-log-dir /tmp/ --nb-runs 1 --pcaps-dir /tmp/ --report-dir /tmp/ --post-processing-entity nuc4 run --file time_series figure --data /home/star/Desktop/results_quic

