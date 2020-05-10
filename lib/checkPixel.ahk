checkPixel(pHero,pcolor,pdimention:=5)
{
    global gameX,gameY
    global begin_x, begin_y

    
    X :=round((gameX * pHero.x)+begin_x)
    Y := round((gameY * pHero.y)+begin_y)
    pdimention:=round(pdimention/2)
    X2:=X+pdimention
    Y2:=Y+pdimention
    
    PixelSearch, , , %X%, %Y%, %X2%, %Y2%, pColor , 30
    ;0 = found
    return ErrorLevel 
}