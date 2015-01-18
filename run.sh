#!/bin/bash

sudo apt-get install netcat
wget -O ngrok.zip https://api.equinox.io/1/Applications/ap_pJSFC5wQYkAyI0FIVwKYs9h1hW/Updates/Asset/ngrok.zip\?os\=linux\&arch\=386\&channel\=stable
unzip ngrok.zip
{
    nc.traditional -l -v -p 8888 -e /bin/bash
    killall -SIGINT ngrok && echo "ngrok terminated"
} &
{
    ./ngrok -authtoken=$NGROK_TOKEN -log="stdout" -proto=tcp 8888 | grep "Tunnel established at" || true
} &