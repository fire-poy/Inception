all :
	mkdir -p $(HOME)/data/wordpress
	mkdir -p $(HOME)/data/mariadb
	make up

up :
	docker-compose -f ./srcs/docker-compose.yml up -d

build :
	docker-compose -f ./srcs/docker-compose.yml -d build

stop :
	docker-compose -f ./srcs/docker-compose.yml stop

restart :
	docker-compose -f ./srcs/docker-compose.yml restart

remove :
	docker-compose -f ./srcs/docker-compose.yml rm

down :
	docker-compose -f ./srcs/docker-compose.yml down --volumes --rmi all

fclean : down
	sudo rm -rf $(HOME)/data/wordpress
	sudo rm -rf $(HOME)/data/mariadb
	docker system prune -f

re : fclean all

.PHONY: up build stop restart remove down fclean re
