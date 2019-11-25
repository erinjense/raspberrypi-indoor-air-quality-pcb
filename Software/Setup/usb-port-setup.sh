#!/bin/sh

#################################################################################
# MIT License
#
# Copyright (c) 2019 Aaron Jense, Amy Heidner, Dennis Heidner
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#################################################################################

SYM_LINK_NAME="zephyrus-iaq-usb"
FSTAB_ENTRY="/dev/${SYM_LINK_NAME} /media/${SYM_LINK_NAME} auto user,umask=000,utf8,noauto 0 0"
RULES_PATH="/etc/udev/rules.d/75-${SYM_LINK_NAME}.rules"

PATH_EXISTS=0
FSTAB_EXISTS=0
# fstab
# Create a dedicated mount point for specific Raspberry Pi USB Port

##########################################################################
# USB Ports from /dev/disk/by-path for Raspberry Pi 3 model B
#   Using the specific USB port allows mounting any USB drive on that port
#   ...even if it's dynamically mapped to /dev/sda1, /dev/sdb1, etc.
##########################################################################
TOPLEFT_USB_PORT="1.1.2"
TOPRIGHT_USB_PORT="1.3"
BOTTOMLEFT_USB_PORT="1.1.3"
BOTTOMRIGHT_USB_PORT="1.2"
##########################################################################

check_path()
{
    match='ATTRS{devpath}=="'${1}'"'
    less ${RULES_PATH} | grep ${match} > temp
    ret=$?
    rm temp
    return $ret
}

print_usb_config()
{
    empty="  "
    used="X "
    _print()
    {
        echo ""
        echo "Port with 'X' is dedicated to /dev/${SYM_LINK_NAME}"
        echo "--------  --------"
        echo "|  $1  |  |  $2  |"
        echo "--------  --------"
        echo "--------  --------"
        echo "|  $3  |  |  $4  |"
        echo "--------  --------"
        echo ""
    }
    # Print empty USB ports if no argument was supplied
    if [ $# -eq 0 ]
    then
        _print "${empty}" "${empty}" "${empty}" "${empty}"
	return
    fi

    if [ $1 = ${TOPLEFT_USB_PORT} ]
    then
        _print "${used}" "${empty}" "${empty}" "${empty}"
    elif [ $1 = ${TOPRIGHT_USB_PORT} ]
    then
        _print "${empty}" "${used}" "${empty}" "${empty}"
    elif [ $1 = ${BOTTOMLEFT_USB_PORT} ]
    then
        _print "${empty}" "${empty}" "${used}" "${empty}"
    elif [ $1 = ${BOTTOMRIGHT_USB_PORT} ]
    then
        _print "${empty}" "${empty}" "${empty}" "${used}"
    else
        _print "${empty}" "${empty}" "${empty}" "${empty}"
    fi
}

check_fstab_entry()
{
    # Check if sym-link is in fstab
    less /etc/fstab | grep "${FSTAB_ENTRY}" > /dev/null 2>&1
    check=$?
    if [ $check -ne $FSTAB_EXISTS ]
    then
	echo "########################################################################"
	echo "                              Updating /etc/fstab                       "
	echo "########################################################################"
        echo "Adding the following entry to /etc/fstab"
        echo "${FSTAB_ENTRY}"
	echo "########################################################################"
        echo "${FSTAB_ENTRY}" >> /etc/fstab
    fi
}

print_config()
{
    check_path ${TOPLEFT_USB_PORT}
    check=$?
    if [ $check -eq $PATH_EXISTS ]
    then
        print_usb_config ${TOPLEFT_USB_PORT}
	return
    fi

    check_path ${TOPRIGHT_USB_PORT}
    check=$?
    if [ $check -eq $PATH_EXISTS ]
    then
        print_usb_config ${TOPRIGHT_USB_PORT}
	return
    fi

    check_path ${BOTTOMLEFT_USB_PORT}
    check=$?
    if [ $check -eq $PATH_EXISTS ]
    then
        print_usb_config ${BOTTOMLEFT_USB_PORT}
	return
    fi

    check_path ${BOTTOMRIGHT_USB_PORT}
    check=$?
    if [ $check -eq $PATH_EXISTS ]
    then
        print_usb_config ${BOTTOMRIGHT_USB_PORT}
	return
    fi

    print_usb_config
}

new_sym_link_prompt()
{
    echo "Would you like to change the USB port configuration?"
    echo "Enter [y]es or [n]o"
    while :
    do
        read INPUT
        case $INPUT in
            y)
		check_fstab_entry
    		rm "${RULES_PATH}"
                break
                ;;
            n)
                exit
                ;;
            *)
                echo "Invalid Input"
                echo "Enter [y]es or [n]o"
                ;;
        esac
    done

    echo "Enter 0-4 for the following options:"
    echo "0) No port"
    echo "1) Top Left port"
    echo "2) Top Right port"
    echo "3) Bottom Left port"
    echo "4) Bottom Right port"

    while :
    do
        read INPUT
        case $INPUT in
            0)
                break
                ;;
            1)
                echo "Changing symbolic link for /dev/${SYM_LINK_NAME}"
                PORT=${TOPLEFT_USB_PORT}
                break
                ;;
            2)
                echo "Changing symbolic link for /dev/${SYM_LINK_NAME}"
                PORT=${TOPRIGHT_USB_PORT}
                break
                ;;
            3)
                echo "Changing symbolic link for /dev/${SYM_LINK_NAME}"
                PORT=${BOTTOMLEFT_USB_PORT}
                break
                ;;
            4)
                echo "Changing symbolic link for /dev/${SYM_LINK_NAME}"
                PORT=${BOTTOMRIGHT_USB_PORT}
                break
                ;;
            *)
                echo "Invalid Input"
                echo "Enter 0-4 for the following options:"
                echo "0) No port"
                echo "1) Top Left port"
                echo "2) Top Right port"
                echo "3) Bottom Left port"
                echo "4) Bottom Right port"
                ;;
        esac
    done

    if [ -z ${PORT+x} ]
    then
	break
    else
    	rules_entry='KERNEL=="sd?1", SUBSYSTEM=="block", SUBSYSTEMS=="usb", ATTRS{devpath}=='
	rules_entry=${rules_entry}'"'${PORT}'", SYMLINK+="'${SYM_LINK_NAME}'"'
	echo ${rules_entry} >> "${RULES_PATH}"
    fi

    udevadm control --reload-rules && udevadm trigger
    print_usb_config ${PORT}
}

echo "########################################################################"
echo "                  Raspberry Pi Dedicated USB Port Setup             "
echo "########################################################################"

print_config
new_sym_link_prompt

echo "########################################################################"
echo "                          SETUP COMPLETE                                "
echo "########################################################################"
echo "Instructions for mounting USB:"
echo "1. Plug USB into the port from the configuration diagram."
echo "2. Mount USB with 'mount /dev/${SYM_LINK_NAME}'"
echo "un-mount USB with 'umount /dev/${SYM_LINK_NAME}'"
echo "########################################################################"
