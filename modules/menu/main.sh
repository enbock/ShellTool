#!/bin/bash

module menu
module ticket
#module git
#module hamster

#currentTicket ticket

#if test -z "$ticket"
#then
#	ticket="N/A"
#else
#	time="("$(getTicketTimeForDisplay $ticket)")"
#fi

menuLabel="Main Menu";
#Ticket: $ticket $time
#";
# Lines : $(getTouchedLines)

run $UI menu result -t 10 "$menuLabel" \
	refresh "Refresh screen" \
	shell "Command line" \
	phpstorm "Start PHPStrom" \
	lsto "Lock and turn of screen" \
	dev "Shell Tool develop" \
	tunnel "Restart tunnel" \
	hotspot "Start hotspot" \
	hotstop "Stop hotspot" \
	docker "Docker" \
	halt "Shutdown the computer" \
	exit "Beenden"

case "$result" in
	"shell")
		run shell bash
	;;
	"ticket")
		run menu ticket
	;;
	"git")
		run menu git
	;;
	"make")
		run makefile build
	;;
	"scs")
		rm ~/.vlock 2>/dev/null
		gnome-screensaver-command --lock
	;;
	"ls")
		run ticket finish
		run tracking start "Pause"
		ml
		run tracking stop
	;;
	"lsto")
		run tunnel stop
		run ticket finish
		ml 1
		run tracking stop
	;;
	"dev")
		run dev edit
	;;
	"xdebug")
		run menu xdebug
	;;
	"exit")
		exit
	;;
	"vagrant")
		run menu vagrant
	;;
	"deploy")
		run menu vagrant_deploy
	;;
	"hibernate")
		sudo pm-hibernate
	;;
	"halt")
		sudo halt
	;;
	"us")
		clear
		unitSrv
	;;
	"tunnel")
		#run dialog exec sudo bash -c '"service openvpn restart && sleep 5 && route add -host 172.21.12.151 gw 172.16.2.1"'
		run tunnel restart
	;;
	"hotspot")
		run dialog exec hotspotStart
	;;
	"hotstop")
		run dialog exec sudo /etc/init.d/hotspotd stop
	;;
	"resetupVBox")
		run dialog exec sudo /etc/init.d/vboxdrv setup
	;;
	"phpstorm")
		nohup phpstorm > /dev/null 2>&1 &
	;;
	"monitor")
		google-chrome --app=https://home24gmbh.geckoboard.com/dashboards/600443A71FAD8D48
	;;
	"docker")
		run menu docker
	;;
esac

exec $PRG/shellTool
