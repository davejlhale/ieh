checkEquipConfig(pEquipListName="general") 
{ 
    global currentMenu
    global menu
    if ! aEquipmeentSet 
        aEquipmeentSet:=menu.checkCurrentMenu()
    switch aEquipmeentSet{
        case "angel" : vEquipmentSet := "angel" 
        case "warrior" : vEquipmentSet := "warrior"
        case "wizard" : vEquipmentSet := "wizard" 
        case "general" : vEquipmentSet := "general"
        default : vEquipmentSet := "general" 
    }
    return vEquipmentSet
}


