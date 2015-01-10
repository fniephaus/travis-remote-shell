# Connect to Travis-CI via Remote Shell
[![Build Status](https://travis-ci.org/fniephaus/travis-remote-shell.svg?branch=master)](https://travis-ci.org/fniephaus/travis-remote-shell)
## What is This?
Sometimes builds on [Travis-CI](https://travis-ci.org/) fail for inexplicable reasons. In cases like this, debugging the problem can be very time-consuming. Instead of having to replicate a Travis-CI worker locally, this script helps to connect to a real Travis-CI worker remotely in order to be able to execute command-line tools for debugging purposes.

## How to Use
Create a new branch and add the following lines to your `.travis.xml`:
```
before_install:
  - eval "$(curl -sL https://raw.github.com/fniephaus/travis-remote-shell/master/run.sh)"
```

Search your Travis-CI log for a line like [this](https://travis-ci.org/fniephaus/travis-remote-shell#L130) and determine the port:
```bash
[01/10/15 00:59:22] [INFO] [client] Tunnel established at tcp://ngrok.com:36409
```

Open your local terminal and run:
```bash
nc ngrok.com 36409
```

## Credits
This script utilizes [ngrok](https://github.com/inconshreveable/ngrok).
