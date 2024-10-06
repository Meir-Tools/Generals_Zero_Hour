; This entire line is a comment.
; dash | %USERPROFILE%\AppData\Local\Programs\AutoHotkey\UX\AutoHotkeyUX.exe "ui-dash.ahk"
; WindowSpy | %USERPROFILE%\AppData\Local\Programs\AutoHotkey\UX\AutoHotkeyUX.exe "WindowSpy.ahk"
; https://www.autohotkey.com/docs/v2/lib/WinMove.htm
; WinMove X, Y, Width, Height, WinTitle, WinText, ExcludeTitle, ExcludeText
; 
; https://www.autohotkey.com/boards/viewtopic.php?t=119814
#Requires AutoHotkey v2 
MyWinTitle := "Command & Conquer (TM) Generals Zero Hour"
if WinExist(MyWinTitle)
{
	WinGetPos &Xpos, &Ypos , &Wpos, &Hpos , "A" ; Use the window found by WinExist. | https://www.autohotkey.com/docs/v1/lib/WinGetPos.htm
    MsgBox "MyWinTitle is at " Xpos " , " Ypos " , " Wpos " , " Hpos
	WinActivate ; Use the window found by WinExist.
	; WinMove 100, 100, 1600 , 1024, MyWinTitle
	; multiplier button = 1200 300
	; Enter server from main menu
	; Enter_server_from_main_menu()

	create_game_from_main_menu()

	clash_4_x_4()



}
MyWinTitle := "Command Prompt"
;if WinExist(MyWinTitle)
;	WinMove 100, 100, 100, 512, MyWinTitle
;MyWinTitle := "смотреть онлайн" 
;if WinExist(MyWinTitle)
;	WinMove 1345 , 18 , 1192 , 672, MyWinTitle
;MyWinTitle := "YouTube"
;if WinExist(MyWinTitle)
;	WinMove 1353 , 789 , 1201 , 596, MyWinTitle
;MyWinTitle := "ישראל נלחמת"
;if WinExist(MyWinTitle)
;	WinMove 1659 , 699 , 886 , 660, MyWinTitle
;else
;	Run, chrome.exe "https://www.youtube.com/watch?v=JpS383vI1_I" " --new-window "
;{
;	
; 	
;}


; AHK | Error: Target window not found.
; AHK | ahk see if WinTitle exist | WinExist(WinTitle, WinText, ExcludeTitle, ExcludeText)
; AHK | open web page
; Run, chrome.exe "https://www.youtube.com/watch?v=JpS383vI1_I" " --new-window "

; ==== Functions ====
Enter_server_from_main_menu()
{
	MouseMove 1200, 300, 50 
	Click 
	sleep 2000 ;(wait 2 seconds) 
	Click 
}
create_game_from_main_menu()
{
	my_click_on(1200,300)
	sleep 2000 ;(wait 2.0 seconds) 
	my_click_on(1200,300)
	my_click_on(350,920) 
} 
clash_4_x_4()
{
	; Select second as Hard Army
	; set_line_as_hard_army(2)
	; Select 3rd as Hard Army
	set_line_as_hard_army(3)
	; Select 4th as Hard Army
	set_line_as_hard_army(4)
	; Select 5th as Hard Army
	set_line_as_hard_army(5)
	; Select 6th as Hard Army
	set_line_as_hard_army(6)
	; Select 7th as Hard Army
	; set_line_as_hard_army(7)
	; Select 8th as Hard Army
	; set_line_as_hard_army(8)
	set_line_as_group1(1)
	; set_line_as_group1(2)
	set_line_as_group2(3)
	set_line_as_group2(4)
	set_line_as_group2(5)
	set_line_as_group2(6)
	; set_line_as_group2(7)
	; set_line_as_group2(8)
}
my_click_on(mX,mY)
{
	; MouseMove, mX, mY, 50 ; slow oftion
	; MouseMove, mX, mY, 5 ; fater option
	; MouseMove mX, mY, 50 ; fater option
	SendMode("Event")
	MouseMove(mX, mY, 5)
	Click
	sleep 400 ;(wait 0.4 seconds) 
}
set_line_as_hard_army(line_num)
{
	mX := 350
	mY := 230 + (line_num-1) * 40
	my_click_on(mX,mY)
	my_click_on(mX,mY + 150)
}
set_line_as_group1(line_num)
{
	mX := 1020
	mY := 230 + (line_num-1) * 40
	my_click_on(mX,mY)
	my_click_on(mX,mY + 60)
}
set_line_as_group2(line_num)
{
	mX := 1020
	mY := 230 + (line_num-1) * 40
	my_click_on(mX,mY)
	my_click_on(mX,mY + 90)
}
Esc::ExitApp  ; Pres Esc to get here

;Esc::  ; Pres Esc to get here
;	Suspend
;	ExitApp 
;	;Pause,, 1 ; for v1
;Return