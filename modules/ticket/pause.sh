module ticket

issue=$(cat $TMP/ticket.current)

if test -z "$issue"
then
	return
fi

run hamster getTime $issue time
run hamster stop
#run $UI info "Ticket $issue paused after $time."
cat $TMP/ticket.current > $TMP/ticket.pause
echo > $TMP/ticket.current

