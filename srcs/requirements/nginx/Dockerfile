# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: qdenizar <qdenizar@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/29 10:26:13 by qdenizar          #+#    #+#              #
#    Updated: 2024/01/16 15:05:37 by qdenizar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update && \
    apt upgrade && \
    apt install vim nginx -y && \
    mkdir -p /etc/nginx/ssl && \
    apt install openssl -y && \
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj /C=FR/ST=IDF/L=Mulhouse/O=42/OU=42/CN=login.42.fr/UID=login && \
    mkdir -p /var/run/nginx
#installe Vim, Nginx, OpenSSL,
# crée un dossier pour les certificats SSL,
#-x509 c'est le type de certificat standard 
# génère un certificat auto-signé avec OpenSSL
#crée un dossier pour les fichiers de travail de Nginx.


COPY conf/nginx.conf /etc/nginx/conf.d/inception.conf

RUN chmod 755 /var/www/html && \
    chown -R www-data:www-data /var/www/html
#donne les permissions d'accès au répertoire

CMD [ "nginx", "-g", "daemon off;" ]
#L'option -g "daemon off" dans la commande CMD indique à Nginx de ne pas se détacher en arrière-plan et de rester en premier plan.
#Cela permet au processus Nginx de devenir le PID 1 du conteneur.
#Si le PID 1 s'arretete le conteneur aussi