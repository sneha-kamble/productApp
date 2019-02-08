FROM ruby:2.4
RUN apt-get update
RUN apt-get -y install sudo
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN apt-get -y install nodejs
RUN npm install webpack -g
RUN npm install --save-dev webpack-cli
RUN apt-get -y install default-libmysqlclient-dev
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get -y install curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev yarn
COPY . ./productApp
WORKDIR /productApp
ADD . /productApp
RUN bundle install
RUN rake db:create
Run rake db:migrate
CMD rails s
