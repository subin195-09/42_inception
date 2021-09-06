FROM	debian:buster

LABEL	maintainer="skim@student.42seoul.kr"

ARG		WP_NAME=wordpress
ARG		WP_USER=skim
ARG		WP_PWD=1234
ARG		MARIADB_IP=mariadb
ARG		WP_PORT=0.0.0.0:9000

# 어떻게 mardiDb의 IP를 가져올 것인가아
RUN		apt-get update -y; \
		apt-get	upgrade -y; \
		apt-get install -y mariadb-client; \
		apt-get -y install \
		php7.3 \
		php-fpm \
		php-cli \
		wget \
		curl \
		php-mysql \
		php-mbstring \
		php-xml \
		sendmail \
		vim

VOLUME	[ "/var/www/html" ]
RUN		mkdir -p /var/www/html

RUN		wget https://wordpress.org/latest.tar.gz; \
		tar -xvf latest.tar.gz

RUN		cp -r /wordpress/* /var/www/html/

RUN		chown -R www-data:www-data /var/www/html; \
		rm -r /wordpress latest.tar.gz

# wp-config.php 파일 수정
RUN		mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php; \
		sed -i "s/database_name_here/${WP_NAME}/g" /var/www/html/wp-config.php; \
		sed -i "s/username_here/${WP_USER}/g" /var/www/html/wp-config.php; \
		sed -i "s/password_here/${WP_PWD}/g" /var/www/html/wp-config.php; \
		sed -i "s/localhost/${MARIADB_IP}/g" /var/www/html/wp-config.php

# php-fpm 설정 파일 수정
RUN		sed -i "s/run\/php\/php7.3-fpm.sock/${WP_PORT}/g" /etc/php/7.3/fpm/pool.d/www.conf

RUN		service php7.3-fpm start

# hostname -i : wordpress 컨테이너 IP주소 받아서 기억해두기
# 172.30.0.4

EXPOSE 9000

# CMD [ "php7.3-fpm", "-F", "-R" ];
