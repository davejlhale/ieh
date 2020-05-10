pause(){
    Suspend, Permit
    static pauseToggle:=false
    

    pauseToggle:=!pauseToggle

    if pauseToggle 
        ShowTip("Paused")
    else 
        ShowTip("")
    
    Pause ,, 1
   ; BlockInput, mousemoveoff
return
}