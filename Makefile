# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aalcara- <aalcara-@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/31 08:09:05 by aalcara-          #+#    #+#              #
#    Updated: 2023/03/31 15:56:42 by aalcara-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC = cd srcs/
DOMAIN = 127.0.0.1       aalcara-.42.fr
LOOKDOMAIN = $(shell grep "${DOMAIN}" /etc/hosts)

all: hosts build up

build: hosts
	${SRC} && docker-compose build
	sudo mkdir -p /home/aalcara-/data/database
	sudo mkdir -p /home/aalcara-/data/wordpress

up:
	${SRC} && docker-compose up -d

hosts:
	@if [ "${DOMAIN}" = "${LOOKDOMAIN}" ]; then \
		echo "Host already set"; \
	else \
		cp /etc/hosts ./hosts_bkp; \
		sudo rm /etc/hosts; \
		sudo cp ./srcs/requirements/tools/hosts /etc/hosts; \
	fi

down:
	${SRC} && docker-compose down

re: fclean build up

fclean: down
	sudo mv ./hosts_bkp /etc/hosts || echo "hosts_bkp does not exist"
	docker system prune -a --volumes
	# TODO: limpar volumes
