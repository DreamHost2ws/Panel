#!/bin/bash

# Colors
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}[*] Installing Nebula Theme...${NC}"

# Go to panel directory (default install path)
cd /var/www/pterodactyl || exit

# Backup original resources just in case
mkdir -p /var/www/pterodactyl-backup
cp -r public /var/www/pterodactyl-backup/public-$(date +%F-%T)
cp -r resources /var/www/pterodactyl-backup/resources-$(date +%F-%T)

# Download theme files from your repo
curl -L https://github.com/DreamHost2ws/Panel/archive/refs/heads/main.zip -o theme.zip

# Unzip theme files
apt install unzip -y >/dev/null 2>&1
unzip -o theme.zip "Panel-main/theme/*" -d /tmp/
rm -rf theme.zip

# Copy theme into panel
cp -r /tmp/Panel-main/theme/* /var/www/pterodactyl/

# Set correct permissions
chown -R www-data:www-data /var/www/pterodactyl

# Clear cache and recompile
php artisan view:clear
php artisan config:clear
php artisan cache:clear

echo -e "${GREEN}[✔] Nebula Theme installed successfully!${NC}"
