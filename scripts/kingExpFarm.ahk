
kingExpFarm() 
{
    
    global menu4, challenge1,challenge_start,challenge_quit
    global kfToggle
    global vGameContainerWidth,vGameContainerHeight
    global vGameContainerX1, vGameContainerY1
    global kingEXPLoopTimer,KingAfter
    global vWinTitle

   
    
    kfToggle:=!kfToggle
    tracelog("kingexp farm try" %kfToggle%)
    if (CheckAllMenuaAreActive()) {
        kfToggle:=false
                SetTimer, kingExpLoop,off
        settimer,keyrepeat,off
        tracelog("no challenge menu")
        return
    }
    

    
    critical on
   
    
    if ! kfToggle
    {
        showTip("")
        send, {s up}
        MovementBlock()
        gClick(menu4,2,150)
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
            gClick(menu4,2,150)
            gClick(challenge1,3,150)
            gClick(challenge_start,4,160)
            WinActivate, %vWinTitle%
            showTip("Challenging Slime KIng press F7 to stop")
        keyrepeat:
            send, {s down} 
            settimer,keyrepeat,50
            critical off
        return
    }
}