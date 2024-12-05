FROM node:23

RUN set -ex ; \
    apt-get update ; \
    apt-get install -y fonts-noto-cjk ; \
    rm -rf /var/lib/apt/lists/*

RUN set -ex ; \
    npm install --silent -g markdown-pdf@7.0.0 ; \
    rm -rf ~/.npm/cache/* ; \
    mkdir -p /opt/docs

WORKDIR /opt/docs

COPY fonts.conf /etc/fonts/conf.d/99-local.conf

ENV NODE_PATH=/usr/local/lib/node_modules

CMD ["/bin/bash"]
