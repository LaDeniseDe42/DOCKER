# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: qdenizar <qdenizar@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/29 10:26:21 by qdenizar          #+#    #+#              #
#    Updated: 2024/01/05 14:21:14 by qdenizar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update -y && \
    apt upgrade -y && \
    apt-get install mariadb-server -y 

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/setup_mysql.sh /tools/setup_mysql.sh

RUN chmod +x /tools/setup_mysql.sh && \
    /tools/setup_mysql.sh

CMD ["mysqld"]