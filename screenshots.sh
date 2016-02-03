#!/bin/bash
OUTDIR="/var/www/data/screenshots"
# make screenshots of web pages
/usr/bin/xvfb-run --server-args="-screen 0, 1024x768x24" cutycapt --url=http://www.iarc.uaf.edu/PFRR/data --out=$OUTDIR/supersite.png
/usr/bin/xvfb-run --server-args="-screen 0, 1024x768x24" cutycapt --url=http://www.iarc.uaf.edu/wrmet/data --out=$OUTDIR/wrmet.png
/usr/bin/xvfb-run --server-args="-screen 0, 1024x768x24" cutycapt --url=http://www.iarc.uaf.edu/research/projects/ngee/barrow/cameras --out=$OUTDIR/brw_cameras.png
/usr/bin/xvfb-run --server-args="-screen 0, 1024x768x24" cutycapt --url=http://www.iarc.uaf.edu/research/projects/ngee/barrow/data/a --out=$OUTDIR/brw_a.png
/usr/bin/xvfb-run --server-args="-screen 0, 1024x768x24" cutycapt --url=http://www.iarc.uaf.edu/research/projects/ngee/barrow/data/b --out=$OUTDIR/brw_b.png
/usr/bin/xvfb-run --server-args="-screen 0, 1024x768x24" cutycapt --url=http://www.iarc.uaf.edu/research/projects/ngee/barrow/data/c --out=$OUTDIR/brw_c.png
/usr/bin/xvfb-run --server-args="-screen 0, 1024x768x24" cutycapt --url=http://www.iarc.uaf.edu/research/projects/daisetsu/mtgoshiki/data --out=$OUTDIR/goshiki.png
#cutycapt --url=http://www.iarc.uaf.edu/research/projects/ngee/barrow/data/a --out=~/public_html/test/brw_a.png
convert $OUTDIR/supersite.png -crop 800x540+180+220 $OUTDIR/supersite_crop.png
convert $OUTDIR/wrmet.png -crop 800x600+180+250 $OUTDIR/wrmet_crop.png
convert $OUTDIR/brw_a.png -crop 800x540+180+250 $OUTDIR/brw_a_crop.png
convert $OUTDIR/brw_b.png -crop 800x540+180+250 $OUTDIR/brw_b_crop.png
convert $OUTDIR/brw_c.png -crop 800x540+180+250 $OUTDIR/brw_c_crop.png
convert $OUTDIR/brw_cameras.png -crop 800x600+180+250 $OUTDIR/brw_camera_1_crop.png
convert $OUTDIR/brw_cameras.png -crop 800x530+180+920 $OUTDIR/brw_camera_2_crop.png
convert $OUTDIR/goshiki.png -crop 800x520+180+240 $OUTDIR/goshiki_crop.png
