#!/bin/sh
> sensordata/sensor-$2.txt
printf "$2\n$3\n$4\n$5\n$6\n" >> sensordata/sensor-$2.txt
exit 0
