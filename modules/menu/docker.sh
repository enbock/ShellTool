#!/bin/bash

module menu

menus='a "Start Admin2" b "Stop Admin2"'

eval run $UI menu result \""Select a action:"\" $menus 

case "$result" in
	"a")
		run docker start admin2
	;;
	"b")
		run docker stop admin2
	;;
esac
