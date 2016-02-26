FROM java:8 
MAINTAINER renewdoit

ENV LEIN_ROOT true
ENV BOOT_AS_ROOT yes

RUN \
    cd /usr/local/bin; \
    curl -fsSLo lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein; \
    curl -fsSLo boot https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh; \
    chmod a+x lein boot; \
    lein; \
    boot;
