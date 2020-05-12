pause(){
    Suspend, Permit
    static pauseToggle:=false
    
    pauseToggle:=!pauseToggle  
    if pauseToggle {
        UnblockMovement()
        ShowTip("Paused")
        traceLog("paused")
    }
    else 
    {
        ShowTip("")
        traceLog("unpaused") 
    }
    Pause ,, 1
    return
}