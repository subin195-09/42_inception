FROM	debian:buster

LABEL	maintainer="skim@student.42seoul.kr"

COPY	./conf/default /

RUN		apt-get update -y; apt-get upgrade -y; \
		apt-get install -y nginx openssl vim

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=skim/CN=localhost" \
		-keyout /etc/ssl/private/server_pkey.pem -out /etc/ssl/certs/server.crt;

# default file 수정
RUN		cp /default /etc/nginx/sites-available/default;

EXPOSE	443

CMD 	["nginx", "-g", "daemon off;"]
