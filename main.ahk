
; scrape data and put into the data array

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


; collect infos
; 	voir le numéro
; 1150, 500	
	click 1150, 500

; annuler popup	
; 1050, 220
	click 1050, 220

; select number
; start drag
; 1350, 500
	startDrag(1350, 500)

; end drag
; 970, 500
	endDrag(970, 500)
	copy()

; select url
; 1000, 50
; ctrl-c
	click 1000, 50
	copy()

; select title ?
; start drag
; 250, 600
	startDrag(250, 600)

; end drag
; 620, 720
	endDrag(620, 720)
	copy()

; select company
; start drag
; 1060, 270
	startDrag(1060, 270)

; end drag
; 1270, 310
	endDrag(1270, 310)
	copy()

; select siret
	doubleClick(1150, 350)
	copy()
}

copy() {
	send ^c
	return
}

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



