#!/bin/bash
# =======================================
# LightCode Theme Installer (NookTheme)
# =======================================

set -e  # Stop on error

GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}[*] Installing NookTheme for Pterodactyl...${NC}"

# 1. Update system
sudo apt update

# 2. Install required packages
sudo apt install -y software-properties-common

# 3. Add PHP repository
sudo add-apt-repository -y ppa:ondrej/php

# 4. Update again
sudo apt update

# 5. Install PHP 8.3
sudo apt install -y php8.3

# 6. Check PHP version
php -v

# 7. Move to panel directory
cd /var/www/pterodactyl || exit

# Put panel into maintenance mode
php artisan down

# 8. Download and extract NookTheme
curl -L https://github.com/Nookure/NookTheme/releases/latest/download/panel.tar.gz | tar -xzv

# 9. Fix permissions for storage/cache
chmod -R 755 storage/* bootstrap/cache

# 10. Optimize composer
composer install --no-dev --optimize-autoloader

# 11. Clear cache
php artisan view:clear
php artisan config:clear

# 12. Run migrations
php artisan migrate --seed --force

# 13. Fix ownership depending on distro
if id "www-data" &>/dev/null; then
    chown -R www-data:www-data /var/www/pterodactyl/*
elif id "nginx" &>/dev/null; then
    chown -R nginx:nginx /var/www/pterodactyl/*
elif id "apache" &>/dev/null; then
    chown -R apache:apache /var/www/pterodactyl/*
fi

# 14. Restart queue workers
php artisan queue:restart

# 15. Bring panel back online
php artisan up

echo -e "${GREEN}[✔] NookTheme installed successfully!${NC}"

