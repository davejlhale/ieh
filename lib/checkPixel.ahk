checkPixel(pHero,pcolor,pdimention:=5)
{
    global vGameContainerWidth,vGameContainerHeight
    global begin_x, begin_y
    global vHwnd

    X :=round((vGameContainerWidth * pHero.x)+begin_x)
    Y := round((vGameContainerHeight * pHero.y)+begin_y)
    pdimention:=round(pdimention/2)
    X2:=X+pdimention
    Y2:=Y+pdimention
    
    
    PixelSearch, , , %X%, %Y%, %X2%, %Y2%, pColor , 20
    ;0 = found
    return ErrorLevel 
}