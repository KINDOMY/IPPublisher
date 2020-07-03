#!/bin/bash
LAST_IP=$(curl http://members.3322.org/dyndns/getip)
echo $LAST_IP > ip.txt
git commit -a -m "update ip"
git push
while :
do
	IP=$(curl http://members.3322.org/dyndns/getip)
	if [ "$LAST_IP" -ne "$IP" ]; then
		echo $IP > ip.txt
		git commit -a -m "update ip"
		git push
		LAST_IP=$IP
	fi
	sleep 60
done
