

all:
	mkdir -p /home/vcacador/data/wordpress/;
	mkdir -p /home/vcacador/data/mariadb/;
	docker compose -f /home/vcacador/Desktop/Inception/srcs/docker-compose.yaml up -d --build > /dev/null
down:
	docker compose -f ./srcs/docker compose.yaml down > /dev/null

re: fclean all

fclean: clean
	sudo rm -rf /home/vcacador/data;

clean:
	if [ -n "$$(docker ps -aq)" ]; then docker rm -f $$(docker ps -aq) > /dev/null; fi
	docker system prune -a -f --volumes > /dev/null
	if [ -n "$$(docker volume ls -q)" ]; then docker volume rm $$(docker volume ls -q) > /dev/null; fi
	