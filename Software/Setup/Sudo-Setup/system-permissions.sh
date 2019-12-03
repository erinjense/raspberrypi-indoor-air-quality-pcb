#!/bin/sh

# This enables any user on the system to shutdown the computer
DIR="${PWD}/Sudo-Setup"
FILE="${DIR}/Zephyrus_IAQ_shutdown.pkla"
LOCATION="/etc/polkit-1/localauthority/50-local.d/"

cp ${FILE} ${LOCATION}
