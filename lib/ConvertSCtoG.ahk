;get cash from sb -use 
ConvertSCtoG() { 
    global vCaptureCount
    msg = "start ConvertSCtoG " vCaptureCount
    traceLog("start ConvertSCtoG")
    if(vCaptureCount > 10) {
        critical on
        MovementBlock()
        gClick(menu1,2,200) ;upgrade 
        gClick(slime_bank,2,107) ;slime bank 
        gClick(sb_withdraw,2,107)
        gClick(sb_withdrawConfirm,2,107) ;SC upgrade right click 
        gClick(sb_GoBack) ;go back
        vCaptureCount:=0
        UnblockMovement()
        traceLog("end ok") 
    } 
return
}
