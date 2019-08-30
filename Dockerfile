FROM ruby:2.5.3

WORKDIR /app
COPY . /app

RUN gem install bundler
RUN bundle install

CMD puma -p 5500
EXPOSE 5500
