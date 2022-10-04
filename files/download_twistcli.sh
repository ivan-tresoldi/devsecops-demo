#!/bin/bash -l

# curl -L -k -u $TL_USER:$TL_PASS https://$TL_CONSOLE/api/v1/util/twistcli > twistcli; chmod a+x twistcli;

curl --progress-bar -L -k --header "authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiaXRyZXNvbGRpX3BhbG9hbHRvbmV0d29ya3NfY29tIiwicm9sZSI6ImFkbWluIiwiZ3JvdXBzIjpbImFkbWlucyIsImRldm9wcyJdLCJyb2xlUGVybXMiOltbMjU1LDI1NSwyNTUsMjU1LDI1NSwxMjcsMV0sWzI1NSwyNTUsMjU1LDI1NSwyNTUsMTI3LDFdXSwicGVybWlzc2lvbnMiOlt7InByb2plY3QiOiJDZW50cmFsIENvbnNvbGUifV0sInNlc3Npb25UaW1lb3V0U2VjIjo4NjQwMCwiZXhwIjoxNjY0OTUzOTY3LCJpc3MiOiJ0d2lzdGxvY2sifQ.yRc50hnU-Qn8bKY0DT484ssTrdqd_PUiMthiG7YvmjA" https://console-master-demoenv.itresoldi.demo.twistlock.com/api/v1/util/twistcli > twistcli; chmod a+x twistcli;
ls -lart
