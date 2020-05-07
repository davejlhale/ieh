;;displays mouse x,y, curreent pixel color and Hwnd of window under mouse
showScreenInfo(){
        Critical on
        static CoordsToggle:=false
        CoordsToggle := !CoordsToggle
        if (CoordsToggle){ 
            SetTimer, ScreenInfoTimer, 100
            ScreenInfoTimer:
                MouseGetPos, xpos, ypos
                PixelGetColor, OutputVar, xpos, ypos
                MouseGetPos,,, hWinUnderMouse
                
                tooltip, x: %xpos% y: %ypos% `ncolor: %OutputVar% `nHwnd: %hWinUnderMouse%
            return
        }
        else
        {
            tooltip,
            SetTimer, ScreenInfoTimer, off
        } 
        return
    }