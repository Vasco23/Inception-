all: build up

build :
		mkdir -p /home/vasco/data/wordpress /home/vasco/data/mariadb
		docker compose build

up :
	docker compose up -d

down :
	docker compose down -v


clean : down
		docker container prune --force
		docker network prune --force
		docker image prune -a --force
		docker volume prune -a --force
		docker builder prune -a --force


fclean : down clean

re: fclean all