shift
shift
return="$1"
shift
text="$1"
shift

run $UI main inputbox "$text" 0 0 "$@" 2> $TMP/dialog.input
eval $return="'$(cat $TMP/dialog.input)'"

