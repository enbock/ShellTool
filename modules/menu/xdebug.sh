#!/bin/bash

module menu
module xdebug

run $UI menu result "xDebug" "e" "Enable" "d" "Disable"

case "$result" in
  "e")
		xenable
	;;
	"d")
		xdisable
	;;
esac

