# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: qdenizar <qdenizar@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/29 10:26:13 by qdenizar          #+#    #+#              #
#    Updated: 2024/01/05 14:18:11 by qdenizar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update && \
    apt upgrade && \
    apt install nginx -y && \
    apt install openssl -y && \
    mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj /C=FR/ST=IDF/L=Mulhouse/O=42/OU=42/CN=login.42.fr/UID=login && \
    mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]