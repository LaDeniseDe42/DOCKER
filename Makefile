# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: qdenizar <qdenizar@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/29 10:25:49 by qdenizar          #+#    #+#              #
#    Updated: 2024/01/05 14:00:32 by qdenizar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Variables
DOCKER_COMPOSE = docker-compose
FILE = srcs/docker-compose.yml

# Cibles
all: build up

build:
	@sudo docker-compose -f $(FILE) build

up:
	@sudo mkdir -p /home/qdenizar/data/wordpress
	@sudo mkdir -p /home/qdenizar/data/mariadb
	@sudo docker-compose -f $(FILE) up -d

down:
	@sudo docker-compose -f $(FILE) down

restart:
	@sudo docker-compose -f $(FILE) restart

logs:
	@sudo docker-compose -f $(FILE) logs -f

ps:
	@sudo docker-compose -f $(FILE) ps

clean: down
	@sudo rm -rf /home/ngalzand/data/wordpress/*
	@sudo rm -rf /home/ngalzand/data/mariadb/*
	@sudo docker-compose -f $(FILE) rm -f
	@sudo docker system prune -f

.PHONY: all build up down restart logs ps clean
