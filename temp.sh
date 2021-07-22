#!/bin/bash

delay=5

if  [ "$1" ]
then
	echo Setting delay interval = $1
	delay=${1}
else
	#echo "usage: temp.sh <intervnal in sec>"
	#exit 0
	echo Use default delay interval = $delay
fi

i="1"
while [ $i -gt 0 ]
do
	echo Loop $i
	echo [`cat /proc/uptime`]

	#./monitor | grep BDF 2>&1 
	#./monitor | grep -i hotspot 2>&1 
	./monitor | zegrep -i "BDF|HOTSPOT:" 2>&1

	i=$[$i+1]
	sleep ${delay}s
done
