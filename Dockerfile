FROM ruby:2.4.1
RUN mkdir /make-it-rain

RUN apt-get update && apt-get -y upgrade openssl

COPY Gemfile* /tmp/
WORKDIR /tmp

ENV BUNDLE_PATH /make-it-rain/.bundle

WORKDIR /make-it-rain
ADD . /make-it-rain

ENTRYPOINT puma -p 3000
