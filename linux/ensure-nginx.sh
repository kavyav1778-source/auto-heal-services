#!/bin/bash
# ensure-nginx.sh
# Script to auto-heal nginx service
# Logs actions to ~/sre/autoheal.log

LOGFILE="$HOME/sre/autoheal.log"

# Ensure log directory exists
mkdir -p "$HOME/sre"

# Check nginx status
if ! systemctl is-active --quiet nginx; then
    systemctl restart nginx
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    echo "$TIMESTAMP - nginx was down. Restarted automatically." >> "$LOGFILE"
fi
