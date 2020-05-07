class GUIMenu 
{
    currentMenu:=""
    aMenus:={}
    
    ;todo: read from config
    ;;reads in menu strings from a config file
    readMenuConfig() {
        this.aMenus.insert("dev", (" showGameWindow , findGameWindow , Set Click Points,Record , Stop , Play , Exit , Screen Info , Player Menu" ))
        this.aMenus.insert("home",(" [F2] Warrior , [F3] Wizard , [F4] Angel , [F5] General , [F11] Exit , [F12] Dev Tools" ))
        this.aMenus.insert("angel",(" [F1] Home , [e] Equip , [s] skills , [r] rebirth" ))
        this.aMenus.insert("warrior",(" [F1] Home , [e] Equip , [s] skills , [r] rebirth" ))
        this.aMenus.insert("wizard",(" [F1] Home , [e] Equip , [s] skills , [r] rebirth" ))
        this.aMenus.insert("general",(" [F1] Home , [F7] King Farm ,[F8] Just Run , [F9] Chilli " )) 
        return 
    }
    
    ;;constructor
    __new(aMenu="home"){
        this.readMenuConfig()
        this.show(aMenu)
    } 
    
    show(aMenu) { 
        vMenus:=this.aMenus
        if !vMenus.haskey(aMenu)
            return 0
        this.lastMenu:=this.currentMenu
        this.currentMenu:=aMenu
        vMenuOptions:=vMenus[aMenu]
        this.addGUI(vMenuOptions)
        return
    }
    
    addGUI(sMsg){
        Hwnd:=this.lastMenu
        if Hwnd
            Gui, %Hwnd%:Destroy
        Hwnd:=this.currentMenu
 
        Gui, %Hwnd%:+AlwaysOnTop -Caption +ToolWindow +E0x08000000 +Hwndgui_id
        Gui, %Hwnd%:Margin, 0, 0
        Gui, %Hwnd%:Font, s12
        For i,v in StrSplit(sMsg, ",")
        {
            j:=i=1 ? "":"x+0", j.=InStr(v,"Pause") ? " vPause":""
            Gui, %Hwnd%:Add, Button, %j% gEventAction, %v%
        }
        Gui, %Hwnd%:Show, NA y0, Menu Strip
        return	 
    }  
} 

EventAction:
    {
        if !A_GuiControl
            return
        if IsLabel(k:=RegExReplace(RegExReplace(A_GuiControl,".*]"),"\W"))
            Goto, %k%
        Else
            msgbox %k% - not yet implemented
        return
    }
    
    
    