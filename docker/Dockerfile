FROM php:7.0-apache

ARG CURRENT_UID=0
ARG CURRENT_USERNAME=deploy
# Install system dependencies
RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	software-properties-common \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	libfreetype6-dev \
	libicu-dev \
  	libssl-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
	libedit-dev \
	libedit2 \
	libxslt1-dev \
	apt-utils \
  	mysql-client \
	git \
	vim \
	wget \
	curl \
	lynx \
	psmisc \
	unzip \
	tar \
	cron \
	redis-tools \
	dnsutils \
	iputils-ping \
	sudo \
	bash-completion \
	&& apt-get clean

# Install Magento Dependencies
#RUN docker-php-ext-configure \
#  	gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/; \
#  	docker-php-ext-install \
#  	opcache \
#  	gd \
#  	bcmath \
#  	intl \
#  	mbstring \
#  	mcrypt \
#  	pdo_mysql \
#  	soap \
#  	xsl \
#  	zip

#install composer
ADD tools/composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

#create user for container/host permissions
RUN echo "Prova UID: ${CURRENT_UID}"
RUN useradd -u $CURRENT_UID -g www-data -s /bin/bash ${CURRENT_USERNAME}
RUN adduser ${CURRENT_USERNAME} sudo
RUN echo "$CURRENT_UID":"$CURRENT_USERNAME" | chpasswd

#adjust www-data group id for container/host permissions
RUN groupmod -g $CURRENT_UID www-data