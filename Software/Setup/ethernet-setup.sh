#!/bin/sh

###################################################################
# User Setup
###################################################################
LOGGER_NAME="Zephyrus-IAQ"
STATIC_IP="192.168.1.101/24"
INTERFACE="interface eth0\n"
IP_ADDR="static ip_address=${STATIC_IP}\n"
ROUTER="static router=192.168.1.254\n"
DOMAIN="static domain_name_server=8.8.8.8\n"
###################################################################

FILE="/etc/dhcpcd.conf"
HASH="#############################################################\n"
NOTE="# ${LOGGER_NAME}: Default Static IP Address\n"
HEADER=${HASH}${NOTE}${HASH}
OUTPUT=${HEADER}${INTERFACE}${IP_ADDR}${ROUTER}${DOMAIN}${HASH}
NOT_FOUND=1
FOUND=0

check_path()
{
    match=${1}
    less ${2} | grep ${match} > /dev/null 2>&1
    return $?
}

check_path ${LOGGER_NAME} ${FILE}
check=$?

# If Static IP is not already in /etc/dhcpcd.conf"
# Then set it
# If it's already set, it will need to be manually changed.
if [ $check -ne $FOUND ]
then
	tmp=${FILE}".tmp"
	echo ${HASH}
	echo "Setting Static Ethernet Address: ${STATIC_IP}..."
	echo ${OUTPUT} > ${tmp}
	less ${FILE}  >> ${tmp}
	mv   ${tmp} ${FILE}
else
	echo "Static Ethernet is already setup."
	echo  "Further changes need to be manually edited at: /etc/dhcpcd.conf"
fi
