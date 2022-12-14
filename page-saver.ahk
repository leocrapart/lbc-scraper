
; next idea : 
; generate list of leboncoin url


savePage(url) {
	goToUrl(url)

	send ^s
	; click pathbar
	click 348, 49
	paste(path)
	; click filebar
	click 783, 759
	paste(filename)
	send {enter}
}

goToUrl(url) {
	; click urlbar
	click 580, 50
	paste(url)
	send {enter}
	sleep 5000
}



paste(text) {
  clipboard = %text%
  send ^v
  return
}

copy() {
	send ^c
	return
}

ESC::ExitApp