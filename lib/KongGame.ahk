KongGame(){
    return
}
class KongGame {
    
    WinTitle:=0
    Hwnd := 0
    Container:={}
    
    __new(pGameName=""){
        TraceLog("Starting IEH Assist")
        SetTitleMatchMode, 2
        if this.findWindow(pGameName) {
            this.Container := this.findGameContainer()
            if (this.Container) {
                this.found:=true
                return  this
            }
        }
                        msgbox not ok

        return false
    }
    
    findWindow(pGameName){
        WinGet, vHwnd, ID ,%pGameName%
        if (vHwnd) {
            this.WinTitle:=pGameName
            this.Hwnd := vHwnd
            WinActivate, ahk_id %vHwnd%
            WinWaitActive, ahk_id %vHwnd%, , 2
            TraceLog("Found " pGameName " Hwnd:" vHwnd)
            return True
        }
        TraceLog("Game Tab not found " pGameName )
        return false
    }
    
    findGameContainer(pShow:=false){
        vHwnd:=this.Hwnd
        if !vHwnd
            return false
        WinActivate, ahk_id %vHwnd%
        WinWaitActive, ahk_id %vHwnd% , ,2
        WinGetPos, , , ClientWidth, ClientHeight, ahk_id %vHwnd%
        mid:=ClientHeight*0.5
        
        try{
            TraceLog("Searching for game container")
            ;find the left game border
            PixelSearch , ClientX1 , , 0, %mid%, %ClientWidth%, %mid%, 0xB5B5B5, 3, Fast
            if ErrorLevel 
                throw "container not found"
            ;move to top left
            PixelSearch , , ClientY1 , %ClientX1%, %mid%, %ClientX1%, 0, 0x000000, 0, Fast
            if ErrorLevel 
                throw "container not found"
            ClientY1:=ClientY1+1 
            ;top right
            PixelSearch , ClientX2 , , %ClientX1%, %ClientY1%, %ClientWidth%, ClientY1, 0x000000, 0, Fast
            if ErrorLevel 
                throw "container not found"
            ClientX2:=ClientX2-1 
            ;bottom right
            PixelSearch , , ClientY2 , %ClientX2%, %ClientY1%, %ClientX2%, %ClientHeight%, 0x000000, 0, Fast
            if ErrorLevel 
                throw "container not found"
            ClientY2:=ClientY2-1 
        } catch e {
            TraceLog(e)
            return false
        }
        ;game resolution
        Container:={}
        Container.Width:=Abs(ClientX1-ClientX2)
        Container.Height:=Abs(ClientY1-ClientY2)
        Container.x1:=ClientX1
        Container.x2:=ClientX2
        Container.y1:=ClientY1
        Container.y2:=ClientY2
        TraceLog( "game Container found x1:" ClientX1 " x2:" ClientX2 " y1:" ClientY1 " y2:" ClientY2 " width:" Container.Width " height:" Container.Height) 
        if pShow 
            showBox(Container.x1, Container.y1, Container.x2, Container.y2) 
        return container
    }
}