#!/bin/bash
# This removes all double-quotes from files in a directory.
# it greps whole directories rather than individual files.
# when passing from command line:
# -d $ROOTDIR


ROOTDIR=""
ROOTNAME=""

while getopts ":d:n:s:e:h" opt; do
    case $opt in
        d)
            ROOTDIR=$OPTARG
            ;;
        h)
            echo "If the file you'd like to separate out by year is for instance:"
            echo "    $HOME/data/site/output/airtemp2m.csv"
            echo "then the command line arguments to select are:"
            echo "    -d = root directory e.g. '$HOME/data/site/output' "
            echo "    -n = root file name e.g. 'airtemp2m'"
            echo "    -s = Starting year e.g. '2000'"
            echo "    -e = Ending year e.g. '2005'"
            ;;
    esac
done

# Loop through the csv files in the directory:
for f in $ROOTDIR/*.csv
do
  LEN=$(expr length $f)
  SUB=$(expr $LEN - 4)
  ROOTNAME=${f:0:$SUB}
  echo $f
  sed -i 's/\"//g' $f
  #python /var/site/lib/python_utils/6999filler.py --infile=$f
done

