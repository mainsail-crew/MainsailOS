#!/bin/bash

#####  run.sh - test new image
<<COMMENT
    Original by "prg3" ( https://github.com/prg3 ) and "Noms" ( https://github.com/Nomsplease )

    Modified by "KwadFan" ( https://github.com/KwadFan )

COMMENT

### Configuration
WORKSPACE=src/workspace
IMG_FILE=               #if blank, will be detected


## QEMU Parameters
#
# for Kernel Version 4.19.50-buster use
# QEMU_KERNEL='emulation/kernel-qemu-4.19.50-buster'
# QEMU_DTB='emulation/versatile-pb.dtb'
#
# you have also to modify run_image() function!

QEMU_BIN='qemu-system-arm'
QEMU_CPU='arm1176' #CPU Type
QEMU_RAM='256' # in Megabyte
QEMU_KERNEL='emulation/kernel-qemu-5.4.51-buster' #kernel image, do not modify except you what you doing.
QEMU_MACHINE='versatilepb'
QEMU_DTB='emulation/versatile-pb-buster-5.4.51.dtb'
QEMU_OPTIONS='-no-reboot -nographic'
QEMU_NET='-net user,ipv4=on,ipv6=on,hostfwd=tcp::22222-:22,hostfwd=tcp::8888-:80 -net nic'


### Functions

## Hint
start_hint() {
    echo -e "\e[1;30m\n------------------------------------\e[0m"
    echo -e "\e[1;31m Hit Control-a x to exit Emulation!\e[0m "
    echo -e "\e[1;30m------------------------------------\e[0m\n"
}

## looking for qemu-system-arm , package manager independent
search_for_qemu() {
    for BIN_PATH in $(awk -F':' '{ for(i=1;i<=NF;i++) print $i}' <<< ${PATH})
        do
            [[ -x $BIN_PATH/$QEMU_BIN ]] && { QEMU_CMD=$BIN_PATH/$QEMU_BIN ; break; } 
        done
}

## check if needed files missing.
check_env() {
    echo -e "\e[0;37mChecking Environment...\e[0m"
    if [ ! -z $QEMU_CMD ];
        then
            echo -e "\n\e[1;32mqemu-system-arm\e[0m installed..."
        else
            echo -e '\n\e[1;31mCommand qemu-system-arm not found:\n\e[0m
            \e[1;33mPlease install qemu-user-static and qemu-system-arm first!\e[0m'
            exit 2;
    fi
    if [ ! -e $QEMU_KERNEL ];
        then
            echo -e "\n\e[1;32m${QEMU_KERNEL}\e[0m missing, exiting..."
            exit 2
        else 
            echo -e "\n\e[1;32m${QEMU_KERNEL}\e[0m found..."
    fi
    if [ ! -e $QEMU_DTB ];
        then
            echo -e "\n\e[1;32m${QEMU_DTB}\e[0m missing, exiting..."
            exit 2
        else                         
            echo -e "\n\e[1;32m${QEMU_DTB}\e[0m found..."
    fi
}

img_file_handling() {
    if [ $(ls $WORKSPACE/*.img | wc -l) -gt 1 ];
        then
            echo -e "\n\e[1;33mOoops\e[0m, more than \e[1;32m1\e[0m Image found...\n"

            PS3='Choose Image File: '
            select IMAGE in $(cd $WORKSPACE && ls *.img)
                do
                    echo -e "\nUsing \e[1;32m$IMAGE\e[0m\n"
                    IMG_FILE=$IMAGE
                    break
                done

        elif [ $(ls $WORKSPACE/*.img | wc -l) = 1 ];
            then
                IMG_FILE=$(cd $WORKSPACE && ls *.img)
                echo -e "\nFound \e[1;32m${IMG_FILE}\e[0m in \e[1;34m${WORKSPACE}\e[0m\n"
            else
                echo -e "\n 'Image File' not specified or found, exiting script."
                exit 2
    fi
}

## run image 
run_img() {
  qemu-system-arm -cpu $QEMU_CPU -m $QEMU_RAM \
  -kernel $QEMU_KERNEL -M $QEMU_MACHINE -dtb \
  $QEMU_DTB $QEMU_OPTIONS \
  -append 'dwc_otg.lpm_enable=0 root=/dev/vda2 panic=1 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait' \
  -drive file=$WORKSPACE/$IMG_FILE,if=none,index=0,media=disk,format=raw,id=disk0 $QEMU_NET \
  -device "virtio-blk-pci,drive=disk0,disable-modern=on,disable-legacy=off"
}

## run image for Kernel Version 4.19.50-buster
#run_img() {
#  qemu-system-arm -cpu $QEMU_CPU -m $QEMU_RAM \
#  -kernel $QEMU_KERNEL -M $QEMU_MACHINE -dtb \
#  $QEMU_DTB $QEMU_OPTIONS \
#  -append 'dwc_otg.lpm_enable=0 root=/dev/sda2 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait' \
#  -drive file=$WORKSPACE/$IMG_FILE,index=0,media=disk,format=raw $QEMU_NET \ 
#}


### Main
start_hint
search_for_qemu
check_env
img_file_handling
run_img
