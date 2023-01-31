# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aalcara- <aalcara-@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/31 08:09:05 by aalcara-          #+#    #+#              #
#    Updated: 2023/01/31 08:20:19 by aalcara-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = inception
SRC = cd srcs/


all: $(NAME)

$NAME: build up

build:
	${SRC} && docker-compose build

up:
	${SRC} && docker-compose up

down:
	${SRC} && docker-compose down

re: down build up

execbash:
	docker exec -it nginx bash