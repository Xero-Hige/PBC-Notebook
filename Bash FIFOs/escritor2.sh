#!/bin/bash
fifo=/tmp/my_fifo

i="0"
escritor="B"

while [ $i -lt 20 ]
do
	echo "$escritor $i" >$fifo
	i=$[$i+1]
	sleep 5s
done

echo "quit" >$fifo
