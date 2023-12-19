; Settings [Don't Modify]
#Persistent
#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

; Read Username And URL From Config.ini File

IniRead, Username, config.ini, Settings, Username
IniRead, URL, config.ini, Settings, URL

; Code For Automation [Don't Modify Anything, Just Modify The Sleep Time Based On Your Internet Speed And How Fast It Loads Things]

SetTitleMatchMode, 2
ImageFile := "image.png"
Run, %URL%
Sleep, 5000
if WinExist("Just a moment...") {
    Sleep, 3000
    Click, 303, 363
    Sleep, 5000
}
Click, 950, 476
Sleep, 500
Send, ^a
Send, %Username%
Sleep, 500
Click, 966, 533
Loop {
    ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %ImageFile%
    if (ErrorLevel = 0) {
        Send, ^w
        ExitApp
        break
    }
    Sleep, 1000
}
