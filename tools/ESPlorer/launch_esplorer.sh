#!/usr/bin/env bash

if hash java 2>/dev/null; then
  echo "Launching ESPlorer..."
  java -jar ESPlorer.jar > /dev/null 2>&1 &
else
  echo "ERROR: java is not in your PATH. You need to fix that."
  exit 1
fi

