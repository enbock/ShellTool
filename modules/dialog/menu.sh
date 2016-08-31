shift
shift
return="$1"
shift

timeout=""
if test "$1" == "-t"
then
	timeout="--timeout $2"
	shift
	shift
fi

text="$1"
shift

h=""
output=1
if $DIALOG | grep "menu height" > /dev/null
then
	h="0 0 0"
	output=2
fi

eval run $UI main $timeout menu "\"$text\"" $h '"$@"' "$output>" $TMP/dialog.menu
eval $return="'$(cat $TMP/dialog.menu)'"

