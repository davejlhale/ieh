
kingExpFarm() 
{

    global menu4, challenge1,challenge_start,challenge_quit
    critical on
    static kfToggle:= false
    MouseGetPos vX,Vy
    BlockInput, On
    
    kfToggle:=!kfToggle
    if (kfToggle) { 
        showTip("Challenging Slime KIng")
        gClick(menu4,2,100)
        gClick(challenge1,2,100)
        gClick(challenge_start,2,100)
        send, {s down}
    }
    else{
        showTip("")
        send, {s up}
        gClick(menu4)
        gClick(challenge1,2,100)
        gClick(challenge_quit,2,100)
    }
    MouseMove, Vx,Vy
    BlockInput, Off
    critical off
}