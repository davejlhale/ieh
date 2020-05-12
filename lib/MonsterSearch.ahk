
MonsterSearch() {
    global vCaptureCount 
    global vGameContainerWidth , vGameContainerHeight
    global trapAreaTL , trapAreaBR 
    global begin_x , begin_y

	TraceLog("start monster search")
    ;define capture area
    x1 := round((vGameContainerWidth * trapAreaTL.x)+begin_x)
    y1 := round((vGameContainerHeight * trapAreaTL.y)+begin_y)
    x2 := round((vGameContainerWidth * trapAreaBR.x)+begin_x)
    y2 := round((vGameContainerHeight * trapAreaBR.y)+begin_y)


    #include ..\configs\MonsterList.ahk
    ;showBox(x1,y1,x2,y2)
    
TraceLog("end monster search")
return
}