# Taxi Boss Auto Farm Tracker

## ⚠️ Disclaimer
**For Educational Purposes Only.** This script is provided as a proof-of-concept to demonstrate GUI creation and pixel detection in AutoHotkey. The creator, yukira, is not responsible or liable for any consequences resulting from the use of this script, including but not limited to account bans, suspensions, or any violation of Roblox's Terms of Service. By downloading and using this tool, you assume all risks associated with its use. 

## 📖 Description
Welcome to the Taxi-Boss Auto Repair + Auto Claim Vault Money + Anti-AFK Script! This tool automates repetitive tasks in the game while providing a clean, dual-window graphical interface to track your farming sessions in real-time.

## ✨ Features
* **Live Tracking Dashboard:** Monitors and displays your current "E Key Holds" and "Mechanics Sent" during a session.
* **Auto Repair:** Automatically detects the necessary buttons to send a mechanic, programmed with a delay that waits 1.5 seconds for scrolling to ensure accuracy.
* **Auto Vault Claim & Anti-AFK:** Automatically jumps and holds the 'E' key on scheduled timers to prevent server disconnection and claim money.
* **Status Indicator:** Live visual indicator showing if the script is RUNNING or PAUSED.

## ⌨️ Hotkeys
* **F8:** Start / Pause script
* **Esc:** Exit script

## 📥 Installation & Setup
To use this tool, you do not need to install AutoHotkey. Just follow these steps:

1. Go to the **Releases** section on the right side of this GitHub page and download the latest `.zip` file.
2. **Extract** the downloaded `.zip` file into a dedicated folder on your PC. Do not run the `.exe` directly from inside the `.zip` folder.
3. Open the extracted folder. You must ensure that the `.exe` file and all required image files are kept together in this exact same folder:
    * `profile.png` (Used for the display picture)
    * `goToDriver.png` (Used to detect the Go To Driver button)
    * `sendMechanic.png` (Used to detect the Send Mechanic button)
4. Double-click the `.exe` file to launch the tracker. *(Note: If the game blocks the automated clicks, right-click the `.exe` and select "Run as Administrator").*

## 🔄 Changelog

### [v3.5] - Current Release
* **Scroll Delay Fix:** Added a precise 1.5-second delay after clicking "Go to Driver" to ensure the game fully scrolls before searching for the "Send Mechanic" button.
* **Compact UI Redesign:** Stripped out excess spacing and dashed lines for a sleeker, more professional overlay that doesn't block gameplay.
* **Custom Welcome Message:** Added a variable to easily customize the header text on the launch screen.

### [v3.0]
* **Multi-Window Interface:** Split the GUI into a branded Welcome Screen and a separate Live Tracking Dashboard.
* **Personalized Branding:** Integrated profile picture support (`profile.png`) and clickable GitHub links directly into the app interface.
* **Status Indicator:** Added a live RED/GREEN status text to clearly show whether the macro is paused or running.

### [v2.0]
* **Live On-Screen GUI:** Replaced background tracking with an always-on-top dashboard.
* **Action Counters:** Introduced live variables (`eCount` and `mechanicCount`) that update on the screen the exact millisecond an action is performed.
* **Game Engine Fixes:** Adjusted the jump command to hold the Spacebar for 50ms, ensuring the 3D game engine registers the keystroke to prevent AFK disconnects.

### [v1.0] - Initial Release
* **Core Automation:** Basic script using `ImageSearch` to locate and click the "Go to Driver" and "Send Mechanic" buttons.
* **Background Timers:** Introduced `SetTimer` functionality to handle automated jumping and vault claiming independently from the image searching loop.

## 👤 Credits & Contact
* **Script by:** Yukira
* **Contact:** cxletz@gmail.com
