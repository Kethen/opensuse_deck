tdp_slow_device=""
tdu_fast_device=""

mode=$1
state_dir=/var/deck_tdp_save_restore

if [ -e /sys/devices/pci0000:00/0000:00:08.1/0000:04:00.0/hwmon/hwmon*/power1_cap ]
then
	tdp_slow_device=$(echo /sys/devices/pci0000:00/0000:00:08.1/0000:04:00.0/hwmon/hwmon*/power1_cap)
fi

if [ -e /sys/devices/pci0000:00/0000:00:08.1/0000:04:00.0/hwmon/hwmon*/power2_cap ]
then
	tdp_fast_device=$(echo /sys/devices/pci0000:00/0000:00:08.1/0000:04:00.0/hwmon/hwmon*/power2_cap)
fi

echo tdp slow device: $tdp_slow_device
echo tdp fast device: $tdp_fast_device

mkdir -p "$state_dir"

if [ -n "$tdp_slow_device" ]
then
	if [ "$mode" == "save" ]
	then
		echo saving slow tdp
		cat "$tdp_slow_device" > "$state_dir"/slow
	fi

	if [ "$mode" == "restore" ]
	then
		echo restoring slow tdp
		cat "$state_dir"/slow > "$tdp_slow_device"
	fi
else
	echo slow device not found
fi

if [ -n "$tdp_fast_device" ]
then
	if [ "$mode" == "save" ]
	then
		echo saving fast tdp
		cat "$tdp_fast_device" > "$state_dir"/fast
	fi

	if [ "$mode" == "restore" ]
	then
		echo restoring fast tdp
		cat "$state_dir"/fast > "$tdp_fast_device"
	fi
else
	echo fast device not found
fi
