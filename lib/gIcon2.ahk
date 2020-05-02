

/* comment ot exapmle before include 


*/

gui1:=new gIcon("u",400,300,"test")
gui2:=new gIcon("d",450,300,"test2")

Escape::
    ExitApp
return

return

/*
*/



;eg.  gui1:=new gIcon("u",100,100,"test")
;to use just #include this file
;images saved as png. dont supply file extention in constructor paramater
;then add code line
; myIcon := new gIcon("dir/file path",x,y,"label/hotkey")
;right click + hold allows movement of icon
; icons are named with 'on' prefix for when 'click on'subroutine called
;uses gui.toggle() to force icon change
;use gui.stop() to end / lock right click moving

class gIcon
{ 
    __new(aImage:="",aX:="",aY:="",aSub:="") {
        this.bMoveIcon := false
        this.startPointX:=aX
        this.startPointY:=aY 
        this.isactive:=0
        
        CoordMode, Mouse,Screen
        
        GUI,  +HWNDhIcon
        Gui, Margin, 2, 2
        Gui, +AlwaysOnTop -Caption +ToolWindow
        
       
        
         this.Icon:=aImage
        
        if IsLabel(aSub) {
            Gui, Add, picture, w32 h32 g%aSub% , %aImage%.png
            
        }
        Else {
            Gui, Add, picture, w32 h32  ,  %aImage%.png
        }
        Gui,  Show,x%aX% y%aY% , NoActivate

       
       
        this.ahwnd := hIcon 
        
        this.movement:= objbindmethod(this,"move")
        this.timer:= objbindmethod(this,"watch")
        
        this.start()
        
    }
    toggle() { 
        if this.isactive ? this.turnOff() : this.turnOn()
            
        return
    }
    turnOff() {
        this.isactive:= 0
        tooltip, off
            img:= this.Icon
        GuiControl, ,%img%.png, %img%.png

        return
    }
    turnOn() {
        this.isactive:= 1
        tooltip, on
             img:=this.Icon
        GuiControl, ,%img%.png, on%img%.png
        return
    }
    
     stop() {
        timer:= this.timer
        movement:=this.movement
        SetTimer, %timer%, off
        SetTimer, %movement%, off 
    }
    
    
    
    ;use as private
    start() {
        timer:= this.timer
        movement:=this.movement
        SetTimer, %timer%, 50
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
    msgbox test hotkey subroutine down bottom of source triggered this
    gui1.toggle()
    ;gui1.Stop()
    ;gui1.start()
return