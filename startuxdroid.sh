#!/data/data/com.termux/files/usr/bin/bash
# Automated Launcher Script for UXDROID
# Made by @jfachriz

# 1. CHECK FOR TERMUX-X11
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "               CHECKING X11 SERVER               "
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
sleep 1
echo ""
echo "                === X11 READY === "
echo ""
sleep 1
if ! command -v termux-x11 &> /dev/null; then
    echo "⚠️ termux-x11 is not installed!"
sleep 1
    read -p "Would you like to install x11-repo and termux-x11-nightly? (y/n): " choice
    
    case "$choice" in 
        [yY][eE][sS]|[yY]) 
            echo "🔄 Updating packages and installing x11-repo..."
            pkg update -y && pkg install x11-repo -y
            echo "🔄 Installing termux-x11-nightly..."
            pkg install termux-x11-nightly -y
            ;;
        *)
            echo "❌ Aborting script. termux-x11 is required."
            exit 1
            ;;
    esac
fi

# 2. START THE SERVER
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "               INITIATING SERVER               "
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
sleep 1
echo "            === SERVER INITIATED === "
termux-x11 :1 -ac &
sleep 1

# 3. SIGN IN & ENTER DESKTOP
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "                   SIGNING IN                  "
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "            === SIGNED IN SUCCESSFULLY === "
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "                ENTERING DESKTOP               "
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
sleep 1
am start -n com.termux.x11/.MainActivity &> /dev/null
uxdroid login jammy:xfce4 env DISPLAY=:1 startxfce4 &
