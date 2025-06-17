#!/bin/bash
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# System Request : Debian 9+/Ubuntu 18.04+/20+
# Develovers » ṡƿ×ʟѧȗ
# Email      » spxlau2@gmail.com
# telegram   » https://t.me/SpiluxX
# whatsapp   » wa.me/+254112011036
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

clear
#!/bin/bash

# 🎭 Glitch effect
glitch_effect() {
    tput civis
    for i in {1..8}; do
        rand=$(head /dev/urandom | tr -dc 'A-Za-z0-9!@#$%^&*()_+=-' | head -c $((RANDOM % 30 + 20)))
        echo -ne "\033[1;35m$rand\r"
        sleep 0.05
    done
    tput cnorm
}

# 🌀 Smooth dot loader animation (10 sec)
smooth_loader() {
    clear
    tput civis
    echo -e "\n\033[1;96m┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    echo -e "┃       \033[1;97mSPXLAU SCRIPT INSTALLER RUNNING\033[1;96m       ┃"
    echo -e "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\n"
    echo -ne "\033[1;93m[ INSTALLING ]\033[0m "

    for i in {1..30}; do
        echo -ne "."
        sleep 0.33
        (( $i % 5 == 0 )) && glitch_effect
    done
    tput cnorm
    echo ""
}

# 📦 Your update script
res1() {
    wget -q https://raw.githubusercontent.com/spxbuoy/spxscript/main/menu/menu.zip
    unzip -qq menu.zip
    chmod +x menu/*
    mv menu/* /usr/local/sbin
    rm -rf menu menu.zip update.sh
}

# 🖼 ASCII Art Display
ascii_success() {
    echo -e "\n\033[1;92m"
    echo "   _____ _____ _      _                _   _              _           _ "
    echo "  / ____|_   _| |    | |              | | (_)            | |         | |"
    echo " | (___   | | | |__  | |_ ___  ___ ___| |_ _  ___  _ __  | |__   ___ | |"
    echo "  \___ \  | | | '_ \ | __/ _ \/ __/ __| __| |/ _ \| '_ \ | '_ \ / _ \| |"
    echo "  ____) |_| |_| | | || ||  __/\__ \__ \ |_| | (_) | | | || |_) | (_) | |"
    echo " |_____/|_____|_| |_| \__\___||___/___/\__|_|\___/|_| |_||_.__/ \___/|_|"
    echo ""
    echo "                  ✅  SPILUX AUTO SCRIPT UPDATED SUCCESSFULLY"
    echo -e "\033[0m"
}

# 🧠 Main Flow
netfilter-persistent
clear
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "\e[1;97;101m            » UPDATE SCRIPT SPXLAU «             \033[0m"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo ""

smooth_loader &
res1
wait
ascii_success

echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
read -p "✅ Press [ Enter ] To Return to Menu"

command -v menu >/dev/null 2>&1 && menu || /usr/local/sbin/menu
