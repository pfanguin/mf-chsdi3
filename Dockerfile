#FROM python:3.8-buster
FROM swisstopo/mf-chsdi3:base                                                                                                                                                                


ENV USE_PYTHON3=1
ENV SYSTEM_PYTHON_CMD=/usr/local/bin/python3.7
ENV OPENTRANS_API_KEY=dummy-key

ENV PROJ=chsdi
ENV VHOST=mf-${PROJ}3
ENV PROJDIR=/var/www/vhosts/${VHOST}/private/${PROJ}


WORKDIR /var/www/vhosts/${VHOST}/private/chsdi
COPY . /var/www/vhosts/${VHOST}/private/chsdi
COPY Makefile Makefile
RUN . ./rc_dev && make setup 

RUN . ./rc_dev && USE_PYTHON3=1 make code
RUN . ./rc_dev && USE_PYTHON3=1 make production.ini development.ini 
RUN . ./rc_dev && USE_PYTHON3=1 make  potomo lint fixrights doc

ENTRYPOINT ["/var/www/vhosts/mf-chsdi3/private/chsdi/docker-entrypoint.sh"]
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
