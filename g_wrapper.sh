#!/bin/bash
# This is a wrapper for grepper.sh
# it greps whole directories rather than individual files.
# when passing from command line:
# -d $ROOTDIR
# -s $STARTYEAR
# -e $ENDYEAR


ROOTDIR=""
ROOTNAME=""
STARTYEAR=2000
ENDYEAR=2001

while getopts ":d:n:s:e:h" opt; do
    case $opt in
        d)
            ROOTDIR=$OPTARG
            ;;
        s)
            START=$OPTARG
            ;;
        e)
            END=$OPTARG
            ;;
        h)
            echo "If the file you'd like to separate out by year is for instance:"
            echo "    /home/bbusey/data/site/output/airtemp2m.csv"
            echo "then the command line arguments to select are:"
            echo "    -d = root directory e.g. '/home/bbusey/data/site/output' "
            echo "    -s = Starting year e.g. '2000'"
            echo "    -e = Ending year e.g. '2005'"
            ;;
    esac
done

# Loop through the csv files in the directory:
for f in $ROOTDIR/*.csv
do
  fname=$(python /var/site/lib/python_utils/pathsplit.py $f)  
  LEN=$(expr length $fname)
  SUB=$(expr $LEN - 4)
  ROOTNAME=${fname:0:$SUB}
  /var/site/lib/bash_utils/grepper.sh -d$ROOTDIR -n$ROOTNAME -s$START -e$END
done

