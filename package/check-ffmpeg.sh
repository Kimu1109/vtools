#!/bin/bash

dpkg -s ffmpeg >/dev/null 2>&1
if [ ! $? -eq 0 ]; then
  echo "\033[0;31mTHIS SCRIPT REQUIRES FFMPEG PACKAGE\033[0;39m"
  exit -1
fi
