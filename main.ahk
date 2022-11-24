




; create excel file

FileDelete % "C:\Users\leocr\Desktop\lbc-scraper\scraped-data.xlsx"

xl := ComObjCreate("Excel.Application")
wb := xl.workbooks.add()
xl.range("a1:a1").value := "test5"
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



