#!/bin/bash

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

if [[ "$1" == "select" ]]; then
  EXPORT_TYPE="select"
  INDEX="select.txt"
  SRC_FILE="select.svg"
else
  EXPORT_TYPE="icons"
  INDEX="logos.txt"
  SRC_FILE="logos-$1.svg"
fi

if [[ "$2" == "1920x1200" ]]; then
  ASSETS_DIR="assets-$1/$EXPORT_TYPE-1920x1200"
  EXPORT_DPI="96"
elif [[ "$2" == "2560x1600" ]] || [[ "$2" == "2K" ]]; then
  ASSETS_DIR="assets-$1/$EXPORT_TYPE-2560x1600"
  EXPORT_DPI="144"
else
  echo "Please use either '1920x1200' or '2560x1600'"
  exit 1
fi

install -d "$ASSETS_DIR"

while read -r i; do
  if [[ -f "$ASSETS_DIR/$i.png" ]]; then
    echo "$ASSETS_DIR/$i.png exists"
  elif [[ "$i" == "" ]]; then
    continue
  else
    echo -e "\nRendering $ASSETS_DIR/$i.png"
    $INKSCAPE "--export-id=$i" \
              "--export-dpi=$EXPORT_DPI" \
              "--export-id-only" \
              "--export-filename=$ASSETS_DIR/$i.png" "$SRC_FILE" >/dev/null
    $OPTIPNG -strip all -nc "$ASSETS_DIR/$i.png"
  fi
done < "$INDEX"

if [[ "$EXPORT_TYPE" == "icons" ]]; then
  cd "$ASSETS_DIR" || exit 1
  cp -a archlinux.png arch.png
  cp -a gnu-linux.png linux.png
  cp -a gnu-linux.png unknown.png
  cp -a gnu-linux.png lfs.png
  cp -a manjaro.png Manjaro.i686.png
  cp -a manjaro.png Manjaro.x86_64.png
  cp -a manjaro.png manjarolinux.png
  cp -a pop-os.png pop.png
  cp -a driver.png memtest.png
fi
exit 0
