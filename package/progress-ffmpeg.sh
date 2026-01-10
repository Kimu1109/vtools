#!/bin/bash

calc_duration(){
duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$1")
}
progress_ffmpeg() {
while IFS='=' read -r key value; do
  case "$key" in
    out_time_ms)
      current_time=$(echo "scale=2; $value / 1000000" | bc)
      percent=$(echo "scale=2; 100 * $current_time / $duration" | bc)
      remaining=$(echo "$duration - $current_time" | bc)
      remaining_int=$(printf "%.0f" "$remaining")

      filled_length=$(printf "%.0f" "$(echo "$percent * $bar_length / 100" | bc)")
      empty_length=$((bar_length - filled_length))

      bar=$(printf "%0.s#" $(seq 1 $filled_length))
      bar+=$(printf "%0.s-" $(seq 1 $empty_length))

      rem_m=$((remaining_int / 60))
      rem_s=$((remaining_int % 60))
      remaining_str=$(printf "%02d:%02d" "$rem_m" "$rem_s")

      printf "\r\033[K[%s] %5.1f%% | %s" "$bar" "$percent" "$remaining_str", $1 > "/dev/stderr"
      ;;
    progress)
  esac
done
}
