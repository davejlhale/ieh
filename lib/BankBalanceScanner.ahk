


BankBalanceScanner()
{ 
    global vMouseMemoryX,vMouseMemoryY
    static currentBank:=0
    global interestIncomeOnly
    global SC_ScanPoint	, GB_ScanPoint
    global vGameContainerWidth,vGameContainerHeight, begin_x, begin_y
    if interestIncomeOnly
        currentBank:=1
    
    switch currentBank { 
        case 0: {
            gosub changeToWatchGoldBank
            bankx :=round((vGameContainerWidth * GB_ScanPoint.x)+begin_x)
            banky := round((vGameContainerHeight * GB_ScanPoint.y)+begin_y)
            ; MouseGetPos, bankx,banky
        }
        case 1: {
            gosub changeToWatchSCBank
            bankx :=round((vGameContainerWidth * SC_ScanPoint.x)+begin_x)
            banky := round((vGameContainerHeight * SC_ScanPoint.y)+begin_y)
            ; MouseGetPos, bankx,banky
        }
    }
    mousemove vMouseMemoryX,vMouseMemoryY
    BlockInput mousemoveoff
    funcreturn := bankread(bankx,banky)
    ; returned bank read matches last read
    if (funcreturn) {
        
        if currentBank {
            ; DllCall("winmm.dll\PlaySound", AStr, A_WinDir "\Media\" snd ".wav", uint, 0, uint, 0) 
            gosub buySCbankItems
        }
        ;swap bank to watch
        currentBank:=!currentBank
    } 
} 

bankread(x,y) 
{
    global vHwnd
    static lastpixline:=[]
    colors:={}
    colors.insert("black" , { R:0, g:0, b:0})
    colors.insert("white" , { R:255, g:255, b:255})
    distances:={}
    pixline:=[]
    pixline2:=[]
    pixCount:=0
   
        
        if WinExist( vWinTitle) {
            #WinActivateForce
            WinActivate,  %vWinTitle%
           ; WinRestore,   %vWinTitle%
            sleep 100
        }
        
        
        ;CoordMode, Pixel,client
        ;coordmode mouse, client
    
    
    
    ;length to check
    Loop 50 { ;smaller capture width - needle
        vred := (col & 0xFF)
        vgreen := ((col & 0xFF00) >> 8)
        vblue := ((col & 0xFF0000) >> 16)
        col:=[vred,vgreen,vblue]
        pixline.=dist2(col)
        PixelGetColor col, x++, y
        ;mousemove x,y
    } 
    if (instr(lastpixline,pixline)) {
        lastpixline:=pixline
    return true 
}
else {
    lastpixline:=pixline
    return false
}
}

dist2(col)
{
    distances:={}
    colors:={} 
    colors.insert("black" , { R:0, g:0, b:0} )
    colors.insert("white" , { R:255, g:255, b:255})
    
    for stockcolour, v in colors { 
        ret :=mathdist(v,col) 
        st = %stockcolour%
        distances.insert(stockcolour,ret)
    }
    mincolor := ""
    minval := 2**30 
    for key,val in distances 
    {
        if (val < minval) {
            minval := val
            mincolor = %key% 
            markAs = 1
        }
        Else {
            markAs = 0
        }
    }
    string = %string%%markAs%
    return string 
}

mathdist(v,vCol) {
    a:= (v["R"]-vCol[1])**2
    b:=(v["G"]-vCol[2])**2
    c:=(v["B"]-vCol[3])**2
    return Sqrt(a +b +c)
    return
}

