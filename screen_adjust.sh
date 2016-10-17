#!/bin/bash
#create startup file -> /home/$USER/.config/autostart/screen_adjust.desktop

#Give your session some time to start all the regular stuff
sleep 6

#Function that first checks if your extra screen is connected, ifso adjusts it
adjustConnectedScreen () {
	
	local screen1=$1

	#Determine if extra screen is connected
	screenCheck=`xrandr | grep $screen1 | grep -v disconnected | awk '{print $2}'`

	#if check is positive -> screen will be adjusted to requested output mode
	if [[ $screenCheck == connected ]]
	then
		#Main laptop screen needs to be adjusted as well
		xrandr --output LVDS1 --mode 1366x768 --rate 60.00 --primary --left-of HDMI1
		#The extra screen adjustments (based on your screen specs, this might has to be changed)
		xrandr --output HDMI1 --mode 1920x1080 --rate 100.00 --noprimary --right-of LVDS1
	else
		#If the screen is not connected, script can be terminated
		exit 1
	fi
}


#Function to check if awesome window manager is running
#If its running, kill and start awesome window manager again 
#This is needed, otherwise the awesome taskbar will not adjust to the new resolution
restartAwesomeWM () {

	if pgrep "awesome" > /dev/null
	then
		pkill -9 awesome
		sleep 1
		exec awesome > /dev/null  & 
	else
		exit 1
	fi
}

#Main
adjustConnectedScreen HDMI1
restartAwesomeWM

exit 0
