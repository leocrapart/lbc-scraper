CoordMode, Mouse, Screen
; scrape data and put into the data array

; make script from the search with postal code
; click first page
; scrape page
; go back
; click second page
; scrape page
; store in excel file



; ; load page 
; ; select url
; click 1000, 50
; sleep 1000

; ; paste url
; paste("https://www.leboncoin.fr/ventes_immobilieres/2255713992.htm")
; sleep 500

; ; load page
; send {enter}
; sleep 5000

; pageData := scrapePage()

; ; store in excel

; data := []
; data.push(pageData)

; saveData(data)

^t::
	scrapePostalCode()


; plan : 
; find number of tabs for each posts
; make arr of it
; access by index
; scrape
; save to excel

; scrape  https://www.vigneron-independant.com
; search with nothing (https://www.vigneron-independant.com/search-vigneron?keywords=)
; moove 100, 400
; click 400, 400
; tabs find post
; scrape page

scrapePostalCode() {
	; code := "01000"
	; 10km
	data := []

	; tab 0 = 17 tabs
	; tab 18 20 22 24
	tabsToPage := [4
	, 6
	, 8
	, 10
	, 17]

	click 252, 640
	sleep 100
	sendTabs(tabsToPage[1])
	send {enter}
	sleep 5000
	pageData := scrapePage()
	data.push(pageData)
	click 20, 50
	sleep 3000

	click 252, 640
	sleep 100
	sendTabs(tabsToPage[2])
	send {enter}
	sleep 5000
	pageData := scrapePage()
	data.push(pageData)
	click 20, 50
	sleep 3000

	click 252, 640
	sleep 100
	sendTabs(tabsToPage[3])
	send {enter}
	sleep 5000
	pageData := scrapePage()
	data.push(pageData)
	click 20, 50
	sleep 3000

	click 252, 640
	sleep 100
	sendTabs(tabsToPage[4])
	send {enter}
	sleep 5000
	pageData := scrapePage()
	data.push(pageData)
	click 20, 50
	sleep 3000

	; pub 7
	; tab 31 33 35 37 39 
	; pub 2
	; 41 43 45
	; pub 3
	; 48 50 52 54 56
	; pub 3
	; 59 61 63
	; pub 7
	; 70 72 74 76 78 80
	; pub 8
	; 88 90 92 94 96 98 100 102 104

	saveData(data)

	; ventes immo
	; send code
	; click on search
	; click first page
	; scrape page
	; go back
	; click second page
	; scrape page
	; store in excel file

}

sendTabs(n) {
	loop %n% {
		send {tab}
		sleep 100
	}
}

scrapePage() {
	pageData := {}

	; voir le numéro
	click 1150, 500
	sleep 1000

	; annuler popup
	click 1045, 218
	sleep 1000

	; select number
	sleep 1000
	MouseClickDrag left, 1350, 500, 970, 500
	sleep 1000

	; store number
	send ^c
	sleep 100
	number := % Clipboard
	pageData.number := number
	sleep 1000

	; select url
	click 1000, 50
	sleep 1000

	; store url
	send ^c
	sleep 100
	url := % Clipboard
	pageData.url := url
	sleep 1000

	; select title ?
	MouseClickDrag left, 250, 600, 620, 720
	sleep 1000

	; store title
	send ^c
	sleep 100
	title := % Clipboard
	pageData.title := title
	sleep 1000

	; select company
	MouseClickDrag left, 1065, 280, 1310, 320
	sleep 1000

	; store company
	send ^c
	sleep 100
	company := % Clipboard
	pageData.company := company
	sleep 1000

	; select siret
	click 1150, 350
	sleep 100
	click 1150, 350
	sleep 1000
	
	; store siret
	send ^c
	sleep 100
	siret := % Clipboard
	pageData.siret := siret

	return pageData
}

saveData(data) {
	; data looks like =>
	; data := [{number: "0612457896", url: "https://www.leboncoin.fr/ventes_immobilieres/2258641246.htm", title: "maison", company: "SAFTI", siret: "52396432800026"}
	; , {number: "0612457896", url: "https://www.leboncoin.fr/ventes_immobilieres/2258641246.htm", title: "maison", company: "SAFTI", siret: "52396432800026"}]

	; create excel file
	; location, url, number

	FileDelete % "C:\Users\leocr\Desktop\lbc-scraper\scraped-data.xlsx"

	xl := ComObjCreate("Excel.Application")
	wb := xl.workbooks.add()

	;create titles
	xl.range("a1:a1").value := "number"
	xl.range("b1:b1").value := "url"
	xl.range("c1:c1").value := "title"
	xl.range("d1:d1").value := "company"
	xl.range("e1:e1").value := "siret"

	; insert data
	for index, element in data {
		rowNum := index + 1
		xl.range("a" rowNum ":a" rowNum).value := data[index]["number"]
		xl.range("b" rowNum ":b" rowNum).value := data[index]["url"]
		xl.range("c" rowNum ":c" rowNum).value := data[index]["title"]
		xl.range("d" rowNum ":d" rowNum).value := data[index]["company"]
		xl.range("e" rowNum ":e" rowNum).value := data[index]["siret"]
	}

	;save
	wb.saveas("C:\Users\leocr\Desktop\lbc-scraper\scraped-data.xlsx")
	xl.quit()
}


	



scrape() {
	; open browser 
	; go to leboncoin.fr
	; login
	; search for ventes immo in first location
	; click on first post
	; collect infos
	; put infos in data object
	; go back to posts list

	; click on second post
	; collect infos
	; put infos in data object
	; go back to posts list
	; ...

	; next page
	; collect
	; ...
	; search for ventes immo in second location


	; store scraped data in a big array
	data := [{location:"33400 Talence", number: "0612457896", url: "https://leboncoin.fr"}
	, {location:"14000 Caen", number: "0123456789", url: "https://leboncoin.fr"}
	, {location:"75000 Paris", number: "0", url: "https://leboncoin.fr"}]


	; create excel file
	; location, url, number

	FileDelete % "C:\Users\leocr\Desktop\lbc-scraper\scraped-data.xlsx"

	xl := ComObjCreate("Excel.Application")
	wb := xl.workbooks.add()

	;create titles
	xl.range("a1:a1").value := "location"
	xl.range("b1:b1").value := "url"
	xl.range("c1:c1").value := "number"

	; insert data
	for index, element in data {
		rowNum := index + 1
		xl.range("a" rowNum ":a" rowNum).value := data[index]["location"]
		xl.range("b" rowNum ":b" rowNum).value := data[index]["url"]
		xl.range("c" rowNum ":c" rowNum).value := data[index]["number"]
	}

	;save
	wb.saveas("C:\Users\leocr\Desktop\lbc-scraper\scraped-data.xlsx")
	xl.quit()

}

; convert strat to code
; scrape postal codes from the given excel file
; put in excel file



; check 25 "voir le numéro" on leboncoin and see if blocked.
; then empty the cookies and try again with same account.


; and scrape

; https://www.vigneron-independant.com
; https://paruvendu.fr
; https://seloger.com
; https://bienici.com
; https://pap.fr

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