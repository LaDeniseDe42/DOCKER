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

#RUN apt update -y && \
 #   apt upgrade -y && \
   # apt-get install mariadb-server -y 

#COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
#COPY tools/setup_mysql.sh /tools/setup_mysql.sh

#RUN chmod +x /tools/setup_mysql.sh && \
 #   /tools/setup_mysql.sh

#CMD ["mysqld"]

RUN	apt update -y && \
	apt upgrade -y && \
	apt install vim mariadb-server -y

RUN mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld

COPY	conf/mariadb.cnf /etc/mysql/mariadb.cnf
COPY	tools/setup.sh /etc/mysql/setup.sh

RUN	chmod +x /etc/mysql/setup.sh

ENTRYPOINT ["/bin/bash", "/etc/mysql/setup.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]