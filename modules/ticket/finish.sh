module ticket

currentTicket ticket

test -z "$ticket" && return 1

#run hamster getTime $ticket
run hamster stop
#run $UI info "Ticket $ticket finished after $time."

echo > $TMP/ticket.current
mv $TMP/ticket.running $TMP/ticket.finish
cat $TMP/ticket.finish | grep -v "$ticket" > $TMP/ticket.running
