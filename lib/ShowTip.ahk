;;shows message onscreen. @param1 "msg" or "" to turn off. @param2 distance from top
ShowTip(s:="", pos:="y35", color:="Red|00FFFF") {
            static bak, idx
            if (bak=color "," pos "," s)
                return
            bak:=color "," pos "," s
            SetTimer, ShowTip_ChangeColor, Off
            Gui, ShowTip: Destroy
            if (s="")
                return
            ; WS_EX_NOACTIVATE:=0x08000000, WS_EX_TRANSPARENT:=0x20
            Gui, ShowTip: +LastFound +AlwaysOnTop +ToolWindow -Caption +E0x08000020
            Gui, ShowTip: Color, FFFFF0
            WinSet, TransColor, FFFFF0 150
            Gui, ShowTip: Margin, 10, 5
            Gui, ShowTip: Font, Q3 s20 bold
            Gui, ShowTip: Add, Text,, %s%
            Gui, ShowTip: Show, NA %pos%, ShowTip
            SetTimer, ShowTip_ChangeColor, 1000
            ShowTip_ChangeColor:
                Gui, ShowTip: +AlwaysOnTop
                r:=StrSplit(SubStr(bak,1,InStr(bak,",")-1),"|")
                Gui, ShowTip: Font, % "Q3 c" r[idx:=Mod(Round(idx),r.length())+1]
                GuiControl, ShowTip: Font, Static1
            return
        } 