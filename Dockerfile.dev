FROM ruby:2.4.1
RUN mkdir /make-it-rain

COPY Gemfile* /tmp/
WORKDIR /tmp

# use a local bundle path for gem inspections
ENV BUNDLE_PATH /make-it-rain/.bundle

# add /bin to PATH
ENV BUNDLE_BIN=/make-it-rain/.bundle/bin
ENV PATH $BUNDLE_BIN:$PATH

WORKDIR /make-it-rain
ADD . /make-it-rain

ENTRYPOINT puma -p 3000
