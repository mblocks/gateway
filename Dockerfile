FROM kong:alpine

ADD mine.type /usr/local/kong/mine.type
ADD nginx-custom.conf /usr/local/kong/nginx-custom.conf
ADD scripts /home/kong/scripts
USER root
RUN chmod -R +x /home/kong/scripts
USER 1000

RUN luarocks install kong-plugin-redis-auth 0.2.0
RUN sed -i "19 a include 'nginx-custom.conf';" /usr/local/share/lua/5.1/kong/templates/nginx.lua
RUN /home/kong/scripts/download.sh mblocks/portal portal && \
    /home/kong/scripts/download.sh mblocks/admin admin && \
    /home/kong/scripts/download.sh mblocks/drive-frontend drive

