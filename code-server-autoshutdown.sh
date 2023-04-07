#!/bin/bash

# Full path of the code-server heartbeat file.
# By default its in ~/.local/share/code-server/heartbeat
HEARTBEAT_FILE="/home/pietro/.local/share/code-server/heartbeat"

# Max lifetime in seconds. 600 is 10 minutes.
MAX_LIFETIME=600

current=`date +%s`
lastmod=`stat -c "%Y" $file`

if [ $(($current-$last_modified)) -gt $MAX_LIFETIME ]; then
  systemctl stop code-server.service
fi