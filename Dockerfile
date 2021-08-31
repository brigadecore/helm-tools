FROM debian:bullseye

ENV HELM_VERSION=v3.7.0-rc.1
ENV HELM_EXPERIMENTAL_OCI=1

RUN buildDeps="curl" \
  && apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y --no-install-recommends \
    $buildDeps \
    ca-certificates \
    git \
    make \
  && cd /usr/local/bin \
  && curl https://get.helm.sh/helm-$HELM_VERSION-linux-amd64.tar.gz | tar xvz linux-amd64/helm --strip-components=1 \
  && apt-get purge -y --auto-remove $buildDeps \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
