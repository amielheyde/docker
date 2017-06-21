#!/bin/bash
set -x

userdel -rf desktop

: ${AUSER=desktop}
: ${AUID=1000}

useradd -m -o -u ${AUID} ${AUSER}
adduser ${AUSER} dialout

sudo -u ${AUSER} arduino
