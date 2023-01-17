FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 3000

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
    tzdata \
    build-essential \
    libssl-dev libreadline-dev zlib1g-dev \
    libsqlite3-dev \
    git \
    curl \
    libpng-dev \
    libjpeg-dev \
    libtiff-dev \
    gcc && \
    git clone https://github.com/ImageMagick/ImageMagick.git ImageMagick-7.1.0-5 && \
    /ImageMagick-7.1.0-5/configure && \
    /usr/bin/make && \
    /usr/bin/make install && \

    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv && \
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc && \
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build && \
    apt-get update && \
    ~/.rbenv/bin/rbenv install 3.1.2 && \
    ~/.rbenv/bin/rbenv global 3.1.2 && \
    apt-get install -y nodejs npm && \
    npm install n -g && \
    n 16.17.1 && \
    hash -r && \
    npm install yarn -g && \
    apt-get purge -y nodejs npm && \
    /root/.rbenv/shims/gem install rails -v 6.1.7 && \
    git clone https://github.com/dekopon21020014/bookers2

COPY ./.gitcredential /
COPY ./username.txt /
COPY ./password.txt /
COPY ./env.sh /
ENTRYPOINT ["/env.sh"]