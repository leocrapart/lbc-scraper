
; next idea : 
; generate list of leboncoin url

main()

main() {
	searchImmo("04000")
	savePage("C:\Users\leocr\Desktop\lbc-scraper", "04000.html")
}

searchImmo(postalCode) {
	;click searchbar
	click 649, 358
	sleep 300

	paste("ventes immobilières")
	sleep 300

	;click "vente immo dans ventes immo" 
	click 707, 477
	sleep 300


	; delete last location
	click 1143, 354
	sleep 300


	;click locationbar
	click 1143, 354
	sleep 300

	paste(postalCode)
	sleep 300

	; click "Toutes les communes {postalCode}"
	click 1020, 403
	sleep 300


	; drag to 10km zone
	MouseClickDrag left, 900, 517, 990, 519
	sleep 300


	; validate
	click 1160, 678
	sleep 300


	;search
	click 830, 450
	sleep 300

}


savePage(path, filename) {
	send ^s
	sleep 300
	
	; click pathbar
	click 348, 49
	sleep 300
	
	paste(path)
	sleep 300
	
	; click filebar
	click 783, 759
	sleep 300
	
	paste(filename)
	sleep 300
	
	send {enter}
	sleep 300
	
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