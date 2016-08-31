shift
shift
return="$1"
shift
text="$1"
shift

run $UI main checklist "$text" 0 0 0 "$@" 2> $TMP/dialog.select
eval $return="'$(cat $TMP/dialog.select)'"

