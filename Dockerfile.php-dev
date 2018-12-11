FROM lovullo/deb-ci:bionic

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive  apt-get install -y \
        php-dev \
        re2c && \
    rm -rf /var/lib/apt/lists/*