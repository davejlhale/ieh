clickScrollBar(x, y ,t:=50) {
    if(GetKeyState("left"))
        return
    loop, 4 {
        PostMessage, 0x200, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_MOUSEMOVE
        PostMessage, 0x201, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_LBUTTONDOWN 
        PostMessage, 0x202, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_LBUTTONUP 
        UnblockMovement() 
        Sleep, %t%
    }
}

down4() {
    if(GetKeyState("left"))
        return
    sleep, 50
    loop, 4 {
        Send {WheelDown}
        sleep, 50
    }
    sleep, 50
}

down3() {
    if(GetKeyState("left"))
        return
    sleep, 150
    loop, 3 {
        Send {WheelDown}
        sleep, 50
    }
    sleep, 150
}

heavyClick(x:=0,y:=0,t:=200) {
    PostMessage, 0x200, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_MOUSEMOVE
    PostMessage, 0x201, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_LBUTTONDOWN 
    PostMessage, 0x202, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_LBUTTONUP 
    Sleep, %t%
    UnblockMovement() 
}

MCSHR(x, y, t) {
    if(GetKeyState("left"))
        return
    ; WM_RBUTTONDOWN := 0x204
    ; WM_RBUTTONUP := 0x205
    PostMessage, 0x200, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_MOUSEMOVE
    PostMessage, 0x204, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% 
    PostMessage, 0x205, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% 
    Sleep, %t%
    UnblockMovement() 
}

MCSH(x:=0, y:=0, t:=0) {
    if(GetKeyState("left"))
        return
    PostMessage, 0x200, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_MOUSEMOVE
    PostMessage, 0x201, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_LBUTTONDOWN 
    PostMessage, 0x202, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_LBUTTONUP 
    UnblockMovement() 
    Sleep, %t%
}
MCSD(x:=0, y:=0, t:=0) {
    if(GetKeyState("left"))
        return
    loop 3 {
        PostMessage, 0x200, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_MOUSEMOVE
        PostMessage, 0x201, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_LBUTTONDOWN 
        PostMessage, 0x202, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_LBUTTONUP 
    }
    Sleep, %t%
    UnblockMovement() 
}

MS(x:=0, y:=0, t:=0) {
    if(GetKeyState("left"))
        return
    PostMessage, 0x200, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_MOUSEMOVE
    Sleep, %t%
    UnblockMovement() 
}

MCS(x:=0, y:=0, t:=0) {
    if(GetKeyState("left"))
        return
    PostMessage, 0x200, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_MOUSEMOVE
    PostMessage, 0x201, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_LBUTTONDOWN 
    PostMessage, 0x202, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_LBUTTONUP 
    Sleep, %t%
    UnblockMovement() 
}

openNotepad(msg:="") {
    if WinExist("Notepad")
        Winactivate, Notepad
    else {
        Run, notepad++.exe
        WinWait, Notepad, , 3
        if ErrorLevel
        {
            Run, notepad++.exe
            WinWait, Notepad, , 3
            if ErrorLevel
            {
                MsgBox, WinWait timed out.
                return
            }
        }
    }
    return true
}
waitMultipleForColorNotVisibleQuick(x, y, color) {
    while(!GetKeyState("left")) {
        colorIsVisibleQuick(x, y, color)
        waitForColorNotVisibleQuick(x, y, color)
        
    }
}

waitForColorVisibleQuick(x, y, color) {
    x2 := x+15
    y2 := y+15
    waitForColorVisible(x, y, x2, y2, color)
}

waitForColorVisible(x, y, x2, y2, theColor) {
    ;safeSpot() ;If game tooltips interrupt you
    z := 0
    while (!GetKeyState("left")) {
        CoordMode,pixel,client 
        PixelSearch, Px, Py, %x%, %y%, %x2%, %y2%, %theColor%, 3, Fast
        if ErrorLevel {
            sleep, 10
            z++ ;How long you've waited
            ;Tooltip, %z%
        }
        else {
            return
        }
    }
    Tooltip
}

waitForColorNotVisibleQuick(x, y, color) {
    x2 := x+15
    y2 := y+15
    waitForColorNotVisible(x, y, x2, y2, color)
}

waitForColorNotVisible(x, y, x2, y2, color) {
    ;safeSpot()
    z := 0
    while(!GetKeyState("left")) {
        CoordMode, pixel,client 
        PixelSearch, Px, Py, %x%, %y%, %x2%, %y2%, %color%, 3, Fast
        if ErrorLevel {
            return 1
        }
        else {
            sleep, 10
            z++ ;How long you've waited
            ;Tooltip, %z%
        }
    }
}

colorIsVisibleQuick(x, y, color) {
    x2 := x+15
    y2 := y+15 
    return colorIsVisible(x, y, x2, y2, color)
}

; isColorVisible
colorIsVisible(x, y, x2, y2, color) {
    CoordMode, pixel,client 
    PixelSearch, Px, Py, %x%, %y%, %x2%, %y2%, %color%, 8, Fast
    if ErrorLevel {
        return 0
    }
    else {
        return 1
    }
}

colorIsNotVisibleQuick(x, y, color) {
    x2 := x+15
    y2 := y+15 
    return colorIsNotVisible(x, y, x2, y2, color)
}

colorIsNotVisible(x, y, x2, y2, color) {
    CoordMode, pixel,client 
    PixelSearch, Px, Py, %x%, %y%, %x2%, %y2%, %color%, 3, Fast
    if ErrorLevel {
        return 1
    }
    else {
        return 0
    }
}

clickUntilColorVisible(x1, y1, x2, y2, color) {
    while(!colorIsVisibleQuick(x2, y2, color)) {
        PostMessage, 0x200, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_MOUSEMOVE
        PostMessage, 0x201, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_LBUTTONDOWN 
        PostMessage, 0x202, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_LBUTTONUP 
        Sleep, 50
        UnblockMovement() 
    }
}

clickOn2(vCP,vCol){
    if ! isObject(vCP) {
        aClickPoint :=%vCP%.clone()
        TraceLog("clickon clone " . vCP.name)
        if ! isObject(vCP) && vCP.class!="ClickPoint" {
            TraceLog("failed cloning" . %vCP%)
            return
        }
    }
    x1:=vCP.x - 5
    x2:=vCP.x + 5
    y1:=vCP.y - 5
    y2:=vCP.y + 5
    return clickOn(x1,x2,y1,y2,vCol)
}

clickOn(x, y, x2, y2, theColor) {
    global vHwnd
    WinActivate, ahk_id %vHwnd%
    
    PixelSearch, Px, Py, %x%, %y%, %x2%, %y2%, %theColor%, 5, Fast
    if ErrorLevel {
        
        return false
    }
    
    x:= Px + 1
    y:= Py + 1
    MouseGetPos, ,,_hwnd
    if (vHwnd == _hwnd) {
        MouseClick, Right , x,y ,2,0
    } else {
        PostMessage, 0x200, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_MOUSEMOVE
        PostMessage, 0x201, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_LBUTTONDOWN 
        PostMessage, 0x202, 0, x&0xFFFF | y<<16,, ahk_id %vHwnd% ; WM_LBUTTONUP 
    }
    return true
}

safeSpot() {
    if(GetKeyState("left"))
        return 
    gClick(GB_ScanPoint,1,100)
    UnblockMovement() 
}