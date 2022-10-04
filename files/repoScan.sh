#!/bin/bash -l
ls -lart
./twistcli coderepo scan --address https://$TL_CONSOLE --details -u $TL_USER -p $TL_PASS ./app
twistcli -v