#!/bin/bash

# Démarrer le service MySQL
service mysql start

# Créer la base de données
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

# Créer l'utilisateur
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# Accorder tous les privilèges à l'utilisateur
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# Modifier l'utilisateur root
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

# Rafraîchir les privilèges
mysql -e "FLUSH PRIVILEGES;"
