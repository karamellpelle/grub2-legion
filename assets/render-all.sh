#!/bin/bash

THEMES=("color" "white" "whitesur" "select")
RESOLUTIONS=("1920x1200" "2560x1600" )

for theme in "${THEMES[@]}"; do
  for resolution in "${RESOLUTIONS[@]}"; do
    echo "./render-assets.sh \"$theme\" \"$resolution\": "
    ./render-assets.sh "$theme" "$resolution"
  done
done
