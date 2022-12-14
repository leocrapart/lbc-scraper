
; next idea : 
; generate list of leboncoin url

^t::main()
^i::savePage("C:\Users\leocr\Desktop\lbc-scraper", "05000.html")

main() {
	; start at leboncoin.fr loaded fully
	goToUrl("leboncoin.fr")
	sleep 20000
	searchImmo("05000")
	savePage("C:\Users\leocr\Desktop\lbc-scraper", "05000.html")
	showFinished()
}

searchImmo(postalCode) {
	;click searchbar
	click 649, 597
	sleep 700

	paste("ventes immobilières")
	sleep 700

	;click "vente immo dans ventes immo" 
	click 708, 708
	sleep 700

	;delete last location
	click 1147, 593
	sleep 700


	;click locationbar
	click 974, 599
	sleep 700

	paste(postalCode)
	sleep 700

	; click "Toutes les communes {postalCode}"
	click 974, 645
	sleep 700


	; drag to 10km zone
	MouseClickDrag left, 901, 760, 992, 760
	sleep 700

	; scroll
	MouseMove 1297, 689
	sleep 5000

	; validate
	click 1150, 820
	sleep 500


	;search
	click 800, 583
	sleep 8000

}



savePage(path, filename) {
	send ^s
	sleep 600

	; click pathbar
	click 348, 49
	sleep 600

	paste(path)
	sleep 600

	send {enter}
	sleep 600

	; click filebar
	click 783, 759
	sleep 600

	paste(filename)
	sleep 600

	send {enter}
	sleep 600

}

goToUrl(url) {
	; click urlbar
	click 580, 50
	paste(url)
	send {enter}
	sleep 5000
}

showFinished() {
	MouseMove 62, 112
}


paste(text) {
  clipboard = %text%
  sleep 500
  send ^v
  sleep 500
  return
}

copy() {
	send ^c
	return
}

ESC::ExitApp