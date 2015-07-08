#!/bin/bash

sudo apt-get install netcat
wget -O ngrok.zip https://dl.ngrok.com/ngrok_2.0.19_linux_amd64.zip
unzip ngrok.zip
{
    nc.traditional -l -v -p 8888 -e /bin/bash
    killall -SIGINT ngrok && echo "ngrok terminated"
} &
{
    ./ngrok tcp 8888 --authtoken=$NGROK_TOKEN --log=stdout --log-level=debug | grep "tcp.ngrok.io" || true
} &