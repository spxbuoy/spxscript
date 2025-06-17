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

# ⌛️ Cool animated loading bar (10 seconds total)
super_animation() {
    clear
    tput civis
    echo -e "\n\033[1;96m┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
    echo -e "┃         \033[1;97mSPXLAU SCRIPT UPDATER RUNNING\033[1;96m        ┃"
    echo -e "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛\n"

    echo -ne "\033[1;93m[ Installing... ]\033[0m\n\n"

    bar="▁▂▃▄▅▆▇█"
    for i in $(seq 1 40); do
        sleep 0.25  # 40 × 0.25s = 10s
        chars=${bar:$(($RANDOM % 8)):1}
        printf "\033[1;92m%s" "$chars"
    done
    echo -e "\n\n\033[1;92m✔ Installation Complete! SPXLAU Script Updated!\033[0m\n"
    tput cnorm
}

# 📦 Script install/update
res1() {
    wget -q https://raw.githubusercontent.com/spxbuoy/spxscript/main/menu/menu.zip
    unzip -qq menu.zip
    chmod +x menu/*
    mv menu/* /usr/local/sbin
    rm -rf menu menu.zip update.sh
}

# 🧠 MAIN FLOW
netfilter-persistent
clear
echo ""
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "\e[1;97;101m            » UPDATE SCRIPT SPXLAU «             \033[0m"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo ""

# Run the animation + install
super_animation &
res1
wait

echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
read -p "✅ Press [ Enter ] To Return to Menu"

# 🔄 Load menu if exists
command -v menu >/dev/null 2>&1 && menu || /usr/local/sbin/menu
