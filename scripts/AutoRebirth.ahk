
!y::
AutoRebirth:
    critical on
    tracelog("auto rebirth")
    
    EquipIcon.turnOff()
    SetTimer, putOnEquipAction, off
    BankCapBuyerIcon.turnOff()
    SetTimer, BankBalanceScanner, off
    buffCycleIcon.turnOff()
    SetTimer, AngelWeaveLoop, off
    upgradeCycleIcon.turnOff()
    SetTimer, timedupgradeCycle, off
    lootBestiaryIcon.turnOff()
    SetTimer, timedlootBestiary, off
    NitroIcon.turnOff()
    SetTimer, doNitroLoop, off
    if kfToggle 
        kingExpFarm()
    
    SetTimer, kingExpLoop,off
    vCurrentHero:=""
    MovementBlock()
    if CheckAllMenuaAreActive() { ;returns false when cant find background ie all there
        gclick(menu6,2,200)
    } else{
        gclick(menu7,2,200)
    }
    gclick(rebirthSelect,2,200)
    gclick(rebirthConfirm,2,200)
    sleep 15000
    gclick(gameStart,2,200)
    sleep 5000	
    UnblockMovement()
return
