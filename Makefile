# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <user42@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/31 08:09:05 by aalcara-          #+#    #+#              #
#    Updated: 2023/03/29 17:19:48 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC = cd srcs/

all: build up

build:
	${SRC} && docker-compose build
	cp /etc/hosts ./hosts_bkp
	# TODO:corrigir o hosts
	sudo rm /etc/hosts
	sudo cp ./srcs/requirements/tools/hosts /etc/hosts
	sudo mkdir -p /home/aalcara-/data/database
	sudo mkdir -p /home/aalcara-/data/wordpress

up:
	${SRC} && docker-compose up

down:
	${SRC} && docker-compose down

re: fclean build up

fclean: down
	sudo mv ./hosts_bkp /etc/hosts
	docker system prune -a --volumes
