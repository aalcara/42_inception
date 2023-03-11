# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aalcara- <aalcara-@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/31 08:09:05 by aalcara-          #+#    #+#              #
#    Updated: 2023/03/07 07:29:46 by aalcara-         ###   ########.fr        #
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

up:
	${SRC} && docker-compose up

down:
	${SRC} && docker-compose down

re: fclean build up

fclean: down
	sudo mv ./hosts_bkp /etc/hosts
	docker system prune -a --volumes