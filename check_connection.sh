#!/bin/sh

# Check Connection to designated AllStarLink nodes and reconnect if disconnected
# Author: Freddie Mac - KD5FMU
# Author: Jory A Pratt - W5GLE
# Convert script to be posix compliant and handle multiple nodes 1/12/2025

# Set your AllStarLink node number
MY_NODE=XXXXXX

# Set target nodes as a space-separated list (e.g., "12345 67890")
TARGET_NODES="XXXXXX XXXXXX"

# Function to check and reconnect to a target node
check_and_reconnect() {
  TARGET_NODE=$1
  if ! /usr/sbin/asterisk -rx "rpt lstats $MY_NODE" | grep -q "$TARGET_NODE"; then
    echo "Node $MY_NODE is not connected to node $TARGET_NODE. Reconnecting..."
    /usr/sbin/asterisk -rx "rpt fun $MY_NODE *3$TARGET_NODE"
  else
    echo "Node $MY_NODE is already connected to node $TARGET_NODE."
  fi
}

# Iterate through all target nodes
for TARGET_NODE in $TARGET_NODES; do
  check_and_reconnect "$TARGET_NODE"
done
