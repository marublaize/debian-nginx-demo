FROM debian:bullseye-slim

LABEL MAINTAINER=thiago.magalhaes@gmail.com

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    gnupg \
    ca-certificates \
    curl \
    netbase \
    wget \
    git \
    openssh-client \
    procps \
    sudo \
    gettext-base \
    nginx
RUN rm -rf /var/lib/apt/lists/*

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80
STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]