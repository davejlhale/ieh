
;move mouse around perimiter of box at given spped
showBox(X1:=0, Y1:=0, X2:=0, Y2:=0,Speed:=10)
{
    
    CoordMode, mouse,client
    try {
        global vWinTitle
        WinActivate, %vWinTitle%
        if ErrorLevel
            return
          
        mousemove, X1,Y1,Speed 
        mousemove, X2,Y1,Speed 
        mousemove, X2,Y2,Speed 
        mousemove, X1,Y2,Speed 
        mousemove, X1,Y1,Speed 
        return     
    }
    catch e {
        msgbox,20, Failed to showBox `nX1: %X1% `nX2: %X2% `nY1: %Y1% `nY2: %Y2%
        throw 1
    }
}
