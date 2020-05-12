TrapMaker() {
    global vCaptureCount 
    global vGameContainerWidth , vGameContainerHeight
    global begin_x , begin_y
    global alchInv1, alchOption_14 , alchemy_use_all
    static skipAlchProgress:=false
    critical on
    TraceLog("start TrapMaker")
    MovementBlock()
    coordmode,Pixel,Client
    winActivate, ahk_id %vHwnd% ;pixelsearching
    
    x :=round((vGameContainerWidth * alchInv1.x)+begin_x)
    y := round((vGameContainerHeight * alchInv1.y)+begin_y)
    x2:=x+5
    y2:=y+5
    vTrapColor:=0x818283
    
    gClick(menu5,2,200)
    gClick(Alchemy_check_Box ,2,108) 
    
    PixelSearch, , , %x%, %y%, %x2%, %y2%, %vTrapColor%, 10 
    if ErrorLevel { ; 1= not found = dont have trap in inv slot 1 
        gClick(alchemy_use_all,2,100) ; clear junk
        if skipAlchProgress {
            gclick(alchemy_1L,2,88) 	
        }
        else {
            gClick(alchemy_10ml,2,88) 			; we wont trap till 1L alch
            gClick(alchemy_100ml,2,88)			;
            gclick(alchemy_1L,2,88) 
            gClick(alchemy_plus_button,2,50) 	;stuck on below 1L will raise
        }
        x :=round((vGameContainerWidth * alchOption_14.x)+begin_x)
        y := round((vGameContainerHeight * alchOption_14.y)+begin_y)
        x2:=x+5
        y2:=y+5
        
        trap:=0x929E9E
        PixelSearch, , , %x%, %y%, %x2%, %y2%, %vTrapColor% ,10 
        if ! errorlevel { ; 0= found = trap at option 14 ie 1L
            ;gClick(alchOption_14,40,50) ;;spam till full or gold
            MouseClick, Right , x,y ,1,0
            skipAlchProgress:=true ;can make these now so speed up by skipping steps above
        } 
    }
    TraceLog("End TrapMaker")
    return 
}
