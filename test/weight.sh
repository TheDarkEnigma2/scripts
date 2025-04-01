#!/usr/bin/env bash

# This script prints a message about your weight if you give it your
# weight in kilos and height in centimetres.

if [ ! $# == 2 ]; then
  echo "Usage: $0 weight_in_kilos length_in_centimetres"
  exit
fi

weight="$1"
height="$2"
idealweight="$((height - 110))"

if [ "$weight" -le "$idealweight" ]; then
  echo "Manĝu pli iomete da grason."
else
  echo "Manĝu pli iomete da fruktojn."
fi
