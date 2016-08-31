shift
mode=$1
shift
ret=$1
shift

run $UI main $mode "$@" 0 200 2> $TMP/fdselect.input

eval $ret="'$(cat $TMP/fdselect.input)'"

