SetWorkingDir, %A_ScriptDir%


TraceLog(vMsg){
    
    traceLog := FileOpen("logs\traceLog.txt", "a `n")
    FormatTime, TimeString, R, M/d/yyyy HH:mm:ss
    
    vMsg=%TimeString%  :   %vMsg% `n
    traceLog.Write(vMsg)
    sleep 50
}
 