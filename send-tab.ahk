^t::
	sendTabs(50)

sendTabs(n) {
	loop %n% {
		send {enter}
		send {tab}
	}
}
