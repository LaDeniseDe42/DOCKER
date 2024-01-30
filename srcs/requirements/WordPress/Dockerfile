# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: qdenizar <qdenizar@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/29 10:26:17 by qdenizar          #+#    #+#              #
#    Updated: 2024/01/16 13:51:34 by qdenizar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y vim wget php7.4 php7.4-fpm php7.4-mysqli php7.4-gd && \
	sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|g" /etc/php/7.4/fpm/pool.d/www.conf
# installe plusieurs paquets (Vim, Wget, PHP et ses extensions)
#modifie la configuration de PHP-FPM pour écouter sur le port 9000 au lieu du socket par défaut.


WORKDIR	/var/www/html

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar  && \
	wget https://fr.wordpress.org/wordpress-6.4.2-fr_FR.tar.gz && \
	tar -xvf wordpress-6.4.2-fr_FR.tar.gz && \
	cp -rf wordpress/* . && \
	rm -rf wordpress wordpress-6.4.2-fr_FR.tar.gz && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp
#Yélécharge WP-CLI (un outil en ligne de commande pour WordPress), la version française de WordPres,
#puis la décompresse dans le répertoire de travail,
# copie son contenu à la racine du serveur web,
# supprime les fichiers téléchargés, donne des permissions d'exécution à WP-CLI
#et le déplace dans le répertoire /usr/local/bin/ pour qu'il soit accessible globalement.

COPY	conf/wp-autoconfig.sh ./wp-autoconfig.sh

RUN	mkdir -p /run/php/ && \
	chmod +x wp-autoconfig.sh
#crée le répertoire /run/php/ et donne les droits d'exécution au script wp-autoconfig.sh.

COPY conf/my-custom-theme/ /var/www/html/wp-content/themes/my-custom-theme/

CMD ["/bin/bash", "/var/www/html/wp-autoconfig.sh"]
#lance le script wp-autoconfig.sh