#!/bin/bash

module dialog

shift
shift

timeout=""
if test "$1" == "--timeout"
then
	timeout="$1 $2"
	shift
	shift
fi

#echo "$DIALOG --$@"
$DIALOG $timeout --"$@"

