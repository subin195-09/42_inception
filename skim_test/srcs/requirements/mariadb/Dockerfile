FROM	debian:buster

LABEL	maintainer="skim@student.42seoul.kr"

RUN		apt-get update -y; \
		apt-get upgrade -y; \
		apt-get -y install mariadb-server; \
		apt-get -y install dumb-init

COPY	./set_up.sh /
RUN		chmod 777 /set_up.sh

ENTRYPOINT [ "/usr/bin/dumb-init" ]

EXPOSE	3306

CMD		[ "/set_up.sh" ]