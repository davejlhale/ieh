Capture() {
    Critical on

    global CaptureIcon
    traceLog("`nstart lootBestiary")
    CaptureIcon.toggle()
    if !(CaptureIcon.isactive) {
        SetTimer, doNitro,off
        SetTimer, TrapMaker,off
        SetTimer, MonsterSearch,off
        SetTimer, ConvertSCtoG,off
        UnblockMovement()
        TraceLog("end caputre hotkey ok") 
        return
    }
    else {
        SetTimer, doNitro,60000
        SetTimer, TrapMaker,5000
        settimer, ConvertSCtoG,60000
        SetTimer, MonsterSearch,600
        TraceLog("Start Capture hotkey")
        return 
    } 
}