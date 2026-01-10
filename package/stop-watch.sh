#!/bin/bash

start_watch(){
start_time=$(cat /proc/uptime | awk '{print $1}')
}
stop_watch(){
end_time=$(cat /proc/uptime | awk '{print $1}')
diff_sec=$(echo "$end_time - $start_time" | bc)
}
done_watch(){
echo "done! time:"$diff_sec"sec" >&2
}
