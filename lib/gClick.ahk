;;clicks on aClickponit, aClickCountTimes with aDelay between clicks
gClick( aClickPoint,aClickCount:=1,aDelay:=20) { 
    CoordMode, Mouse, Client
    Critical on
    global gWinTitle
    global gameX,gameY
    global begin_x, begin_y
    global sb_donate , sb_purifucation , sb_efficiency , sb_exchange 
    global sb_interest , sb_cap , sb_et_stone , sb_et_crystal , sb_et_leaf , sb_strength , 
    global sb_mind , sb_healty_captue , sb_enhanced_capture , sb_monster_counter , sb_graduates 
    global sb_ledger , sb_nitro_generators , sb_monster_taming , sb_powder_store , sb_explorers_capacity
    global SC_ScanPoint	, GB_ScanPoint
    
    if ! isObject(aClickPoint) {
        aClickPoint :=%aClickPoint%.clone()
        if ! isObject(aClickPoint) && aClickPoint.class!="ClickPoint"
            return
    }
    WinGetTitle, Title, A
    if ! instr(Title,gWinTitle,false)
        return 1
    
    gameClickX :=round((gameX * aClickPoint.x)+begin_x)
    gameClickY := round((gameY * aClickPoint.y)+begin_y)
    
    loop %aClickCount%
    {
        Send {click, %gameClickX%, %gameClickY%}
        sleep %aDelay%
    }
    return
} 