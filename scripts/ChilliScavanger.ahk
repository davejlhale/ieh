ChilliScavanger(){
    static scToggle,vMonitorCount 
    global vHwnd
 
    tracelog("chillscavanger started")
    WinActivate ahk_id %vHwnd%
    WinWaitActive, ahk_id %vHwnd%

    scToggle:=!scToggle
    if scToggle 
    {
        settimer, scavangetimerloop,10
        ShowTip("My Precious! if only someone would help me look !!")
        scavangetimerloop:
            Send, {w }
            Send, {d 1}{w 2} 
            Send, {d 1}{w 2} 
            Send, {w 2}
            Send, {d 1}{w 2} 
            Send, {d 1}{w 2} 
            Send, {w 2}
        return
    }
    else 
    {
        ShowTip("")
        settimer, scavangetimerloop, delete 
    }
    return
}