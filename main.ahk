MsgBox, 0x40, Reminder before starting the macro, Set your password and focus your mouse pointer on the username field.
MsgBox, 0x40 , How to use, "Left Alt": Start`n"Left Ctrl": Stop

LAlt::
    Loop, 32 {
        Send, {BackSpace}
    }
    Loop, {
        s := (s := "_,.,0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z") "," s "," s
        Sort, s, Random D,
        i := SubStr(StrReplace(s, ","), 1, 3) ; <- "You can change the '3' value and -
        Send, % i                             ;  replace it with another number for longer/shorter usernames".
        Sleep, 500
        Send, {Enter}
        Sleep, 2500
        Loop, 3 {
            Send, {BackSpace}
        }
    }
return

LCtrl::
    MsgBox, 0x30, This window will close in 3 seconds., Macro stopped, 3
    ExitApp