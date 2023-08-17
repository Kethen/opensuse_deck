tgt_group=_deck

for f in /sys/devices/pci0000:00/0000:00:08.1/0000:04:00.0/hwmon/hwmon*/power*_cap /sys/class/backlight/*/brightness /sys/class/drm/card*/device/power_dpm_force_performance_level /sys/class/drm/card*/device/pp_od_clk_voltage
do
	if [ -e "$f" ]
	then
		chmod 664 "$f"
		chown 0:$tgt_group "$f"
	else
		echo skipping "$f" because it does not exist
	fi
done
