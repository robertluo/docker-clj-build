FROM renewdoit/docker-alpine-java:server-jre8 
MAINTAINER renewdoit

ENV LEIN_ROOT true
ENV BOOT_AS_ROOT yes
ENV BOOT_EMIT_TARGET no
ENV BOOT_VERSION 2.7.1

RUN \
    cd /usr/local/bin; \
    curl -fsSLo lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein; \
    chmod a+x lein; \
    lein;
RUN \
    cd /usr/local/bin; \
    curl -fsSLo boot https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh; \
    chmod a+x boot; \ 
    boot web -s doesnt/exist repl -e '(System/exit 0)'; 

COPY profile.boot /root/.boot
