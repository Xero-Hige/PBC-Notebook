#!/bin/bash

fifo=/tmp/my_fifo

while true
do
	sleep 6s
	read line <$fifo
	echo $line

	if [[ "$line" == 'quit' ]]; then
		break
	fi
done
