DisplaySkillGui:

Gui, Add, Picture, x0 y0 w80 h60 , C:\git\ieh\images\gui\skillslot.bmp
Gui, Add, UpDown, vSlot1 gChanged Range0-10 ,0
Gui, Add, Picture, x90 y0 w80 h60 , C:\git\ieh\images\gui\skillslot.bmp
Gui, Add, UpDown, vSlot2 gChanged Range0-10 ,0
Gui, Add, Picture, x180 y0 w80 h60 , C:\git\ieh\images\gui\skillslot.bmp
Gui, Add, UpDown, vSlot3 gChanged Range0-10 ,0
Gui, Add, Picture, x0 y70 w80 h60 , C:\git\ieh\images\gui\skillslot.bmp
Gui, Add, UpDown, vSlot4 gChanged Range0-10 ,0
Gui, Add, Picture, x90 y70 w80 h60 , C:\git\ieh\images\gui\skillslot.bmp
Gui, Add, UpDown, vSlot5 gChanged Range0-10 ,0
Gui, Add, Picture, x180 y70 w80 h60 , C:\git\ieh\images\gui\skillslot.bmp
Gui, Add, UpDown, vSlot6 gChanged Range0-10 ,0

Gui, Add, Picture, x350 y0 w80 h60 , C:\git\ieh\images\gui\skillslot.bmp
Gui, Add, UpDown, vGlobalSlot1 gChanged Range0-10 ,0
Gui, Add, Picture, x440 y0 w80 h60 , C:\git\ieh\images\gui\skillslot.bmp
Gui, Add, UpDown, vGlobalSlot2 gChanged Range0-10 ,0
Gui, Add, Picture, x530 y0 w80 h60 , C:\git\ieh\images\gui\skillslot.bmp
Gui, Add, UpDown, vGlobalSlot3 gChanged Range0-10 ,0
Gui, Add, Picture, x620 y0 w80 h60 , C:\git\ieh\images\gui\skillslot.bmp
Gui, Add, UpDown, vGlobalSlot4 gChanged Range0-10 ,0

Gui, Add, Picture, x350 y70 w80 h60 , C:\git\ieh\images\gui\skillslot.bmp
Gui, Add, UpDown, vGlobalSlot5 gChanged Range0-10 ,0
Gui, Add, Picture, x440 y70 w80 h60 , C:\git\ieh\images\gui\skillslot.bmp
Gui, Add, UpDown, vGlobalSlot6 gChanged Range0-10 ,0
Gui, Add, Picture, x530 y70 w80 h60 , C:\git\ieh\images\gui\skillslot.bmp
Gui, Add, UpDown, vGlobalSlot7 gChanged Range0-10 ,0
Gui, Add, Picture, x620 y70 w80 h60 , C:\git\ieh\images\gui\skillslot.bmp
Gui, Add, UpDown, vGlobalSlot8 gChanged Range0-10 ,0

Gui, Add, Button,gConfirm, &Confirm
Gui, Add, Button,gGuiClose, &Cancel

Gui, Show, x199 y164 h351 w800, New GUI Window



Return
GuiClose:
ExitApp

Confirm(){
    cAllSlots :=["Slot1","Slot2","Slot3","Slot4","Slot5","Slot6","GlobalSlot1","GlobalSlot2","GlobalSlot3","GlobalSlot4","GlobalSlot5","GlobalSlot6","GlobalSlot7","GlobalSlot8"]
    vSet:={}
    vSetName=General
    for each,SlotName in cAllSlots {
        GuiControlGet, value, , %SlotName%
         vSet.push((vSetName),{(SlotName):value})
    }
    vText=%vSetName%
    FileOpen("configs\skillfile.txt", "w `n")
    for each, value in vSet {
        for each , value in value{
            vText= %vText%%A_Tab%%each%%A_Tab%%value% 
        }    
    }
    msgbox % vText
return
}


Changed: 
    x:= % %A_GuiControl% 
return