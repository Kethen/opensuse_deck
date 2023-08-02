tgt_group=deck

for f in /sys/devices/pci0000:00/0000:00:08.1/0000:04:00.0/hwmon/hwmon*/power*_cap /sys/devices/pci0000:00/0000:00:08.1/0000:04:00.0/drm/card1/card1-eDP-1/amdgpu_bl1/brightness /sys/class/drm/card*/device/power_dpm_force_performance_level /sys/class/drm/card*/device/pp_od_clk_voltage
do
	chmod 664 $f
	chown 0:$tgt_group $f
done
