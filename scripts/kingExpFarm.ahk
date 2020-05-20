
kingExpFarm() 
{ 
    global menu4, challenge1,challenge_start,challenge_quit
    global kfToggle
    global kingEXPLoopTimer
    global vHwnd
    
    kfToggle:=!kfToggle
    tracelog("kingexp farm entry :" kfToggle)
    if (CheckAllMenuaAreActive()) {
        kfToggle:=false
        SetTimer, kingExpLoop,off
        tracelog("no challenge menu")
        return
    }
    
    
    
    critical on
    WinActivate, ahk_id %vHwnd%
    
    if ! kfToggle
    {
        showTip("")
        MovementBlock()
        gClick(menu4,2,150)
        gClick(challenge1,2,100)
        gClick(challenge_quit,2,100)
        SetTimer, kingExpLoop,off
        UnblockMovement()
        return
    }
    Else{
        SetTimer, kingExpLoop,%kingEXPLoopTimer%
        kingExpLoop:
            showTip("Challenging Slime KIng press F7 to stop")
            MovementBlock()
            gClick(menu4,2,150)
            gClick(challenge1,3,150)
            gClick(challenge_start,4,160)
            loop 60
                send, {s} 
            UnblockMovement()
        return
    }
}