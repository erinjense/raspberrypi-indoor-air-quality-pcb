#!/bin/sh
BASE=$PWD/../../
CMD="@reboot cd $BASE && ./start.sh"

crontab -l > tmp-crontab
echo $CMD >> tmp-crontab
crontab tmp-crontab
rm tmp-crontab
