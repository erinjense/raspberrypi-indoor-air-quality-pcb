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

PATH_EXISTS=0
FSTAB_EXISTS=0
# fstab
# Create a dedicated mount point for specific Raspberry Pi USB Port

##########################################################################
# USB Ports from /dev/disk/by-path for Raspberry Pi 3 model B
#   Using the specific USB port allows mounting any USB drive on that port
#   ...even if it's dynamically mapped to /dev/sda1, /dev/sdb1, etc.
##########################################################################
TOPLEFT_USB_PORT="/dev/disk/by-path/platform-3f980000.usb-usb-0:1.2:1.0-scsi-0:0:0:0-part1"
TOPRIGHT_USB_PORT="/dev/disk/by-path/platform-3f980000.usb-usb-0:1.4:1.0-scsi-0:0:0:0-part1"
BOTTOMLEFT_USB_PORT="/dev/disk/by-path/platform-3f980000.usb-usb-0:1.3:1.0-scsi-0:0:0:0-part1"
BOTTOMRIGHT_USB_PORT="/dev/disk/by-path/platform-3f980000.usb-usb-0:1.5:1.0-scsi-0:0:0:0-part1"
##########################################################################

check_path()
{
    ls -l /dev/${SYM_LINK_NAME} 2> /dev/null | grep $1 > /dev/null 2>&1
    return $?
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
        echo "Adding the following entry to /etc/fstab"
        echo "${FSTAB_ENTRY}"
        echo '${FSTAB_ENTRY}' >> /etc/fstab
    fi
}

print_config()
{
    check_path "/dev/${SYM_LINK_NAME}"
    check=$?
    if [ $check -eq $PATH_EXISTS ]
    then
        check_path ${TOPLEFT_USB_PORT}
        check=$?
        if [ $check -eq $PATH_EXISTS ]
        then
            print_usb_config ${TOPLEFT_USB_PORT}
        fi
    
        check_path ${TOPRIGHT_USB_PORT}
        check=$?
        if [ $check -eq $PATH_EXISTS ]
        then
            print_usb_config ${TOPRIGHT_USB_PORT}
        fi
    
        check_path ${BOTTOMLEFT_USB_PORT}
        check=$?
        if [ $check -eq $PATH_EXISTS ]
        then
            print_usb_config ${BOTTOMLEFT_USB_PORT}
        fi
    
        check_path ${BOTTOMRIGHT_USB_PORT}
        check=$?
        if [ $check -eq $PATH_EXISTS ]
        then
            print_usb_config ${BOTTOMRIGHT_USB_PORT}
        fi
    else
        print_usb_config "Unconfigured"
    fi
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
                check_path "/dev/${SYM_LINK_NAME}"
                check=$?
                if [ $check -eq $PATH_EXISTS ]
                then
                    rm "/dev/${SYM_LINK_NAME}"
                fi
                break
                ;;
            n)
                return 0
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
                ln -s ${TOPLEFT_USB_PORT} /dev/${SYM_LINK_NAME}
                break
                ;;
            2)
                echo "Changing symbolic link for /dev/${SYM_LINK_NAME}"
                ln -s ${TOPRIGHT_USB_PORT} /dev/${SYM_LINK_NAME}
                break
                ;;
            3)
                echo "Changing symbolic link for /dev/${SYM_LINK_NAME}"
                ln -s ${BOTTOMLEFT_USB_PORT} /dev/${SYM_LINK_NAME}
                break
                ;;
            4)
                echo "Changing symbolic link for /dev/${SYM_LINK_NAME}"
                ln -s ${BOTTOMRIGHT_USB_PORT} /dev/${SYM_LINK_NAME}
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
    print_config
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
