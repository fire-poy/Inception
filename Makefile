all :
	mkdir -p /home/epresa/data/wordpress
	mkdir -p /home/epresa/data/mariadb
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
	rm -rf /home/epresa/data/wordpress
	sudo rm -rf /home/epresa/data/mariadb
	docker system prune -f

.PHONY: up build stop restart remove down fclean
