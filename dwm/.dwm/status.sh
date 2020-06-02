while true; do
	xsetroot -name "MEM: $(free -h | awk '(NR==2){ print $3 }') | THERM: $(sed 's/000$/°C/' /sys/class/thermal/thermal_zone0/temp) | BAT: $(cat /sys/class/power_supply/BAT0/capacity)% | $(date)"
	sleep 10
done
