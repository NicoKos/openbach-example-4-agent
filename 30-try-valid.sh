#!/bin/bash

cd ../openbach-extra/validation_suite/

python3 validation_suite.py --controller 10.10.0.4 --login openbach --password openbach -s 10.10.0.1 -S 10.10.0.1 -c 10.10.0.3 -C 10.10.0.3 -m 10.10.0.3 -M 10.10.0.3 -i ensA -u star -p azerty123
