# Variables
FILE = srcs/docker-compose.yml

# Cibles
all: build up

build:
	@sudo docker-compose -f $(FILE) build

up:
	@sudo mkdir -p /home/qdenizar/data/WordPress
	@sudo mkdir -p /home/qdenizar/data/mariadb
	@sudo docker-compose -f $(FILE) up -d

down:
	@sudo docker-compose -f $(FILE) down

restart:
	@sudo docker-compose -f $(FILE) restart

logs:
	@sudo docker-compose -f $(FILE) logs

ps:
	@sudo docker-compose -f $(FILE) ps

clean: down
	@sudo rm -rf /home/qdenizar/data/wordpress/*
	@sudo rm -rf /home/qdenizar/data/mariadb/*
	@sudo docker-compose -f $(FILE) rm -f
	@sudo docker system prune -f

.PHONY: all build up down restart logs ps clean
