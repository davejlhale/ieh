

;gui1:=new gIcon("u.png",100,100,"test")

; Escape::
;     ExitApp
; return


;to use just #include this file
;then add code line
; myIcon := new gIcon("dir/file to image",x,y,"label to jumo to on left click")
;right click + hold allows movement of icon
class gIcon
{ 
    __new(aImage:="",aX:="",aY:="",aSub:="") {
        this.bMoveIcon := false
        this.startPointX:=aX
        this.startPointY:=aY 
        
        CoordMode, Mouse,Screen
        
        GUI, aIcon: +HWNDhIcon
        Gui, aIcon:Margin, 2, 2
        Gui, aIcon:+AlwaysOnTop -Caption +ToolWindow
        if IsLabel(aSub) 
            Gui, aIcon:Add, picture, g%aSub% w32 h32 , %aImage% 
        Else
            Gui, aIcon:Add, picture, w32 h32 , %aImage% 
        Gui, aIcon: Show,x%aX% y%aY% , NoActivate
        
        this.ahwnd := hIcon 
        
        this.movement:= objbindmethod(this,"move")
        this.timer:= objbindmethod(this,"watch")
        
        this.start() 
    }
    
    
    
     ;use as private
    start() {
        timer:= this.timer
        movement:=this.movement
        SetTimer, %timer%,50
        SetTimer, %movement%, 50 
    }
    
     ;use as private
    watch(){
        If this.IsWinUnderMouse(this.ahwnd) && GetKeyState("RButton") && !this.bMoveIcon {
            this.bMoveWin := true
            MouseGetPos, mx, my
            this.startPointX:=mx
            this.startPointY:=my
        } 
        
        if !GetKeyState("RButton") { 
            this.bMoveWin := false
            return
        }
    }

     ;use as private
    move(){ 
        hwnd:=this.ahwnd
        
        if(this.bMoveWin){
            MouseGetPos, mx, my
            deltaX := this.startPointX - mx
            deltaY := this.startPointY - my
            
            WinGetPos, currentX, currentY,,, ahk_id %hwnd%
            WinMove, ahk_id %hwnd%,, currentX - deltaX, currentY - deltaY 
            
            this.startPointX:=mx
            this.startPointY:=my 
        }
    }
    
    ;use as private
    IsWinUnderMouse(hwnd) { 
        MouseGetPos,,, hWinUnderMouse
        return (hwnd == hWinUnderMouse)
    }
    
}

test:
    msgbox clicked
return