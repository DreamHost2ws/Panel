#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

clear

# ==============================
# LightCode Logo
# ==============================
echo -e "${CYAN}"
echo "██╗     ██╗ ██████╗ ██╗  ██╗████████╗ ██████╗ ██████╗ ███████╗"
echo "██║     ██║██╔═══██╗██║ ██╔╝╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝"
echo "██║     ██║██║   ██║█████╔╝    ██║   ██║   ██║██████╔╝█████╗  "
echo "██║     ██║██║   ██║██╔═██╗    ██║   ██║   ██║██╔═══╝ ██╔══╝  "
echo "███████╗██║╚██████╔╝██║  ██╗   ██║   ╚██████╔╝██║     ███████╗"
echo "╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝     ╚══════╝"
echo -e "${NC}"

echo ""
echo "=============================="
echo "   LightCode Pterodactyl Installer"
echo "=============================="
echo ""
echo "1) Install Panel"
echo "2) Install Wings"
echo "3) Install Theme"
echo "4) Uninstall Everything"
echo "0) Exit"
echo ""

read -p "Enter your choice: " choice

case $choice in
    1)
        echo -e "${GREEN}Installing Pterodactyl Panel...${NC}"
        bash <(curl -s https://pterodactyl-installer.se)
        ;;
    2)
        echo -e "${GREEN}Installing Pterodactyl Wings...${NC}"
        bash <(curl -s https://pterodactyl-installer.se)
        ;;
    3)
        echo -e "${GREEN}Installing Theme...${NC}"
        bash <(curl -s https://raw.githubusercontent.com/DreamHost2ws/LightCode-Installer/main/theme.sh)
        ;;
    4)
        echo -e "${RED}Uninstalling Everything...${NC}"
        bash <(curl -s https://raw.githubusercontent.com/DreamHost2ws/LightCode-Installer/main/uninstall.sh)
        ;;
    0)
        echo "Goodbye!"
        exit 0
        ;;
    *)
        echo -e "${RED}Invalid choice!${NC}"
        ;;
esac
