FROM ruby:2.5.3

RUN gem install bundler

WORKDIR /app
COPY ./Gemfile /app
COPY ./Gemfile.lock /app
RUN bundle install

COPY . /app

CMD puma -p 5500
EXPOSE 5500
