FROM kong:alpine

USER 1000

RUN sed -i "19 a include 'nginx-custom.conf';" /usr/local/share/lua/5.1/kong/templates/nginx.lua
ADD nginx-custom.conf /usr/local/kong/nginx-custom.conf
ADD scripts /home/kong/scripts

