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

# ✅ Typewriter animation
type_writer() {
    text="$1"
    delay="${2:-0.03}"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep "$delay"
    done
    echo ""
}

# 🔁 Spinner animation
spinner_loading() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &

    tput civis
    echo -ne "\033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m"

    spinner="/|\\-"
    while true; do
        for ((i = 0; i < 4; i++)); do
            printf "\b${spinner:i:1}"
            sleep 0.1
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
    done

    echo -e "\b\033[1;32m✔\033[1;37m"
    tput cnorm
}

# 📶 Fake progress bar
progress_bar() {
    echo -ne "\033[0;36mLoading: ["
    for i in $(seq 1 30); do
        echo -ne "#"
        sleep 0.03
    done
    echo -e "]\033[0m \033[1;32m100%\033[0m"
    sleep 0.3
}

# 🚀 Update function
res1() {
    wget -q https://raw.githubusercontent.com/spxbuoy/spxscript/main/menu/menu.zip
    unzip -qq menu.zip
    chmod +x menu/*
    mv menu/* /usr/local/sbin
    rm -rf menu menu.zip update.sh
}

# 🧠 MAIN UI
netfilter-persistent
clear
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "\e[1;97;101m            » UPDATE SCRIPT SPXLAU «             \033[0m"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo ""

type_writer $'\033[1;91mFetching the latest SPXLAU updates...\033[1;37m' 0.04
spinner_loading 'res1'

echo ""
progress_bar

# 🔔 Optional beep (uncomment below if you want sound)
# echo -ne "\a"

echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
read -p "✅ Press [ Enter ] To Return to Menu"

# 📂 Open menu
command -v menu >/dev/null 2>&1 && menu || /usr/local/sbin/menu
