#!/usr/bin/env bash

set -e

# Kill background processes on exit
# FIXME Doesn't seem to work with ssh option -f ...
trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT

echo "Generating SSH config..."
vagrant ssh-config > /tmp/vssh-config-lotsa
echo "Connecting to Vagrant SSH server..."
ssh -fN -L 4369:localhost:4369 -L 9001:localhost:9001 -F /tmp/vssh-config-lotsa lotsa
sleep 2
echo "Starting iex..."
iex --name console@127.0.0.1 --cookie lotsa -e 'IO.inspect(:net_adm.ping(:"lotsa@127.0.0.1"))'
