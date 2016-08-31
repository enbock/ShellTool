module dialog

shift
shift

cp $1 $TMP/dialog.fileEdit
if $DIALOG --editbox $TMP/dialog.fileEdit 0 0 2> $TMP/dialog.fileEdit.new
then
	mv $TMP/dialog.fileEdit.new $1
fi

