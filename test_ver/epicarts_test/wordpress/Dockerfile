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
		php-mysql \
		vim \
		dumb-init

RUN		mkdir -p /var/www/html

RUN		wget https://wordpress.org/latest.tar.gz; \
		tar -xvf latest.tar.gz

RUN		cp -r /wordpress/* /var/www/html/; \
		rm -rf /wordpress /latest.tar.gz

RUN		chown -R www-data:www-data /var/www/html

# wp-config.php 파일 수정
RUN		mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php; \
		sed -i "s/database_name_here/${WP_NAME}/g" /var/www/html/wp-config.php; \
		sed -i "s/username_here/${WP_USER}/g" /var/www/html/wp-config.php; \
		sed -i "s/password_here/${WP_PWD}/g" /var/www/html/wp-config.php; \
		sed -i "s/localhost/${MARIADB_IP}/g" /var/www/html/wp-config.php

# php-fpm 설정 파일 수정
# / 생기는거 수정 해야함
RUN		echo "listen = ${WP_PORT}" >> /etc/php/7.3/fpm/pool.d/www.conf; \
		sed -i "s/;daemonize = yes/daemonize = no/g" /etc/php/7.3/fpm/php-fpm.conf

RUN		mkdir -p /run/php

ENTRYPOINT	["/usr/bin/dumb-init"]

EXPOSE 9000

CMD [ "/usr/sbin/php-fpm7.3" ]
