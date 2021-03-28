#!/bin/bash

for i in *.mkv; do
    ffmpeg -i "$i" -codec copy -c:a aac "${i%.*}.mp4"
done
