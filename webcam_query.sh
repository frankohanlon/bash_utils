#!/bin/bash

## Pan Range:  -180 to +180
## Tilt Range: -20 to +200
## Zoom Range: 1 - 9999

wget --no-check-certificate -O /dev/null https://junk:pocket@axis-00408cb14f01.iarc.uaf.edu/axis-cgi/com/ptz.cgi?pan=-100&tilt=10&zoom=1 
sleep 5
wget --no-check-certificate -r -O /home/bob/working_files/barrow/webcam1/images/view1.jpg https://junk:pocket@axis-00408cb14f01.iarc.uaf.edu/jpg/image.jpg
wget --no-check-certificate -O /dev/null https://junk:pocket@axis-00408cb14f01.iarc.uaf.edu/axis-cgi/com/ptz.cgi?pan=-120&tilt=10&zoom=01 
sleep 5
wget --no-check-certificate -r -O /home/bob/working_files/barrow/webcam1/images/view2.jpg https://junk:pocket@axis-00408cb14f01.iarc.uaf.edu/jpg/image.jpg
wget --no-check-certificate -O /dev/null https://junk:pocket@axis-00408cb14f01.iarc.uaf.edu/axis-cgi/com/ptz.cgi?pan=100&tilt=10&zoom=35 
sleep 5
wget --no-check-certificate -r -O /home/bob/working_files/barrow/webcam1/images/view3.jpg https://junk:pocket@axis-00408cb14f01.iarc.uaf.edu/jpg/image.jpg

