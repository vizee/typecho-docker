FROM ubuntu:14.04
MAINTAINER vizee <vizee@live.cn>

ENV DEBIAN_FRONTEND noninteractive
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

RUN mv /etc/apt/sources.list /tmp/ && cat /tmp/sources.list | sed 's/archive.ubuntu.com/mirrors.aliyun.com/' > /etc/apt/sources.list && apt-get update

RUN apt-get install -y nginx php5-fpm supervisor php5-pgsql && rm -rf /var/lib/apt/lists/*

COPY supervisor.conf /etc/supervisor/
COPY nginx/typecho /etc/nginx/sites-available/
RUN rm -f /etc/nginx/sites-enabled/default && ln -snf /etc/nginx/sites-available/typecho /etc/nginx/sites-enabled/typecho

EXPOSE 80

CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisor.conf"]
