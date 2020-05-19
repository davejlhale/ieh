ChilliScavanger(){
    static scToggle, 
    global vHwnd,vChilliFarmAreaRefresh
    
    tracelog("chillscavanger started")
    WinActivate ahk_id %vHwnd%
    WinWaitActive, ahk_id %vHwnd%
    
    scToggle:=!scToggle
    if scToggle 
    {
        ShowTip("My Precious! if only someone would help me look !!")
        if vChilliFarmAreaRefresh {
            tooltip watchfor
            WatchForChilli()
        } else { ;run diagnol none stop
            settimer, MoveToChilli,50 
        }
    } else {
        ShowTip("")
        settimer, MoveToChilli , off 
        settimer watchForChill,off
        return
    }
}

MoveToChilli(aRN:=0,aRE:=0){
    critical on
    global vMovingToChilli
    static runNorth:=11,runEast:=1
    MovementBlock()
    if aRN {
        runNorth:=runNorth+aRN
        tooltip %runNorth% %runEast%
        return 
    }
    if aRE {
        runEast:=runEast+aRE
        tooltip %runNorth% %runEast%
        return
    }
    tooltip,
    loop %runNorth%{
        send {w}
    }
    loop %runEast%{
        send {d} 
    }
    loop 40 {
        send {w}
        send {w} 
        send {d}
    } 
    unblockmovement()
    return
}

WatchForChilli(){
    
    global vChilliFarmAreaRefresh,vChilliArea,vChilliMap,vChilliColor
    global vGameContainerWidth,vGameContainerHeight
    global vGameContainerX1, vGameContainerY1 ,ChilliScanPoint
    global vHwnd
    
    WinActivate ahk_id %vHwnd%
    
    gameClickX :=round((vGameContainerWidth * ChilliScanPoint.x)+vGameContainerX1)
    gameClickY := round((vGameContainerHeight * ChilliScanPoint.y)+vGameContainerY1)
    static cx1,cx2,cy1,cy2
    cx1:=gameClickX - 1
    cx2:=gameClickX + 1 
    cy1:=gameClickY - 1
    cy2:=gameClickY + 1
    settimer watchForChill,30
    
    watchForChill:
        global vMovingToChilli
        PixelSearch,a , b, %cx1%, %cy1%, %cx2%, %cy2%, vChilliColor ,3
        if errorlevel {
            refreshZone()
        }else {
            MoveToChilli()
            refreshZone()
        } 
    return 
}

refreshZone(){
    global explore_map1,explore_map2,explore_map3,explore_map4,explore_map5,explore_map6,explore_map7,explore_map8
    global explore_area1,explore_area2,explore_area3,explore_area4,explore_area5,explore_area6,explore_area7,explore_area8,dungeon1
    movementblock()
    gclick(menu3,1,50)
    gclick(explore_area6,1,50)
    gclick(explore_map2,1,50)
    UnblockMovement()
}