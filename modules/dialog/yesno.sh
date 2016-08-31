module dialog

shift
shift
ret=$1
shift

$DIALOG --yesno "$1" 0 0
eval $ret="'$?'"

