;;loads clickpoints from offsets.txt into dynamicly named instances of class ClickPoint
  
    global clickPoints := {}

loadClickPoints()
{
    Critical on
    
    clickPoints := {}
    Loop, read, configs\offsets.txt 
    {
        Loop, parse, A_LoopReadLine, %A_Tab%
        {
            Switch A_Index 
            {
                Case "1":
                    name:= A_LoopField	
                Case "2":
                    x:= A_LoopField	
                Case "3":
                    y:= A_LoopField	
                    Default:							
                }
            } 
            
            %name% :=new ClickPoint(name,x,y)
        }
        return
    }
    
    ;;simple class to hold click point name, x and y
    class ClickPoint{
        name := none
        x:=0
        y:=0
        class:="ClickPoint"
        
        __New(aname:="nameless",ax:=0,ay:=0)
        {
            this.name:=aname
            this.x:=ax
            this.y:=ay
        }
        __Get(class)
        {
            return "ClickPoint"
        }
    }
    