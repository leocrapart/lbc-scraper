
; scrape data and put into the data array


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



