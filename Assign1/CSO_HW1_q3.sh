#!/bin/bash
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem  > out
c=1
while [[ "$c" -eq "$c" ]]; do
	cat out | head -$1
	echo
	sleep "$2"
done
# Here -o option of ps allows you to specify the output format . . A favorite of mine is to show the processes’ PIDs (pid), PPIDs (pid), the name of the executable file associated with the process (cmd), and the RAM and CPU utilization (%mem and %cpu, respectively).
# I have used here --sort to sort either by %mem or %cpu . By default , it will sort in ascending order. That's why we have put - sign after sort so that it will sort in descending order
#If you want to print for every x second do like this-
#			watch -n x ./c3.sh
