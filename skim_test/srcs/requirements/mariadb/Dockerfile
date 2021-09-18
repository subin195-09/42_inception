FROM	debian:buster

LABEL	maintainer="skim@student.42seoul.kr"

# ARG		WP_NAME=wordpress
# ARG		WP_USER=skim
# ARG		WP_PWD=1234

RUN		apt-get update -y; \
		apt-get upgrade -y; \
		apt-get -y install mariadb-server; \
		apt-get -y install dumb-init

RUN		sed -i 's/bind-address/#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# COPY	./test.sh /

# RUN		bash ./test.sh

# 설정 파일 수정
RUN		service mysql start; \
		mysql -e "CREATE DATABASE WP_NAME; \
		CREATE USER 'WP_USER'@'%' IDENTIFIED BY 'WP_PWD'; \
		GRANT ALL PRIVILEGES ON WP_NAME.* TO 'WP_USER'@'%'; \
		FLUSH PRIVILEGES;"

ENTRYPOINT [ "/usr/bin/dumb-init" ]

EXPOSE	3306

CMD		[ "mysqld" ]
