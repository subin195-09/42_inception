# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: skim <skim@student.42seoul.kr>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/15 23:36:33 by skim              #+#    #+#              #
#    Updated: 2021/09/18 19:42:36 by skim             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC_DIR = ./srcs
COMPOSE = docker-compose
YML = docker-compose.yaml
RUN_COM = $(COMPOSE) -f $(SRC_DIR)/$(YML)

all: up

up:
	$(RUN_COM) up -d

build:
	$(RUN_COM) build

restart:
	$(RUN_COM) restart

ps:
	$(RUN_COM) ps

port:
	$(RUN_COM) port

down:
	$(RUN_COM) down

down_rmi:
	$(RUN_COM) down --rmi all

clear:
	./$(SRC_DIR)/requirements/tools/clear.sh
