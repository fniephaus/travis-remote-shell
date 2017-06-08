#!/bin/bash

wget -O ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok.zip
{
    nc -l -v -p 8888 -e /bin/bash
    killall -SIGINT ngrok && echo "ngrok terminated"
} &
{
    ./ngrok tcp 8888 --authtoken=$NGROK_TOKEN --log=stdout --log-level=debug | grep "tcp.ngrok.io" || true
} &
