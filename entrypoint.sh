#!/bin/sh

# Start Xvfb
echo "Starting Xvfb"
Xvfb :99 -ac -screen 0 $XVFB_WHD -nolisten tcp &
pid="$!"
trap "echo 'Stopping Xvfb - pid: $pid'; kill -SIGTERM $pid" SIGINT SIGTERM

# Wait for process to end.
while kill -0 $pid > /dev/null 2>&1; do
    wait
done
echo "Exiting"
