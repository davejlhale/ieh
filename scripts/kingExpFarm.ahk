
kingExpFarm() 
{
    
    global menu4, challenge1,challenge_start,challenge_quit
    global kfToggle
    global vGameContainerWidth,vGameContainerHeight
    global begin_x, begin_y
    global kingEXPLoopTimer,KingAfter
    global vWinTitle

   
    if (CheckAllMenuaAreActive()) ;found bk col
        return
    kfToggle:=!kfToggle
    
    x:=round((vGameContainerWidth * menu7.x)+begin_x)
    y := round((vGameContainerHeight * menu7.y)+begin_y)
    PixelSearch, , , x, y, x, y, 0x001800 , 5
    ;;if menu button covers color
    if ! ErrorLevel
        kfToggle:=false
    
    critical on
    MouseGetPos vX,Vy
    ; BlockInput, On
    
    if ! kfToggle
    {
        showTip("")
        send, {s up}
        MovementBlock()
        gClick(menu4)
        gClick(challenge1,2,100)
        gClick(challenge_quit,2,100)
        SetTimer, kingExpLoop,off
        settimer,keyrepeat,off
        UnblockMovement()
        return
    }
    Else{
        SetTimer, kingExpLoop,%kingEXPLoopTimer%
        kingExpLoop:
            MovementBlock()
            gClick(menu4,2,100)
            gClick(challenge1,2,100)
            gClick(challenge_start,2,100)
            WinActivate, %vWinTitle%
            showTip("Challenging Slime KIng press F7 to stop")
        keyrepeat:
            send, {s down} 
            settimer,keyrepeat,50
            critical off
        return
    }
}