## Package Install

1. starting with a gnome workstation base

2. install vulkan drivers

`zypper install libvulkan_radeon libvulkan_radeon-32bit`

3. install vulkan tools

`zypper install vulkan-tools vulkan-tools-32bit`

4. install 32bit mesa and tools

`zypper install Mesa-32bit Mesa-demo-x-32bit`

5. install xhost

`zypper install xhost`

6. install mangohud

`zypper install mangohud mangohud-32bit`

7. install steam

`zypper install steam`

8. install mangoapp

`zypper install mangoapp`

9. but then opensuse don't package gamescope, so for now source gamescope from f38

`zypper install <look for it on koji, ignore xwayland dependencies issue gnome already installed that>`

10. install h264 codecs

`zypper install mozilla-openh264 gstreamer-1.20-plugin-openh264`

11. install ibus

`zypper install ibus`

12. install cursor theme base

`zypper install breeze5-cursors`


## initrd drivers

1. /etc/dracut.conf adding drivers: usb_storage uas nvme nvme_core

```
echo 'force_drivers+=" usb_storage uas nvme nvme_core "' >> /etc/dracuf.conf
kernel-install add ...
```

## permission to device nodes

Power limit can be set at `/sys/devices/pci0000:00/0000:00:08.1/0000:04:00.0/hwmon/hwmon*/`, `power1_cap` and `power2_cap`

Screen brightness can be set at `/sys/devices/pci0000:00/0000:00:08.1/0000:04:00.0/drm/card*/card*-eDP-1/amdgpu_bl1/brightness`

gpu clock control at `/sys/class/drm/card*/device/power_dpm_force_performance_level` and `/sys/class/drm/card*/device/pp_od_clk_voltage` (newer kernel seems to use card1 instead and steam does not know how to handle that)

	create a deck group and give everyone in the deck group permission to access those using a systemd unit

## initial setup page

it runs /usr/bin/steamos-update with sudo to check if updates are available

	%deck ALL = NOPASSWD: /usr/bin/steamos-update, /usr/bin/jupiter-biosupdate

	when there is no update available, /usr/bin/steamos-update returns 7, /usr/bin/jupiter-biosupdate returns 0, put dummies there

## steam has hard coded paths for these resources
- /usr/share/icons/steam/cursors
- /usr/share/steamos/steamos-cursor.png
- /usr/share/steamos/steamos-cursor-config
- /usr/share/steamos/steamos.png

## issues

1. opensuse mangohud is currently broken in 32bit, which causes the frame limiter to not work in 32bit games

2. sometimes wayland session with gamescope just crashes on launch

3. need a stop steam shortcut as a non-steam game to go back to gdm, because steam uses org.freedesktop.DisplayManager to do that but it's not implemented in gdm

4. sometimes steam just crashes verifying install

5. steam shipped with suse's repo has trouble starting inside gamescope without going through update once

