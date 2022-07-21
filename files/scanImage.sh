#!/bin/bash
sudo docker pull itresoldi/evilpetclinic:latest     
sudo ./twistcli images scan --u $TL_USER --p $TL_PASS --address https://$TL_CONSOLE --details itresoldi/evilpetclinic -o output.json
