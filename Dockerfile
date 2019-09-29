FROM ngxmrubypackagebuilder_ubuntu1804:latest AS builder

FROM ubuntu:18.04

COPY --from=builder /usr/local/src/nginx*.deb /tmp/

# for Japan
RUN sed -i.bak -e "s%http://[^ ]\\+%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list

RUN apt-get update \
  && apt-get upgrade --yes --no-install-recommends \
  && apt-get install --yes --no-install-recommends \
  ca-certificates \
  curl \
  gnupg2 \
  lsb-release \
  && echo "deb http://nginx.org/packages/ubuntu $(lsb_release -cs) nginx" \
     | tee /etc/apt/sources.list.d/nginx.list \
  && curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add - \
  && apt-get update \
  && apt-get install --yes --no-install-recommends \
  nginx \
  && apt install --yes /tmp/nginx*.deb \
  && rm --recursive --force /var/lib/apt/lists/* \
  && ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log

# disable default.conf config
COPY conf/default.conf /etc/nginx/conf.d/default.conf
# custom config
COPY conf/my-nginx.conf /etc/nginx/conf.d/my-nginx.conf

EXPOSE 80
EXPOSE 443

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
