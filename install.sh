#!/usr/bin/env bash

####################################################
# uxdroid installer V1.0
# Script made by jfachriz
# Copyright (c) 2026 @jfachriz <fachrizj@gmail.com>

version="1.0"
version_code_name="beta01"
installer_authors="jfachriz"

# COLORS
_c_magneta="\e[1;49;95m"
_c_magneta_line="\e[4;49;95m"
_c_green="\e[1;49;32m"
_c_red="\e[1;49;91m"
_c_blue="\e[1;49;94m"
RST="\e[0m"

trap 'echo -e "either CTRC+C or HUP INT TERM signals caught\nexiting.."; exit 1' HUP INT TERM

## current best distro
CUR_BEST_DISTRO="jammy:xfce4"
FSMGR_REPO="https://github.com/jfachriz/fs-manager-uxdroid.git"
FSMGR_BRANCH="main"
install_count="$(curl https://udroid-download-counter-api.vercel.app/count)"

die()    { echo -e "${_c_red}[E] ${*}${RST}";if [ -n "$DISABLE_EXIT" ];then exit 1; fi;:;}
warn()   { echo -e "${_c_red}[W] ${*}${RST}";:;}
shout()  { echo -e "${_c_blue}[-] ${*}${RST}";:;}
lshout() { echo -e "${_c_blue}-> ${*}${RST}";:;}
msg()    { echo -e "${*} \e[0m" >&2;:;}
banner_msg() { echo -e "\e[1;49;97m ${*} \e[0m" >&2;:;}

function logo() {
    # check if logo could fit in terminal with its current tty resolution
    tty_width=$(stty size | cut -d ' ' -f 2)

    # Define Navy Blue color
    _c_navy="\e[34m"

    if ((tty_width >= 65 )); then
        # RES [W X H]: 60X9 ( BEST visible FIT: 65X15 )
        
        # Apply navy blue color to the entire banner block
        echo -e "${_c_navy}"
        banner_msg "████████████████████████████████████████████████████████████"
        echo
        banner_msg "   __  __   _  __    ____     ____     ____    ____    ____ "
        banner_msg "  / / / /  | |/ /   / __ \   / __ \   / __ \  /  _/   / __ \\"
        banner_msg " / / / /   |   /   / / / /  / /_/ /  / / / /  / /    / / / /"
        banner_msg "/ /_/ /   /   |   / /_/ /  / _, _/  / /_/ / _/ /    / /_/ / "
        banner_msg "\____/   /_/|_|  /_____/  /_/ |_|   \____/ /___/   /_____/  "
        echo
        banner_msg "███████████████████████ (c)jfachriz ████████████████████████"
        
        # Reset color back to default before printing the next line
        echo -e "\e[0m"
        lshout "${install_count} installs so far \e[0m...."
    else
        # Just in case the logo is too big for your terminal
        lshout "${_c_navy}uxdroid INSTALLER v$version\e[0m...."
        lshout "${_c_navy}${install_count} installs so far\e[0m"
        lshout "\e[90m© jfachriz\e[0m"
    fi
    sleep 2
}


logo

# Check device os & CPU architecture
# just to make sure its not armv7l 
# (armv7l is not supported cause of 64bit cpu and 32bit os)
lshout "Checking CPU Architecture.."
if [ "$(uname -m)" = "armv7l" ]; then
    die "armv7l is not supported.."
fi
msg "CPU ARCHITECTURE SUPPORTED"

# Check for required packages
# git:          for cloning uxdroid sources
# jq:           for parsing distro data json files
# wget:         for downloading uxdroid filesystems
# proot:        for changing root to filesystems without root ( main element )
# pv:           for showing progress while downloading/extracting filesystems
# pulseaudio:   for audio support
lshout "Checking for required packages.."
DEPENDS="git jq wget proot pv pulseaudio openssl"
TOINSTALL=""

for DEPEND in $DEPENDS; do
    if [ -z "$(command -v "$DEPEND")" ]; then
        TOINSTALL="$TOINSTALL $DEPEND"
    fi
done
if [ -n "$TOINSTALL" ]; then
    lshout "Installing required (missing) packages.."
    pkg install -y $TOINSTALL || {
        die "Failed to install required packages. \"pkg install -y $TOINSTALL\""
    }
else
    lshout "All required packages are already installed."
fi

# clone fs-manager-uxdroid
# a proot-distro fork for uxdroid with some extra features

git clone -b $FSMGR_BRANCH $FSMGR_REPO || {
    die "Failed to clone fs-manager-uxdroid"
}
cd fs-manager-uxdroid || {
    die "Failed to cd into fs-manager-uxdroid"
}

# trigger install.sh
# this will install fs-manager-uxdroid

bash install.sh || {
    die "Failed to install fs-manager-uxdroid"
}


## finally install a good stable distro
lshout "Installing $CUR_BEST_DISTRO in 3 seconds.."
lshout "press C or CTRL+C to stop"
read -r -n 1 -t 3 noi
if [[ $noi == "C" ]]; then
    echo -e "\n\n"
    echo "C read: stopping $CUR_BEST_DISTRO installation.."
    echo "you can still install with: uxdroid l $CUR_BEST_DISTRO"
    echo
else
    uxdroid install $CUR_BEST_DISTRO || {
        die "Failed to install $CUR_BEST_DISTRO"
    }

 ## download startuxdroid.sh
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo " === BUILDING LAUNCHER SCRIPTS === "
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    wget -O "$HOME/startuxdroid.sh" "https://raw.githubusercontent.com/jfachriz/uxdroid/main/startuxdroid.sh" || {
        die "Failed to download startuxdroid.sh"
    }    
    
    chmod +x "$HOME/startuxdroid.sh"
    sleep 1
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo " LAUNCHER CREATED "
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    sleep 1
    echo " Do you want to launch the desktop ?"
    read -r -p " [y/n]: " start_choice
    if [[ "$start_choice" == "y" || "$start_choice" == "Y" ]]; then
        bash "$HOME/startuxdroid.sh"
    else
        echo "To launch the desktop, type ./startuxdroid.sh"
    fi
    echo ""

    ## show some info
    lshout "Installation completed successfully."
    lshout
    lshout "To login $CUR_BEST_DISTRO, run \"${_c_green}uxdroid login $CUR_BEST_DISTRO\""
    lshout "use ${_c_magneta}vncserver :1${RST} to start vnc server"
    lshout "default password for everything is ${_c_magneta}arcadia${RST}"
    lshout "Buy me coffee by starring my repository on github and donating"
    msg
    msg "uxdroid: ${_c_magneta_line}https://github.com/jfachriz/uxdroid${RST}"
    msg "support me:        ${_c_magneta_line}https://github.com/sponsors/jfachriz${RST}"
    msg
fi
