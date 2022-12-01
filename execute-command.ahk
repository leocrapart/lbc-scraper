CoordMode, Mouse, Screen
; run "cmd.exe"
; click 400, 200

; ; go to root folder
; send % "cd .."
; send {enter}
; send % "cd .."
; send {enter}
; send % "cd .."
; send {enter}
; send % "cd .."
; send {enter}
; send % "cd .."
; send {enter}
; send % "cd .."
; send {enter}

; select number and show clipboard
click 100, 300
sleep 1000
MouseClickDrag left, 1350, 500, 970, 500
sleep 1000
send ^c
sleep 500

number := % Clipboard
msgbox % number




