# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aalcara- <aalcara-@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/31 08:09:05 by aalcara-          #+#    #+#              #
#    Updated: 2023/02/10 10:15:07 by aalcara-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC = cd srcs/

all: build up

build:
	${SRC} && docker-compose build
	cp /etc/hosts ./hosts_bkp
	sudo rm /etc/hosts
	sudo cp ./srcs/requirements/tools/hosts /etc/hosts

up: build
	${SRC} && docker-compose up

down:
	${SRC} && docker-compose down

re: down up

execbash:
	docker exec -it nginx bash

fclean: down
	sudo mv ./hosts_bkp /etc/hosts
	docker system prune -a