#!/bin/bash 

echo "Running wp-autoconfig.sh script..."
sleep 10

if [ -f /var/www/html/wp-config.php ]; then
	echo "wordpress is already configured."
	/usr/sbin/php-fpm7.4 -F
else

wp config create --allow-root --dbname=${DATABASE} --dbuser=${USER} --dbpass=${USER_PASSWORD} --dbhost=mariadb
wp core install --allow-root --url=${HOSTNAME} --title="Inception" --admin_user=MasterOfUniverse --admin_password=${ROOT_PASSWORD} --admin_email=adm@qdenizar.42.fr
wp user create --allow-root ${USER} ${USER}@${HOSTNAME} --role=author --user_pass=${USER_PASSWORD}
wp plugin update --allow-root --all

fi

#wp theme activate my-custom-theme --allow-root
#echo "define('WP_DEFAULT_THEME', 'my-custom-theme');" >> /var/www/html/wp-config.php

echo "JOB done."

/usr/sbin/php-fpm7.4 -F
#Lance à nouveau le serveur PHP-FPM en mode "foreground".
#Cela permet au conteneur de rester actif tant que PHP-FPM est en cours d'exécution.