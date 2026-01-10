#!/bin/bash

readSetting() {
  local key="$1"
  local section="setting"
  local app_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  local ini_file="$app_path/config.ini"

  awk -F= -v section="$section" -v key="$key" '
    $0 == "["section"]" {in_section=1; next}
    /^\[/ {in_section=0}
    in_section && $1 == key {
      print $2
      exit
    }
  ' "$ini_file"
}