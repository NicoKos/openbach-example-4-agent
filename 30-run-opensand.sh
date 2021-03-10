#!/bin/bash

cd ../openbach-extra/executors/examples/

python3 example_opensand.py --controller 10.10.0.4 --login openbach --password openbach fournuc --sat nuc2 10.10.0.2 --gateway nuc1 10.10.0.1  --satellite-terminal nuc3 --duration 10 run
