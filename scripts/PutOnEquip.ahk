
global equip1 , equip2 , equip3 , equip4 , equip5 , equip6 , equip7 , equip8 , equip9 , equip10 
global equipClassD , equipClassC , equipClassB ,menu5,craft_check_Box, menu4, menu5, menu7
PutOnEquip(aEquipmeentSet:="general")
{
    global EquipIcon, vCheckEquipInterval
    Critical, on
    
    EquipIcon.Toggle()
    if !(EquipIcon.isactive) {
        SetTimer, putOnEquipAction, off
        return
    }
    
    ;call this label on interval -600000 = 1mins
    SetTimer, putOnEquipAction, %vCheckEquipInterval%
    tracelog("putOnEquipAction started")
    putOnEquipAction()
    
}

!d::
ListVars
return

putOnEquipAction() {
    global vGameContainerWidth,vGameContainerHeight
    global begin_x, begin_y, menu7, vCheckEquipInterval
    tracelog("Checking equipment every :" vCheckEquipInterval)
    
    vEquipmentSet:= checkEquipConfig(aEquipmeentSet)
    MovementBlock()
    x:=round((vGameContainerWidth * menu7.x)+begin_x) -2
    y := round((vGameContainerHeight * menu7.y)+begin_y) -2
    x2:= x+5
    y2:= y+5
    
    global vHwnd,vStartTime
    
    critical on
    
    if (A_TickCount-vStartTime > 60000)
        gClick(menu5,2,100)
    else
        gClick(menu4,2,100)
    
    
    gClick(craft_check_Box,2,100)
    
    
    restart:=true
    Loop, read, configs/EquipmentSets.ini
    {
        ;tracelog("equip config file " A_LoopFileName )
        Loop, parse, A_LoopReadLine, %A_Tab%%A_Space%
        { 
            
            if (A_index==1) && (A_loopfield != vEquipmentSet) {
                passOver:=true
                
            }
            
            if !passover && (A_index!=1){
                
                gClick(A_loopfield,2,20)
                
            }
        }
        passover:=False
    }
    
    
    UnblockMovement()
    critical off
    return
}
