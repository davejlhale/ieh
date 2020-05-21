class Hero {
    
    __new(){ 
        ;nested class below
        vWarrior := new this.HeroClass("Warrior")
        vAngel := new this.HeroClass("Angel")
        vWizard := new this.HeroClass("Wizard")
        this.vHeros := [vWarrior,vAngel,vWizard] 
        this.Indentify()
    }
    ;used when checkactive returns no class
    Indentify() {
        for each,ahero in this.vHeros {
            if ahero.IdentifyClass() {
                this.CurrentHero:=ahero
                return this.CurrentHero.Class ;class HeroClass
            }
        } 
        this.CurrentHero:=0
        return false
    }
    
    ;use to identify current hero class
    CheckActive(){
        if this.CurrentHero.CheckActive() 
            return this.CurrentHero.Class
        tracelog("No Active Hero Found")
        return 
    }
    
    /* 
    *** nested class ***
    */
    class HeroClass {
        __new(pClass:=""){
            iniread ScanColorVariance , %A_WorkingDir%\configs\main.ini,Heros,ScanColorVariance
            this.ScanColorVariance:=ScanColorVariance
            
            iniread pColor , %A_WorkingDir%\configs\main.ini,Heros,c%pClass%
            this.Color:=pColor
            this.Class:=pClass
            this.IsActive:=False
            this.KnownLocation:=false
            this.SetSearchCoords()
        }
        ;called only be constructor - can be slow
        SetSearchCoords(){
            global vGameContainerWidth,vGameContainerHeight
            global vGameContainerX1, vGameContainerY1 
            global HeroColorScanLocation
            iniread vScanPointSearchDeviation, %A_WorkingDir%\configs\main.ini,Heros,ScanPointSearchDeviation
            
            this.GameX := HeroColorScanLocation.x - vScanPointSearchDeviation
            this.GameY := HeroColorScanLocation.y - vScanPointSearchDeviation
            this.GameX2 := this.GameX + vScanPointSearchDeviation + vScanPointSearchDeviation
            this.GameY2 := this.GameY + vScanPointSearchDeviation + vScanPointSearchDeviation
        }
        
        IdentifyClass(){
            this.IsActive:=False
            if ! this.KnownLocation {
                PixelSearch,tx ,ty ,this.GameX, this.GameY, this.GameX2, this.GameY2, this.Color , this.ScanColorVariance
                if ErrorLevel ;not found 
                    return 0
                this.GameX := tx
                this.GameY := ty
                this.KnownLocation:=true
                PixelGetColor,exactColor,tx,ty
                this.Color:=exactColor
                tracelog(this.class " identified pixelsearch")
                this.IsActive:=True
                return this.class
            }
            else {
                PixelGetColor, vFoundColor,this.GameX,this.GameY
                if ! (vFoundColor == this.Color)
                    return false
                this.KnownLocation:=true
                tracelog(this.class " identified pixelgetcolor")
                this.IsActive:=True
                return this.class
            }
            return false 
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