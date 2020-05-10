; eg. gui1:=new gIcon("u",100,100,"test")
; to use just #include this file
; images saved as png. dont supply file extention in constructor paramater
; then add code line
; myIcon := new gIcon("dir/file path",x,y,"label/hotkey")
; right click + hold allows movement of icon
; icons are named with 'on' prefix for when 'click on'subroutine called
; uses gui.toggle() to force icon change
; use gui.stop() to end / lock right click moving

class gIcon
{ 
    __new(aImage:="",aX:="",aY:="",aSub:="",pTooltipMsg:="Surprise") {
        CoordMode, Mouse,Screen
        global movingIcon:=false
        this.startPointX:=aX
        this.startPointY:=aY 
        this.isactive:= false
        this.Icon:=aImage
        
        this.movement:= objbindmethod(this,"move")
        this.timer:= objbindmethod(this,"watch")
        
        
        this.addTooltip(pTooltipMsg)
        
        GUI, %aImage%:+HWNDhIcon
        this.ahwnd := hIcon 
        Gui, %aImage%:Margin, 2, 2
        Gui, %aImage%:+AlwaysOnTop -Caption +ToolWindow
        
        if IsLabel(aSub) {
            Gui, %aImage%:Add, picture, w32 h32 g%aSub% , images/%aImage%.png 
        }
        Else {
            Gui, %aImage%:Add, picture, w32 h32 , images/%aImage%.png
        }
        Gui, %aImage%:Show,x%aX% y%aY% , NoActivate
        
        this.start() 
    }
    
    toggle() { 
        if this.isactive 
            this.turnOff() 
        Else
            this.turnOn() 
        return
    }
    
    
    
    turnOff() {
        this.isactive:= 0
        img:= this.Icon
        GuiControl, %img%:,%img%.png, images/%img%.png 
        return
    }
    
    turnOn() {
        this.isactive:= 1
        img:=this.Icon 
        GuiControl,%img%: ,%img%.png, images/on%img%.png
        return
    }
    
    ;locks right mouse icon movement
    stop() {
        timer:= this.timer
        movement:=this.movement
        SetTimer, %timer%, off
        SetTimer, %movement%, off 
        return
    }
    
    ;unlocks right mouse icon movement
    start() {
        timer:= this.timer
        movement:=this.movement
        SetTimer, %timer%, 50
        SetTimer, %movement%, 60 
        return
    }
    
    ;use as private
    watch(){
        global movingIcon
        ;if this icon moving but rb release
        if this.bMoveWin && !GetKeyState("RButton") { 
            movingIcon:=false
            this.bMoveWin := false 
            return
        }
        
        ;if no icon moving and this one right clicked
        If this.IsWinUnderMouse(this.ahwnd) && !movingIcon {
            this.showTooltip()
            if GetKeyState("RButton") {
                
                movingIcon:=true
                this.bMoveWin := true
                MouseGetPos, mx, my
                this.startPointX:=mx
                this.startPointY:=my 
            } 
        }
        return
    }
    
    ;use as private
    move(){ 
        if !(this.bMoveWin) 
            return
        
        hwnd:=this.ahwnd
        MouseGetPos, mx, my
        deltaX := this.startPointX - mx
        deltaY := this.startPointY - my
        
        WinGetPos, currentX, currentY,,, ahk_id %hwnd%
        WinMove, ahk_id %hwnd%,, currentX - deltaX, currentY - deltaY 
        
        this.startPointX:=mx
        this.startPointY:=my 
        return 
    }
    addTooltip(pMsg){
        this.toolTipMsg:=pMsg
        return
    }
    ;;shows hover tooltip
    showTooltip()
    {
        msg := this.toolTipMsg
        Tooltip %msg%
        settimer, removeTooltip,-50
        return
        removeTooltip:
            tooltip,
        return
    }
    ;use as private
    IsWinUnderMouse(hwnd) { 
        MouseGetPos,,, hWinUnderMouse
        return (hwnd == hWinUnderMouse)
    }
    
}
