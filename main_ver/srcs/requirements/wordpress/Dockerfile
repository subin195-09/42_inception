FROM	debian:buster

LABEL	maintainer="skim@student.42seoul.kr"

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

COPY	./tools/set_up.sh /

RUN		chmod 777 /set_up.sh

RUN		mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php; \
		echo "listen = 0.0.0.0:9000" >> /etc/php/7.3/fpm/pool.d/www.conf; \
		sed -i "s/;daemonize = yes/daemonize = no/g" /etc/php/7.3/fpm/php-fpm.conf

RUN		mkdir -p /run/php

ENTRYPOINT	["/usr/bin/dumb-init"]

EXPOSE 9000

CMD [ "/set_up.sh" ]
