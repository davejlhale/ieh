TrapMaker() {
    
    global alchemy_use_all
    static skipAlchProgress:=false
    global alchInv1_x ,alchInv1_y ,alchInv1_x2 ,alchInv1_y2
    global alchOption_14_x , alchOption_14_y , alchOption_14_x2 , alchOption_14_y2
    global vTrapColor,vAdvanceAlchToBottleSize,vTrapColorVariance
    global vHwnd
    vAllSizes:=["alchemy_1ml" , "alchemy_10ml"	, "alchemy_100ml"	, "alchemy_1L" , "alchemy_10L"	, "alchemy_100L","alchemy_1kL" , "alchemy_10kL"	, "alchemy100kL"	, "alchemy_1mill"	, "alchemy_10mill"	, "alchemy_100mill","alchemy_1BL" , "alchemy_10BL"]
    
    MouseGetPos,,, hWinUnderMouse
    if (vHwnd != hWinUnderMouse && vMonitorCount ==1 ) ;if we dont have window focus and only 1 monitor we cant pixel with winactivate so return
        return
    WinActivate ahk_id %vHwnd%
    
    critical on
    MovementBlock()
    if CheckAllMenuaAreActive() { ;returns false when cant find background ie all there
        gclick(menu4,2,200)
    } else{
        gclick(menu5,2,200)
    }
    
    gClick(Alchemy_check_Box ,1,10) 
    gClick(alchemy_use_all,1,100) ; clear junk from any miss clicks
    
    
    if skipAlchProgress { ;if we met trap making criteria from below
        gclick(alchemy_1L,1,88) ;select our trap size ;todo make ini option
        MouseClick, Right , alchOption_14_x,alchOption_14_y ,2,0	 
         gclick(GB_ScanPoint)
    } else { ;otherwise progress through menus so it defaults at our highest made.
        for each, size in vAllSizes {
            gclick(size,1,88)
            if (size==vAdvanceAlchToBottleSize) { ;if we reach our build size target stop
                break
            } 
        }
        gClick(alchemy_plus_button,1,50)
        
        if checkPixel(%vAdvanceAlchToBottleSize%,0x2C2E2B,8,1,30) { ;check if size option to build to open - set in ini
            gclick(alchemy_1L,1,88) ;and if so go bak to 1L
            if ! checkPixel(alchOption_14,vTrapColor,5,5,vTrapColorVariance) { ;check traps can be made
                MouseClick, Right , alchOption_14_x,alchOption_14_y ,2,0 ;and if so make as many as can
                skipAlchProgress:=true ;can make these now so speed up by skipping steps above
            } else { ;otherwise swollow some 1ml energy
                gClick(alchemy_1ml,1,88)
                gClick(alchOption_1,20,50)
                gClick(alchemy_use_all,2,100) 
            }
            
        }else { ;if we cant select our ini set option build to size energy drink
            gClick(alchemy_1ml,1,88)
            gClick(alchOption_1,20,50)
            gClick(alchemy_use_all,2,100) 
        }
        unblockmovement()
        return 
    }
}