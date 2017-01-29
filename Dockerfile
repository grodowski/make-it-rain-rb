FROM ruby:2.3.3
RUN mkdir /make-it-rain

COPY Gemfile* /tmp/
WORKDIR /tmp
RUN bundle install

WORKDIR /make-it-rain
ADD . /make-it-rain
