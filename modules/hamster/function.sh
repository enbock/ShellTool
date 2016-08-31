
function getNativeTicketTime()
{
	LANGUAGE=en hamster-cli list | grep "$1" | sed "s:^[^(]*(::" | sed "s:).*$::" | tail -n 1
}

function getTicketTime()
{
	getNativeTicketTime  | sed "s:min::" | sed "s:\([0-9]*\)h:\\1*60:"  | sed "s:^ *::" | sed "s: :+:" | bc | sed "s:$:m:"
}

function getTicketTimeForDisplay()
{
	getNativeTicketTime  | sed "s:min:m:"
}

export -f getTicketTime getNativeTicketTime getTicketTimeForDisplay
