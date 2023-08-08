#!/bin/bash
xrandr --output eDP-1 --rotate right
xinput set-prop 'FTS3528:00 2808:1015' --type=float 'Coordinate Transformation Matrix'  0 1 0 -1 0 1 0 0 1
