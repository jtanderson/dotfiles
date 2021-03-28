#!/bin/bash

for i in *.webp; do
    dwebp "$i" -o "${i%.*}.png"
done
