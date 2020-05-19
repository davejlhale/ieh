
;;finds the x1x2y1y2 coords of kongs default game container
findKongGameContainer(){
    Critical on
    global vWinTitle
    global vHwnd
    global vGameContainerX1:=0, vGameContainerY1:=0, vGameContainerX2:=0, vGameContainerY2:=0
    global vGameContainerWidth:=0,vGameContainerHeight:=0
    
    WinGet, id, ,%vWinTitle%
    global vHwnd :=id
    WinActivate, ahk_id %vHwnd%
   
    WinGetPos, xZero, yZero, winWidth, winHeight, A
    mid:=winHeight*0.5
    
    ;find the left game border
    PixelSearch, abegin_x, temp, 0, %mid%, %winWidth%, %mid%, 0xB5B5B5, 3, Fast
    if ErrorLevel 
        return ErrorLevel
    ;move to top left
    PixelSearch, abegin_x, abegin_y, %abegin_x%, %mid%, %abegin_x%, 0, 0x000000, 0, Fast
    if ErrorLevel 
        return ErrorLevel
    abegin_y:=abegin_y+1 ;step back onto border
    ;check the pixel is the border corner
    PixelSearch, abegin_x, abegin_y, %abegin_x%, %abegin_y%, %abegin_x%, %abegin_y%, 0xB5B5B5, 10, Fast
    if ErrorLevel 
        return ErrorLevel
    ;move to top right
    PixelSearch, aend_x, abegin_y, %abegin_x%, %abegin_y%, %winWidth%, abegin_y, 0x000000, 0, Fast
    if ErrorLevel 
        return ErrorLevel
    aend_x:=aend_x-1 ;step back onto border
    ;check the pixel is the border corner
    PixelSearch, aend_x, abegin_y, %aend_x%, %abegin_y%, %aend_x%, %abegin_y%, 0xB5B5B5, 10, Fast
    if ErrorLevel 
        return ErrorLevel
    ;move to bottom right
    PixelSearch, aend_x, aend_y, %aend_x%, %abegin_y%, %aend_x%, winHeight, 0x000000, 0, Fast
    if ErrorLevel 
        return ErrorLevel
    aend_y:=aend_y-1 ;step back onto border
    ;check the pixel is the border corner
    PixelSearch, aend_x, aend_y, %aend_x%, %aend_y%, %aend_x%, %aend_y%, 0xB5B5B5, 10, Fast
    if ErrorLevel 
        return ErrorLevel
    
    vGameContainerX2:=aend_x
    vGameContainerY2:=aend_y
    vGameContainerY1:=abegin_y
    vGameContainerX1:=abegin_x
    
    ;game resolution
    vGameContainerWidth:=Abs(vGameContainerX1-vGameContainerX2)
    vGameContainerHeight:=Abs(vGameContainerY1-vGameContainerY2)
    
    return 
}