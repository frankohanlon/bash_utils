#!/bin/bash
GETIP="/home/bbusey/working_files/bin/csv_utilities/get_ip.py"
ROOT_DIR="/home/bbusey/remote_ips"


/usr/bin/python $GETIP --infile=$ROOT_DIR/grayling_ip.txt --outfile=$ROOT_DIR/barc
/usr/bin/python $GETIP --infile=$ROOT_DIR/trout_ip.txt --outfile=$ROOT_DIR/controlshed
/usr/bin/python $GETIP --infile=$ROOT_DIR/ralph_ip.txt --outfile=$ROOT_DIR/ralph


