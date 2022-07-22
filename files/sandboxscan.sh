#!/bin/bash

sudo ./twistcli sandbox -u $TL_USER -p $TL_PASS --address https://$TL_CONSOLE --output-file "sandbox.json" --analysis-duration 1m itresoldi/evilpetclinic:latest
