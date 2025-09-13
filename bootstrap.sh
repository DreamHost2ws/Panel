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
echo "██╗     ██████╗  ██████╗   ██████╗   ██████╗   ██║██║██║"
echo "██║     ██╔══██╗ ██╔═══   ██╔═══██╗  ██╔═══██╗ ██║╔╝    " 
echo "██║     ██████╔╝ ██║      ██║   ██║  ██║   ██║ ██║██║   " 
echo "██║     ██╔═══╝  ██║      ██║   ██║  ██║   ██║ ██║╔╝    "
echo "███████╗██║      ╚██████  ╚██████╔╝  ██████╔╝  ██║██║██║"
echo "╚══════╝╚═╝       ╚═════   ╚═════╝   ╚═════╝   ╚═══════╝"
echo -e "${NC}"

echo ""
echo "======================================"
echo "   LightCode Pterodactyl Installer"
echo "======================================"
echo ""
echo "1) Install Panel + Wing"
echo "2) Install Theme"
echo "3) Uninstall Everything"
echo "0) Exit"
echo ""

read -p "Enter your choice: " choice

case $choice in
    1)
        echo -e "${GREEN}Installing Pterodactyl Panel...${NC}"
        bash <(curl -s https://pterodactyl-installer.se)
        ;;
    2)
        echo -e "${GREEN}Installing Theme...${NC}"
        bash <(curl -s https://raw.githubusercontent.com/DreamHost2ws/LightCode-Installer/main/theme.sh)
        ;;
    3)
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
