FROM renewdoit/docker-alpine-java:jdk8
MAINTAINER renewdoit

ENV LEIN_ROOT true
ENV BOOT_AS_ROOT yes
ENV BOOT_EMIT_TARGET no
ENV BOOT_VERSION 2.8.2
ENV BOOT_JVM_OPTIONS "-client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none -XX:-OmitStackTraceInFastThrow"
ENV CLJ_VERSION 1.10.0.411

RUN \
  apk add --no-cache py-pip && pip install docker-compose

RUN \
  apk add --no-cache curl openssh-client

RUN \
  cd /usr/local/bin; \
  curl -fsSLo lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein; \
  chmod a+x lein; \
  lein;
RUN \
  curl -O https://download.clojure.org/install/linux-install-${CLJ_VERSION}.sh; \
  chmod +x linux-install-${CLJ_VERSION}.sh; \
  ./linux-install-${CLJ_VERSION}.sh; \
  clojure;
RUN \
  cd /usr/local/bin; \
  curl -fsSLo boot https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh; \
  chmod a+x boot; \
  boot web -s doesnt/exist repl -e '(System/exit 0)';
COPY profile.boot /root/.boot
COPY entry-point.sh /
COPY .ssh /root/.ssh
ENTRYPOINT ["/entry-point.sh"]
