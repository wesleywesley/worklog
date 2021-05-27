#!/bin/bash

rm auto.log

date >> auto.log

i="0"
while [ $i -lt 50 ]
do 

echo Loop $i
rmmod gim
insmod gim.ko

echo loop $i >> auto.log
lspci |grep 73a >> auto.log

echo PF >> auto.log
grep -o '73a1' auto.log |wc -l >> auto.log
PF=`grep -o '73a1' auto.log |wc -l`

echo VF >> auto.log
grep -o '73ae' auto.log |wc -l >> auto.log
VF=`grep -o '73ae' auto.log |wc -l`

if (( $PF == $VF ))
then
	echo == PF:$PF VF:$VF >> auto.log
else
	echo != PF:$PF VF:$VF >> auto.log
	break
fi


i=$[$i+1]

done


date >> auto.log
