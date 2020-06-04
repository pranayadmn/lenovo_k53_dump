#!/system/bin/sh

#Copyright (c) 2015 Lenovo Co. Ltd

umask 022

LOGDIR="/cache/FTM_AP"
MAIN_LOGFILE=$LOGDIR"/main.log"
/system/bin/logcat -r8096 -n 256 -v threadtime -f $MAIN_LOGFILE

