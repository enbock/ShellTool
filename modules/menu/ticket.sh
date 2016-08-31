#!/bin/bash

module menu
module ticket

currentTicket ticket

test -n "$ticket" && branch="$(echo $branch | grep -v $ticket)"

menus='s "Start task" x "Stop task"'

eval run $UI menu result \""$ticket\n\nSelect a action:"\" $menus 

case "$result" in
	"x")
		run tracking stop
	;;
	"s")
		run $UI input mt_task "Task:"
		run tracking start $mt_task
	;;
esac
