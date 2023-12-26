## EXAMPLE 1 
# Default bridge network

START MYSQL SERVER WITH CUSTOM ROOT PASSWORD
docker run -e MYSQL_ROOT_PASSWORD=pass1234 mysql:5.7

START PHPMYADMIN WITH PMA_HOST VARIABLE (over IP address)
docker run -p 8080:80 -e PMA_HOST=ip phpmyadmin



## EXAMPLE 2 
# custom mynet network

START MYSQL SERVER WITH CUSTOM ROOT PASSWORD
docker run -d \
	--name mysql-server \
	-e MYSQL_ROOT_PASSWORD=pass1234 \
	--network mynet \
	mysql:5.7

START PHPMYADMIN WITH PMA_HOST VARIABLE (hostname via dns)
docker run -d\
	-p 8080:80 \
	-e PMA_HOST=mysql-server \
	phpmyadmin



## EXAMPLE 3
# custom mynet network

start mysql container
docker run -d \
	--name mysql-server \
	-e MYSQL_ROOT_PASSWORD=pass1234 \
	-e MYSQL_DATABASE=mydb \
	-e MYSQL_USER=khan \
	-e MYSQL_PASSWORD=password \
	--network mynet \
	mysql:5.7

START PHPMYADMIN WITH PMA_HOST VARIABLE (hostname via dns)
docker run -d\
	-p 8080:80 \
	-e PMA_HOST=mysql-server \
	--network mynet
	phpmyadmin
	
start wordpress
docker run -d \ 
	-e WORDPRESS_DB_HOST=mysql-server \ 
	-e WORDPRESS_DB_USER=khan \ 
	-e WORDPRESS_DB_PASSWORD=password \ 
	-e WORDPRESS_DB_NAME=mydb \ 
	-p 8090:80 \ 
	--network mynet \ 
	wordpress:6.4
	
docker run -d -e WORDPRESS_DB_HOST=mysql-server -e WORDPRESS_DB_USER=khan -e WORDPRESS_DB_PASSWORD=password -e WORDPRESS_DB_NAME=mydb -p 8090:80 --network mynet wordpress:6.4


