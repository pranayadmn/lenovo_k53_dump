#!/system/bin/sh
#Copyright (c) 2016 Lenovo Co. Ltd	
#Authors: xuwt2@lenovo.com

if [ $(getprop persist.sys.lenovo.log.path) = INVALID ]; then
        exit
fi


#if [ -z "$1" ]; then
    LOGDIR=$(getprop persist.sys.lenovo.log.path)
#else
#    LOGDIR=$2
#fi


LOGFILE=$LOGDIR"/perf_log_"  
PROC_VMSTAT=$LOGDIR"/tmp_proc_vmstat" 
VMSTAT=$LOGDIR"/tmp_vmstat" 
IOSTAT=$LOGDIR"/tmp_iostat" 
LOADAVG=$LOGDIR"/tmp_proc_loadavg"
RECORD_COUNT=$1 

LOGFILE=$LOGFILE"$(date "+%Y-%m-%d-%H:%M:%S")" 



record_proc_vmstat()
{

    if [ -f "$PROC_VMSTAT" ] ; then
        rm "$PROC_VMSTAT"
    fi
    
    i=0                  
    while [ $i -ne $RECORD_COUNT ]
    do
         echo "    " >> "$PROC_VMSTAT"
         echo "*************************************************" >> $PROC_VMSTAT 
         date >> $PROC_VMSTAT
         echo "*************************************************" >> $PROC_VMSTAT
         echo "    " >> "$PROC_VMSTAT"
         cat /proc/vmstat >> $PROC_VMSTAT
         let i+=1
         sleep 1
     done
}

record_vmstat()
{
    if [ -f "$VMSTAT" ] ; then
        rm "$VMSTAT"
    fi

         echo "    " >> "$VMSTAT"
         echo "*************************************************" >> $VMSTAT 
         date >> $VMSTAT
         echo "*************************************************" >> $VMSTAT
         echo "    " >> "$VMSTAT"
         vmstat 1  $RECORD_COUNT >> $VMSTAT

}

record_iostat()
{

    if [ -f "$IOSTAT" ] ; then
        rm "$IOSTAT"
    fi
    
         echo "    " >> "$PROC_VMSTAT"
         echo "*************************************************" >> $IOSTAT 
         date >> $IOSTAT
         echo "*************************************************" >> $IOSTAT
         echo "    " >> "$IOSTAT"
    
        iostat -x 1 $RECORD_COUNT >> $IOSTAT 
}


for i in $(seq 3);
do
        if [ $i -eq 1 ]; then
            record_proc_vmstat &
        elif [ $i -eq 2 ]; then
            record_vmstat &
        else
            record_iostat &
        fi
done

wait 

if [ -f "$LOADAVG" ] ; then
    rm "$LOADAVG"
fi

cat /proc/loadavg >> $LOADAVG



if [ -f "$LOGFILE" ] ; then
    rm "$LOGFILE"
fi


echo "    " >> "$LOGFILE"
echo "*************************************************" >> $LOGFILE
date >> $LOGFILE
echo "*************************************************" >> $LOGFILE
echo "    " >> "$LOGFILE"
echo "    " >> "$LOGFILE"

cat $LOADAVG >> $LOGFILE 

echo "    " >> "$LOGFILE"
echo "    " >> "$LOGFILE"
echo "    " >> "$LOGFILE"
echo "    " >> "$LOGFILE"

cat $VMSTAT >> $LOGFILE 

echo "    " >> "$LOGFILE"
echo "    " >> "$LOGFILE"
echo "    " >> "$LOGFILE"
echo "    " >> "$LOGFILE"


cat $IOSTAT >> $LOGFILE 

echo "    " >> "$LOGFILE"
echo "    " >> "$LOGFILE"
echo "    " >> "$LOGFILE"
echo "    " >> "$LOGFILE"


cat $PROC_VMSTAT >> $LOGFILE 


rm "$IOSTAT"
rm "$VMSTAT"
rm "$LOADAVG"
rm "$PROC_VMSTAT"



