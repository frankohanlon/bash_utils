#!/bin/bash
##2015-10-22 short script to start logging upload & download speeds from BEO.

xfer_file=100mbfile
#xfer_file=10mbfile

# push from fairbanks to barrow using secure copy
START=`date +%s%N`
CRONTIME=$(date +'"%G-%m-%d %H:%M:00",')
scp /var/www/data/extras/$xfer_file bob@barrow:/dev/null
END=`date +%s%N`
ELAPSED=`echo "scale=8; ($END - $START) / 1000000000" | bc`
size=$(stat -c%s /var/www/data/extras/$xfer_file)
speed=`echo "$size / $ELAPSED / 1024" | bc`
temp1=$CRONTIME$speed

echo $temp1 >> /home/bbusey/working_files/bin/logs/fai_to_controlshed.csv


# pull from barrow to fairbanks using secure copy
START=`date +%s%N`
CRONTIME=$(date +'"%G-%m-%d %H:%M:00",')
scp bob@barrow:/home/bob/extras/$xfer_file /dev/null
END=`date +%s%N`
ELAPSED=`echo "scale=8; ($END - $START) / 1000000000" | bc`
speed=`echo "$size / $ELAPSED / 1024" | bc`
temp1=$CRONTIME$speed
echo $temp1 >> /home/bbusey/working_files/bin/logs/controlshed_to_fai.csv




## this would be better run from barrow.
#START=`date +%s%N`
#CRONTIME=$(date +'"%G-%m-%d %H:%M:00",')
#curl http://ngeedata.iarc.uaf.edu/data/extras/100mbfile > /dev/null
#END=`date +%s%N`
#ELAPSED=`echo "scale=8; ($END - $START) / 1000000000" | bc`
#temp1=$CRONTIME$ELAPSED
#echo $temp1 >> /home/bbusey/working_files/bin/logs/controlshed_to_fai.csv




