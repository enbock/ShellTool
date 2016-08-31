
module dialog

shift
shift

echo "$@" > $TMP/exec
. $TMP/exec 2>&1 | tee $TMP/dialog.exec | $DIALOG --progressbox 1000 1000
returnCode=${PIPESTATUS[0]}

$DIALOG --textbox $TMP/dialog.exec 0 0

return $returnCode
