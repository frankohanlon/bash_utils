#!/bin/bash

# dump output from the host command into variable ipstring
ipstring=$(host datapro.iarc.uaf.edu)

# space separate $ipstring and put into array temparray
temparray=(`echo $ipstring | tr ' ' '\n'`)

# pull out just the IP address and put it into a text file
echo ${temparray[3]} > /home/bob/working_files/bin/datapro_ip

# secure copy the ip to denali.iarc.uaf.edu
scp -C -P2222 -i /home/bob/.ssh/pfrr.id_rsa /home/bob/working_files/bin/datapro_ip pfrr@www3.iarc.uaf.edu:/home/pfrr/working_files/status/

# repeat the above but for denali.iarc.uaf.edu
ipstring=$(host www3.iarc.uaf.edu)
temparray=(`echo $ipstring | tr ' ' '\n'`)
echo ${temparray[3]} > /home/bob/working_files/bin/www3_ip
scp -C -P2222 -i /home/bob/.ssh/pfrr.id_rsa /home/bob/working_files/bin/www3_ip pfrr@www3.iarc.uaf.edu:/home/pfrr/working_files/status

