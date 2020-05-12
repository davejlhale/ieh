
MonsterSearch() {
    global vCaptureCount 
    global vGameContainerWidth , vGameContainerHeight
    global trapAreaTL , trapAreaBR 
    global begin_x , begin_y

	;TraceLog("start monster search")
    ;define capture area
    global   vTrapx1 ,   vTrapy1 ,    vTrapx2 ,    vTrapy2 

;tooltip % vTrapx1  . " "  . vTrapy1   . " "  .    vTrapx2  . " "  .    vTrapy2 
    #include ..\configs\MonsterList.ahk

    
;TraceLog("end monster search")
return
}