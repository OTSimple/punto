FROM ruby:3.1.2
RUN apt-get update -yqq \
&& apt-get install -yqq --no-install-recommends nodejs postgresql-client

WORKDIR /punto

COPY Gemfile /punto/Gemfile
COPY Gemfile.lock /punto/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]