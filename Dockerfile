FROM ubuntu:focal

ENV TZ=Europe/Warsaw
ARG DEBIAN_FRONTEND=noninteractive

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y --no-install-recommends install \
    net-tools openssh-client nano vim-tiny iputils-ping make git curl unzip \
    php7.4 php7.4-ldap php7.4-pgsql php7.4-xmlrpc php7.4-mbstring php7.4-curl php7.4-intl php7.4-dev php-pear \
    python3 python3-postgresql python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install nodejs
RUN node --version
RUN npm install -g yarn

RUN pip3 install awscli

RUN curl -fsSL https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

VOLUME [ "/root" ]
CMD [ "sh", "-c", "cd; exec bash -i" ]


