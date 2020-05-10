SetWorkingDir, %A_ScriptDir%


TraceLog(vMsg){
    
    traceLog := FileOpen("logs\traceLog.txt", "a `n")
    vMsg.="`n"
    traceLog.Write(vMsg)
    sleep 50
}
