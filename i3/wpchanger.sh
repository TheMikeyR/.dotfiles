#! /bin/bash
# WALLPAPERS="/home/mikeyr/Pictures/wallpapers/taylor"
# ALIST=( `ls -w1 $WALLPAPERS` )
# RANGE=${#ALIST[@]}

# while [ : ]
# do 
# 	let "number = $RANDOM"
# 	let LASTNUM="`cat $WALLPAPERS/.last` + $number"
# 	let "number = $LASTNUM % $RANGE"
# 	echo $number > $WALLPAPERS/.last
# 	nitrogen --set-zoom --save $WALLPAPERS/${ALIST[$number]}
# 	sleep 10m
# done

# while [ : ]
# do
# 	let "number = $RANDOM"
# 	let LASTNUM="`cat $WALLPAPERS/.last` + $number"
# 	let "number = $LASTNUM % $RANGE"
# 	echo $number > $WALLPAPERS/.last 
# 	sed -i '7 c\file='$WALLPAPERS/${ALIST[$number]}'' /home/user/.config/nitrogen/bg-saved.cfg
# 	let "number = $RANDOM"
# 	let LASTNUM="`cat $WALLPAPERS/.last` + $number"
# 	let "number = $LASTNUM % $RANGE"
# 	echo $number > $WALLPAPERS/.last 
# 	sed -i '12 c\file='$WALLPAPERS/${ALIST[$number]}'' /home/user/.config/nitrogen/bg-saved.cfg
# 	nitrogen --restore
# 	sleep 10m
# done

CONFIG="$HOME/.config/nitrogen/bg-saved.cfg" # Replace this with whatever the nitrogen config file is.
WALLPAPERDIR="/home/mikeyr/Pictures/wallpapers/taylorSwift"

function setwallpaper {
    # Modify the nitrogen configuration file (default location set in $CONFIG).
    # $1: Line to modify
    # TODO: Modify it so that rather than use a line to modify this, we just use the screen name.
    # Other potential features: allow you to use different modes rather than centre-and-zoom.
    WALLPAPER=`find $WALLPAPERDIR -type f | grep -E "jpeg|jpg|png" | shuf -n1`
    echo "$(date -u) -- Setting line $1 to $WALLPAPER."
    sed -i "$1 c\file=$WALLPAPER" $CONFIG
}

while [ : ]
do
	setwallpaper 2   # screen 1, defined in line #2
	setwallpaper 7  # screen 2, defined in line #7
	setwallpaper 12 # screen main (if no monitor connected)
	# Refresh Nitrogen with new wallpaper.
	nitrogen --restore
	sleep 10m
done

