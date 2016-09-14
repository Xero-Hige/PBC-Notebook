#!/bin/bash
fifo=/tmp/my_fifo

i="0"
escritor="A"

while [ $i -lt 20 ]
do
	echo "$escritor $i" >$fifo
	i=$[$i+1]
	sleep 4s
done
