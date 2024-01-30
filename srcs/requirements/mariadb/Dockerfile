# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: qdenizar <qdenizar@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/29 10:26:21 by qdenizar          #+#    #+#              #
#    Updated: 2024/01/16 15:05:29 by qdenizar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN	apt update -y && \
	apt upgrade -y && \
	apt install vim mariadb-server -y

RUN mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld
# crée un dossier et donne à l'utilisateur MySQL les droits sur ce répertoire.

COPY	conf/mariadb.cnf /etc/mysql/mariadb.cnf
COPY	tools/setup.sh /etc/mysql/setup.sh
#Copie les fichiers dans le conteneur

RUN	chmod +x /etc/mysql/setup.sh  
#donne les droits d'exécution au fichier setup.sh

ENTRYPOINT ["/bin/bash", "/etc/mysql/setup.sh"]
#Exécute le script setup.sh en utilisant /bin/bash au lancement du conteneur

CMD ["mysqld", "--bind-address=0.0.0.0"]
#Donen l'autorisation a toutes les adresse ip de se conneceter