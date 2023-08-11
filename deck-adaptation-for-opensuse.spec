Name:           deck-adaptation-for-opensuse
Version:        0.1
Release:        0
License:        MIT
Summary:        Tweaks for running opensuse on the steam deck
BuildRoot:      %{_tmppath}/%{name}-%{version}-build
ExclusiveArch: x86_64
Source0: overlay
Requires: libvulkan_radeon
Requires: libvulkan_radeon-32bit
Requires: libvulkan_intel
Requires: libvulkan_intel-32bit
Requires: vulkan-tools
Requires: vulkan-tools-32bit
Requires: Mesa
Requires: Mesa-32bit
Requires: Mesa-demo-x
Requires: Mesa-demo-x-32bit
Requires: xhost
Requires: mangohud
Requires: steam
Requires: mangoapp
Requires: mozilla-openh264
Requires: gstreamer-1.20-plugin-openh264
Requires: ibus
Requires: breeze5-cursors
Requires: gamescope
Requires: xinput
Requires: xrandr

%description
Tweaks for running opensuse on the steam deck, includes saving and restoring TDP, setting /sys node permissions and a gamescope session

%install
cp -r %{SOURCE0}/. %{buildroot}

%clean

%files
%defattr(-,root,root)
/etc/sudoers.d/99_deck
/etc/skel/.local/share/kscreen/5d78196844f9468bd2c22ad4cf90b67d
/etc/skel/.local/share/kscreen/outputs/500f751a3a181fe55dc6840753b7f8ab
/usr/bin/gamescope_janked_session
/usr/bin/jupiter-biosupdate
/usr/bin/steamos-update
/usr/bin/steamos-session-select
/usr/lib/systemd/system/deck_permissions.service
/usr/lib/systemd/system/deck_tdp_restore.service
/usr/lib/systemd/system/deck_tdp_save.service
/usr/lib/systemd/system/graphical.target.wants/deck_permissions.service
/usr/lib/systemd/system/graphical.target.wants/deck_tdp_restore.service
/usr/lib/systemd/system/poweroff.target.wants/deck_tdp_save.service
/usr/lib/systemd/system/reboot.target.wants/deck_tdp_save.service
/usr/lib/systemd/system/sleep.target.wants/deck_tdp_restore.service
/usr/lib/systemd/system/sleep.target.wants/deck_tdp_save.service
/usr/lib/sddm/sddm.conf.d/12-sddm_deck_screen_rotate.conf
/usr/libexec/deck_tdp_save_restore.sh
/usr/libexec/deck_permissions.sh
/usr/libexec/sddm_deck_screen_rotate.sh
/usr/share/icons/steam/cursors/arrow
/usr/share/icons/steam/cursors/default
/usr/share/icons/steam/cursors/left_ptr
/usr/share/icons/steam/cursors/left_ptr_help
/usr/share/icons/steam/cursors/left_ptr_watch
/usr/share/icons/steam/index.theme
/usr/share/steamos/steamos-cursor-config
/usr/share/steamos/steamos-cursor.png
/usr/share/steamos/steamos.png
/usr/share/wayland-sessions/gamescope_janked.desktop
/usr/share/polkit-1/rules.d/70-deck-nm.rules

%changelog
* Tue Aug 08 2023 Katharine Chui <kwchuiaa@connect.ust.hk> - 0.1
- nothing for now
