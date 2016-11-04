#!/bin/bash
# should copy this into the ~/lib/bash_utils...
# when passing from command line:
# -d $ROOTDIR
# -n $ROOTNAME
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
        n)
            ROOTNAME=$OPTARG
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
            echo "    -n = root file name e.g. 'airtemp2m'"
            echo "    -s = Starting year e.g. '2000'"
            echo "    -e = Ending year e.g. '2005'"
            ;;
    esac
done 
grepper () {
    # function for pulling out a year of data for perusal in origin or whatever.
    # function is declared here and then should be called from further down in the bash script.
    # Variable convention is:
    ###  ROOTDIR="/home/bbusey/process_direct_downloads_bin/blueberry/outputs"
    ###  ROOTNAME="sw_out"
    
    ROOTDIR=$1
    ROOTNAME=$2
    YEAR=$3
    if [ ! -d "$ROOTDIR/years" ]; then
        mkdir $ROOTDIR/years
    fi
    if [ ! -d "$ROOTDIR/years/$ROOTNAME/" ]; then
        mkdir $ROOTDIR/years/$ROOTNAME
    fi
    OUTFILE=
    /usr/bin/head -n4 $ROOTDIR/$ROOTNAME.csv > $ROOTDIR/years/$ROOTNAME/$ROOTNAME"_"$YEAR.csv
    /bin/grep "$YEAR-" $ROOTDIR/$ROOTNAME.csv >> $ROOTDIR/years/$ROOTNAME/$ROOTNAME"_"$YEAR.csv

}

#ROOTDIR="/home/bbusey/process_direct_downloads_bin/blueberry/outputs"
#ROOTNAME="sw_out"


#for years in {$START..$END}
for ((years=$START; years <=$END; years++))
do
    grepper $ROOTDIR $ROOTNAME $years
done


