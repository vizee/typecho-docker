FROM ubuntu:16.04
MAINTAINER vizee <vizee@live.cn>

ENV DEBIAN_FRONTEND noninteractive
RUN mv /etc/apt/sources.list /tmp/ && cat /tmp/sources.list | sed 's/archive.ubuntu.com/mirrors.aliyun.com/' > /etc/apt/sources.list && apt-get update
RUN apt-get install -y tzdata supervisor nginx php-fpm php-xml php-pgsql && rm -rf /var/lib/apt/lists/*

RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

COPY supervisor.conf /etc/supervisor/
COPY nginx/typecho /etc/nginx/sites-available/
RUN rm -f /etc/nginx/sites-enabled/default && ln -snf /etc/nginx/sites-available/typecho /etc/nginx/sites-enabled/typecho
RUN mkdir -p /run/php

EXPOSE 80

CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisor.conf"]
