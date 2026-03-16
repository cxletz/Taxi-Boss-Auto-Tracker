#MaxThreadsPerHotkey 2
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

; ==========================================
; 1. CUSTOMIZATION (EDIT THESE!)
; ==========================================
CustomMessageHead := "Welcome to the Taxi-Boss Auto Repair + Auto Claim Vault Money + Anti-AFK Script!"
CustomMessageBody := "I'm not responsible or liable for any consequences from the use of this tool." ; ADD DISCLAIMER HERE
ContactInfo := "Contact me here: cxletz@gmail.com" 

; ==========================================
; 2. INITIALIZE VARIABLES
; ==========================================
Toggle := 0
eCount := 0
mechanicCount := 0

; ==========================================
; 3. WINDOW 1: WELCOME SCREEN
; ==========================================
Gui, 1:+AlwaysOnTop -MaximizeBox
Gui, 1:Color, F0F0F0
Gui, 1:Font, s8, Segoe UI 

; Picture Placeholder
Gui, 1:Add, Picture, w150 h150 x35, profile.png 
Gui, 1:Add, Text, w200 Center, ; spacer

; Custom Welcome Message
Gui, 1:Font, bold
Gui, 1:Add, Text, w200 Center, %CustomMessageHead%
Gui, 1:Font, norm
Gui, 1:Add, Text, w200 Center,  %CustomMessageBody%
Gui, 1:Font, bold
Gui, 1:Add, Text, w200 Center, %ContactInfo%

; Creator Credits
Gui, 1:Font, bold
Gui, 1:Add, Text, w200 Center, Script by Yukira
Gui, 1:Font, norm
Gui, 1:Add, Link, w200 Center, Visit my Github Profile! -> <a href="https://github.com/cxletz">Yukira</a>

Gui, 1:Add, Text, w200, ; blank spacer line
Gui, 1:Add, Button, w100 x60 gOpenMainGui, Start
Gui, 1:Show,, Taxi-Boss Script

return 

; ==========================================
; 4. WINDOW 2: MAIN DASHBOARD
; ==========================================
OpenMainGui:
Gui, 1:Destroy 

Gui, 2:+AlwaysOnTop -MaximizeBox
Gui, 2:Color, F0F0F0
Gui, 2:Font, s8, Segoe UI 

; Hotkeys Section
Gui, 2:Font, bold
Gui, 2:Add, Text, w250, Hotkeys:
Gui, 2:Font, norm
Gui, 2:Add, Text, w250, - F8: Start / Pause script
Gui, 2:Add, Text, w250, - Esc: Exit script
Gui, 2:Add, Text, w250, --------------------------------

; Counters Section
Gui, 2:Font, bold
Gui, 2:Add, Text, w250, Live Tracking:
Gui, 2:Font, norm
Gui, 2:Add, Text, w250 vEText, E Key Holds: 0
Gui, 2:Add, Text, w250 vMechText, Mechanics Sent: 0
Gui, 2:Add, Text, w250, --------------------------------

; Status Section
Gui, 2:Font, bold
Gui, 2:Add, Text, w250 vStatusText cRed, Status: PAUSED
Gui, 2:Font, norm
Gui, 2:Add, Text, w250, --------------------------------

; Credits Section
Gui, 2:Font, bold
Gui, 2:Add, Text, w250, Credits: Yukira
Gui, 2:Font, norm
Gui, 2:Add, Link, w250, Visit my Github Repository! -> <a href="https://github.com/cxletz">Yukira</a>

Gui, 2:Show, x10 y10 NoActivate, Taxi-Boss Tracker
return

; ==========================================
; 5. MAIN SCRIPT LOGIC
; ==========================================
F8::
Toggle := !Toggle

if (Toggle) {
    GuiControl, 2:+cGreen, StatusText
    GuiControl, 2:, StatusText, Status: RUNNING
    
    SetTimer, JumpAction, 10000  
    SetTimer, HoldEAction, 60000 
} else {
    GuiControl, 2:+cRed, StatusText
    GuiControl, 2:, StatusText, Status: PAUSED
    
    SetTimer, JumpAction, Off
    SetTimer, HoldEAction, Off
}

While Toggle {
    ImageSearch, FoundX1, FoundY1, 0, 0, A_ScreenWidth, A_ScreenHeight, *50 goToDriver.png
    
    if (ErrorLevel = 0) {
        TargetX1 := FoundX1 + 30 
        TargetY1 := FoundY1 + 10 
        
        MouseMove, %TargetX1%, %TargetY1%
        Sleep, 100
        Click, Down
        Sleep, 50
        Click, Up
        
        ; ==================================================
        ; INCREASED DELAY HERE: Waits 1.5 seconds for scrolling
        ; ==================================================
        Sleep, 1500 
        
        ImageSearch, FoundX2, FoundY2, 0, 0, A_ScreenWidth, A_ScreenHeight, *50 sendMechanic.png
        
        if (ErrorLevel = 0) {
            TargetX2 := FoundX2 + 30
            TargetY2 := FoundY2 + 10
            
            MouseMove, %TargetX2%, %TargetY2%
            Sleep, 100
            Click, Down
            Sleep, 50
            Click, Up
            
            mechanicCount++
            GuiControl, 2:, MechText, Mechanics Sent: %mechanicCount%
            
            Sleep, 500
            Click, WheelUp 10 
            Sleep, 500
        }
    }
    Sleep, 1000 
}
return

; ==========================================
; 6. BACKGROUND TIMER ACTIONS
; ==========================================
JumpAction:
if (Toggle) {
    Send, {Space down}
    Sleep, 50
    Send, {Space up}
}
return

HoldEAction:
if (Toggle) {
    Send, {e down} 
    Sleep, 3000   
    Send, {e up}   
    
    eCount++
    GuiControl, 2:, EText, E Key Holds: %eCount%
}
return

; ==========================================
; 7. EXIT COMMANDS
; ==========================================
Esc::ExitApp

GuiClose:      
ExitApp

2GuiClose:     
ExitApp