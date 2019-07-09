#!/bin/bash

FNAME=/usr/share/applications/spotify.desktop

if [ -f $FNAME ]; then
  sudo sed -i 's/^Exec=spotify.*/Exec=spotify --force-device-scale-factor=2 %U/' $FNAME
fi
