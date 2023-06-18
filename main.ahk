MsgBox, 0x40, Reminder before starting the macro, Set your password and focus your mouse pointer on the username field.
MsgBox, 0x40 , How to use, "Left Alt": Start/Resume`n"Left Ctrl": Stop

; CONFIGURATIONS
lt = 3 ; Usernames lenght

CoordMode, Pixel, Screen

s := (s := "_,.,0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z") "," s "," s

LAlt::
    Pause, Off
    Loop, 32 {
        Send, {BackSpace}
    }
    Loop, {
        Sort, s, Random D,
        i := SubStr(StrReplace(s, ","), 1, lt)
        
        Send, % i
        Sleep, 500
        Send, {Enter}
        Sleep, 2500

        ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, image.png
        If ErrorLevel {
            Loop, %lt% {
                Send, {BackSpace}
            }
        }
        Else {
            FileAppend,, available/%i%
            MsgBox, 0x40,, Image was found at...`nX: %FoundX%`nY: %FoundY%`nUsername: %i%`nPausing macro., 5
            Pause, On
        }
	Send, {Click}
    }
return

LCtrl::
    MsgBox, 0x30,, Macro stopped, 3
    ExitApp