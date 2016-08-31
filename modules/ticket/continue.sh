module ticket

shift
shift

if test -n "$1"
then
	t_issue=$1
else
	t_issue=$(cat $TMP/ticket.pause 2>/dev/null)
	if test -z "$t_issue"
	then
		run dialog input t_issue "Ticket number:"
	fi
fi

if test -z "$t_issue"
then
	run $UI info "Continue of ticket aborted."
	return
fi

currentTicket current
if test "$current" == "$t_issue"
then
	run $UI info "Ticket $t_issue already active."
	return
fi

if test -n "$current" -a "$current" != "$t_issue" && grep "$current" "$TMP/ticket.running" > /dev/null
then
	run ticket pause
fi

cat $TMP/ticket.running | grep $t_issue > /dev/null || echo $t_issue >> $TMP/ticket.running
echo $t_issue  > $TMP/ticket.current

run hamster start $t_issue
run $UI info "Ticket $t_issue is active now."

