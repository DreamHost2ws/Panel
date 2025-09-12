#!/bin/bash
echo "[*] Installing LightCode Nebula Theme..."

cd /var/www/pterodactyl || exit

# Backup old CSS
mkdir -p /var/www/pterodactyl-backup
cp -r public /var/www/pterodactyl-backup/public-$(date +%F-%T)

# Download and apply your theme
curl -L https://raw.githubusercontent.com/DreamHost2ws/Panel/main/theme/nebula.css -o public/themes/nebula.css

# Add reference to Panel (if needed, in Blade or config)

chown -R www-data:www-data /var/www/pterodactyl

php artisan view:clear
php artisan cache:clear

echo "[✔] LightCode Nebula Theme applied!"
