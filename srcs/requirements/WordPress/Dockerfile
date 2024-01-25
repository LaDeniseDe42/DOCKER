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
 #   apt-get -y install wget && \
 #   apt-get install -y php7.3 php-fpm php-mysql mariadb-client
    
#RUN wget https://fr.wordpress.org/wordpress-6.4.2-fr_FR.tar.gz -P /var/www && \
  #  cd /var/www && tar -xzf wordpress-6.4.2-fr_FR.tar.gz && rm wordpress-6.4.2-fr_FR.tar.gz && \
 #   chown -R root:root /var/www/wordpress

#COPY conf/wp-config.php /var/www/html/wp-config-sample.php
#COPY conf/hosts /etc/hosts

#RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
 #   chmod +x wp-cli.phar && \
 #   mv wp-cli.phar /usr/local/bin/wp
#
# Définir le répertoire de travail
#WORKDIR /var/www/wordpress

# Commande par défaut pour lancer PHP-FPM
#CMD ["php-fpm"]
WORKDIR	/var/www/html

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar  && \
	wget https://fr.wordpress.org/wordpress-6.4.2-fr_FR.tar.gz && \
	tar -xvf wordpress-6.4.2-fr_FR.tar.gz && \
	cp -rf wordpress/* . && \
	rm -rf wordpress wordpress-6.4.2-fr_FR.tar.gz && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY	conf/wp-autoconfig.sh ./wp-autoconfig.sh

RUN	mkdir -p /run/php/ && \
	chmod +x wp-autoconfig.sh 

CMD ["/bin/bash", "/var/www/html/wp-autoconfig.sh"] 