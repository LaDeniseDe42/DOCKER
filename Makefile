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
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

# Cibles
all: build up

build:
	@sudo $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build

up:
	@sudo mkdir -p /home/qdenizar/data/wordpress
	@sudo mkdir -p /home/qdenizar/data/mariadb
	@sudo $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d

down:
	@sudo $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

restart:
	@sudo $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) restart

logs:
	@sudo $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) logs -f

ps:
	@sudo $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) ps

clean: down
	@sudo $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) rm -f

.PHONY: all build up down restart logs ps clean
