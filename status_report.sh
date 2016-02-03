#!/bin/bash
GLOM=/home/bbusey/lib/python_utils/glom_together.py

rootdir="/home/bbusey/working_files/global_status/config"
python $GLOM $rootdir/brw_rh_glom.txt
python $GLOM $rootdir/brw_ws_glom.txt
python $GLOM $rootdir/brw_sw_out_glom.txt
python $GLOM $rootdir/brw_sw_in_glom.txt
python $GLOM $rootdir/brw_rain_glom.txt
python $GLOM $rootdir/brw_lw_in_glom.txt
python $GLOM $rootdir/brw_lw_out_glom.txt
python $GLOM $rootdir/brw_at_glom.txt
python $GLOM $rootdir/brw_dp_glom.txt
python $GLOM $rootdir/brw_heatflux_glom.txt

