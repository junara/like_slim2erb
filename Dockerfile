FROM ruby:2.6.0
ENV LANG C.UTF-8
RUN apt-get update -qq &&\
    apt-get install -y curl zip &&\
    curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh &&\
    bash nodesource_setup.sh &&\
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - &&\
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list &&\
    apt-get update -qq &&\
    apt-get install -y --no-install-recommends nodejs &&\
    apt-get install -y --no-install-recommends yarn &&\
    apt-get install -y --no-install-recommends \
            build-essential libpq-dev libfontconfig1 libpq-dev postgresql-client imagemagick &&\
    rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app
COPY Gemfile ./
COPY Gemfile.lock ./
RUN bundle config build.nokogiri --use-system-libraries &&\
    bundle install
COPY package.json ./
COPY . /app
