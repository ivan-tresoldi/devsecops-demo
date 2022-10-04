ECHO $TL_USER
ECHO $TL_CONSOLE
curl -L -k -u $TL_USER:$TL_PASS https://$TL_CONSOLE/api/v1/util/twistcli > twistcli; chmod a+x twistcli;
