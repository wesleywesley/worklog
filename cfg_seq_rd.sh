#!/bin/bash


echo BDF:$1

echo ======================================================================

total_start_time=`date +%s.%N`

for ((i = 0; i < 0x1000; i+=4))
	do
    
		#conver dec to hex
		tmp=`printf "%x" $i`

		#echo $tmp
		#echo offset: $tmp
		
		starti_time=`date +%s.%N`

		#read dword
		val=`setpci -s $1 $tmp.l`
		#sleep 1
		#echo val = $val

		end_time=`date +%s.%N`

		start_s=`echo $starti_time | cut -d '.' -f 1`
		#echo $start_s 
		start_ns=`echo $starti_time | cut -d '.' -f 2`
		#echo $start_ns
		end_s=`echo $end_time | cut -d '.' -f 1`
		#echo $end_s
		end_ns=`echo $end_time | cut -d '.' -f 2`
		#echo $end_ns
    
    
		time_micro=$(( (10#$end_s-10#$start_s)*1000000 + (10#$end_ns/1000 - 10#$start_ns/1000) ))
		time_ms=`expr $time_micro/1000  | bc `
    
		#echo "$time_micro microseconds"
		#echo "$time_ms ms"

		echo offset:$tmp - val=$val - ms:$time_ms - us:$time_micro
    
	done

total_end_time=`date +%s.%N`
echo total_start:$total_start_time
echo total_end  :$total_end_time

echo ======================================================================
