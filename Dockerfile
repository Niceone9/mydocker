FROM php:7.2-fpm
#安装相关依赖
RUN  apt-get update \
	&& apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
	libpcre3-dev \
	git \
	libpq-dev \
#安装扩展
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc)  gd \
	&& docker-php-ext-install  mysqli pdo pdo_mysql pdo_pgsql
#	&& docker-php-ext-install PDO \
#	&& docker-php-ext-install pdo_mysql \
#	&& docker-php-ext-install pdo_pgsql \
#	&& docker-php-ext-install mysqli
#CMD ["/us/local/bin/php","-m"]
