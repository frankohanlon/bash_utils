!#/bin/bash
#
# This utility is to be used after manual data QA in excel.
# It replaces the triple double quotes that Excel puts in for the date
# with single double quotes.
# pre step... to properly get ISO time format date strings in excel:
#
# 1) Select the dates in Column A
# 2) Type "<CTRL> + <1>" to bring up the "Format Cells" window
# 3) on the "Number" tab, in the "Category" "Custom" set the "Type" to:
###  \"yyy-mm-dd hh:mm:ss\"
# when you view this resulting csv in a text editor the date column will be filled with dates that look like:
# """2015-10-31 23:00:00"""
# this utility changes that to:
# "2015-10-31 23:00:00"



ROOT_DIR_A=/home/bbusey/working_files/barrow/intense_A/
ROOT_DIR_B=/home/bbusey/working_files/barrow/intense_B/
ROOT_DIR_C=/home/bbusey/working_files/barrow/intense_C/
ROOT_DIR_D=/home/bbusey/working_files/barrow/intense_D/

grep -rl '"""' $ROOT_DIR_A/staging | xargs sed -i 's/"""/"/g'
#grep -rl '"""' $ROOT_DIR_B/staging | xargs sed -i 's/"""/"/g'
#grep -rl '"""' $ROOT_DIR_C/staging | xargs sed -i 's/"""/"/g'
#grep -rl '"""' $ROOT_DIR_D/staging | xargs sed -i 's/"""/"/g'

mv  $ROOT_DIR_A/staging/*.csv  $ROOT_DIR_A/outputs/
mv  $ROOT_DIR_B/staging/*.csv  $ROOT_DIR_B/outputs/
mv  $ROOT_DIR_C/staging/*.csv  $ROOT_DIR_C/outputs/
mv  $ROOT_DIR_D/staging/*.csv  $ROOT_DIR_D/outputs/

