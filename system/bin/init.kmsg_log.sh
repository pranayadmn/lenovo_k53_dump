#!/system/bin/sh
LOGDIR="/cache/FTM_AP"
LOGFILE=$LOGDIR"/kmsg.log"
MV_FILES_SHELL="/system/bin/mv_files.sh"

umask 022
if [ -e $LOGFILE ];then
      $MV_FILES_SHELL  $LOGFILE
fi
while [ 1 ]
do
        date  >> $LOGFILE
        echo "" >> $LOGFILE
        dmesg -c >>$LOGFILE
        sleep 10
done

