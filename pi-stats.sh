#!/bin/bash
# Script: pi_stats.sh
# Purpose: Display Rpi3 Hostname, IP, Uptime, Temp, and Voltage
# Notes: Add alias 'STATS' to .bash_aliases
# Author: Jeremy Walton (Jan 3, 2018) under GPL v3.x
# ---------------------------------------------------
echo "-------------------------------------------"
echo "Status for $(hostname) | $(hostname -I | awk '{print $1}')"
echo "-------------------------------------------"
echo 'Currently =>' | tr '\n' ' ' ; date +'%Y-%m-%d %k:%M:%S' ;
echo "-------------------------------------------"
echo 'Up Since =>' | tr '\n' ' ' ; uptime -s ;
echo 'Duration =>' | tr '\n' ' ' ; uptime -p ;
echo "-------------------------------------------"
cpu=$(</sys/class/thermal/thermal_zone0/temp)
echo "GPU Temp => $(/opt/vc/bin/vcgencmd measure_temp)"
echo "CPU Temp => $((cpu/1000))'C"
echo "-------------------------------------------"
echo "Voltage => $(vcgencmd measure_volts core)"
echo "-------------------------------------------"
echo "CPU Memory => $(vcgencmd get_mem arm)"
echo "GPU Memory => $(vcgencmd get_mem gpu)"
echo "-------------------------------------------"
