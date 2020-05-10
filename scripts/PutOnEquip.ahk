
global equip1 , equip2 , equip3 , equip4 , equip5 , equip6 , equip7 , equip8 , equip9 , equip10 
global equipClassD , equipClassC , equipClassB ,menu5,craft_check_Box, menu4, menu5, menu7
PutOnEquip(aEquipmeentSet:="general")
{
    global EquipIcon
    static vputOnToggle:=False
    global vGameContainerWidth,vGameContainerHeight
    global begin_x, begin_y
    Critical, on

    EquipIcon.Toggle()
    if !(EquipIcon.isactive) {
        SetTimer, putOnEquipAction, off
        return
    }
    
    ;call this label on interval -600000 = 1mins
    SetTimer, putOnEquipAction, 300000
    vEquipmentSet:= checkEquipConfig(aEquipmeentSet)
   
    putOnEquipAction:
        
       
        MovementBlock()
        x:=round((vGameContainerWidth * menu7.x)+begin_x)
        y := round((vGameContainerHeight * menu7.y)+begin_y)
        PixelSearch, , , x, y, x, y, 0x001800 , 5
        ;;if menu button covers color
        if ErrorLevel
            gClick(menu5,2,100)
        else
            gClick(menu4,2,100)
        
        gClick(craft_check_Box,2,100)
   
        Loop, read, configs/EquipmentSets.ini
        {
            Loop, parse, A_LoopReadLine, %A_Tab%%A_Space%
            { 
                if (A_index==1) && (A_loopfield != vEquipmentSet) 
                    passOver:=true
                
                if !passover {
                    if Mod(A_index,2) ;equipment class
                        gClick(A_loopfield,2,50)
                    else ;equipment slot
                        gClick(A_loopfield,2,50) 
                }
            }
            passover:=False
         
            
        } 
        UnblockMovement()
         critical off
    return
}
