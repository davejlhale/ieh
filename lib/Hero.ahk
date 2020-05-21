class Hero {
    
    __new(){
        iniread cWizard , %A_WorkingDir%\configs\main.ini,Heros,cWizard
        iniread cWarrior , %A_WorkingDir%\configs\main.ini,Heros,cWarrior
        iniread cAngel , %A_WorkingDir%\configs\main.ini,Heros,cAngel
        
        global warriorColorScanLocation
        global angelColorScanLocation
        global wizardColorScanLocation
        
        this.vWarrior := new this.HeroClass(warriorColorScanLocation,"Warrior",cWarrior)
        this.vAngel := new this.HeroClass(angelColorScanLocation,"Angel",cAngel)
        this.vWizard := new this.HeroClass(wizardColorScanLocation,"Wizard",cWizard)
        this.vHeros := [this.vWarrior,this.vAngel,this.vWizard] 
        this.Indentify()
    }
    
    Indentify() {
        for each,ahero in this.vHeros {
            if ahero.IdentifyClass() {
                this.CurrentHero:=ahero
                return this.CurrentHero.Class ;class HeroClass
            }
        } 
        this.CurrentHero:=0
    }
    CheckActive(){
        ahero:=this.CurrentHero
        if ahero.CheckActive() 
            return this.CurrentHero.Class
        tracelog("No Active Hero Found")
        return false
    }
    
    /* 
    *** nested class ***
    */
    class HeroClass {
        __new(pScanLocation:=0,pClass:="",pColor:=0){
            this.ScanLocation:=pScanLocation
            this.Class:=pClass
            this.Color:=pColor
            this.IsActive:=False
            this.GameX:=0
            this.GameY:=0
            this.KnownLocation:=false
            this.SetSearchCoords()
        }
        
        SetSearchCoords(){
            global vGameContainerWidth,vGameContainerHeight
            global vGameContainerX1, vGameContainerY1 
            this.GameX :=round((vGameContainerWidth * this.ScanLocation.x)+vGameContainerX1) - 7
            this.GameY := round((vGameContainerHeight * this.ScanLocation.y)+vGameContainerY1) -7
            this.GameX2 := this.GameX + 14
            this.GameY2 := this.GameY + 14
        }
        
        IdentifyClass(){
            
            this.IsActive:=False
            if ! this.KnownLocation {
                mousemove this.GameX,this.GameY
                PixelSearch,tx ,ty ,this.GameX, this.GameY, this.GameX2, this.GameY2, this.Color , 5
                if ErrorLevel ;not found 
                    return 0
                this.GameX := tx
                this.GameY := ty
                this.KnownLocation:=true
                PixelGetColor,tColor,tx,ty
                this.Color:=tColor
                tracelog(this.class " identified pixelsearch")
            }
            else {
                mousemove this.GameX,this.GameY
                PixelGetColor, vFoundColor,this.GameX,this.GameY
                if ! (vFoundColor == this.Color)
                    return 0
                this.KnownLocation:=true
                tracelog(this.class " identified pixelgetcolor")
            }
            
            this.IsActive:=True
            return this.class
        }
        MoveTo(){
            mousemove this.GameX,this.GameY
        }
        Debug(){
            for each,value in this
                msg=%msg%%each% = %value%`n
            msgbox %msg%
        }
        
        CheckActive() {
            PixelGetColor, vFoundColor,this.GameX,this.GameY
            if ! (vFoundColor == this.Color) {
                return false
            }
            tracelog(this.class " Active")
            return true
            
        }
    } 
}