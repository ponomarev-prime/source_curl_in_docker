FROM alpine:latest

# Установка зависимостей для сборки
RUN apk add --no-cache \
    build-base \
    autoconf \
    automake \
    libtool \
    pkgconfig \
    openssl-dev \
    nghttp2-dev \
    zlib-dev \
    curl-dev

# Скачиваем исходный код curl и собираем
RUN wget https://curl.se/download/curl-8.3.0.tar.gz && \
    tar -xzf curl-8.3.0.tar.gz && \
    cd curl-8.3.0 && \
    ./configure --with-ssl --with-nghttp2 --prefix=/usr && \
    make && \
    make install

# Проверяем установленный curl
RUN curl --version
