#!/bin/sh

sketchybar --add item weather right \
  --set weather \
  icon=󰖐 \
  padding_right=5 \
  script="$PLUGIN_DIR/weather.sh" \
  update_freq=1500 \
  --subscribe weather mouse.clicked

