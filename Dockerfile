FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential
RUN mkdir /shusshar
WORKDIR /shusshar
ADD Gemfile /shusshar/Gemfile
ADD Gemfile.lock /shusshar/Gemfile.lock
RUN bundle install
ADD . /shusshar

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
