FROM ruby:alpine3.16

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN apk apk update
RUN apk add make

RUN apk add --update alpine-sdk

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME

EXPOSE 8000

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "8000"]
