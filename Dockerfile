# https://blog.codeship.com/running-rails-development-environment-docker/


FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# Install latest Yarn and Nodejs
RUN apt-get install -y curl software-properties-common gcc g++ make
RUN bash -lc "curl -sL https://deb.nodesource.com/setup_8.x | bash -"
RUN bash -lc "curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -"
RUN bash -lc "echo 'deb https://dl.yarnpkg.com/debian/ stable main' | tee /etc/apt/sources.list.d/yarn.list"

RUN apt-get update && apt-get install -y yarn nodejs

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
RUN mkdir -p /app
WORKDIR /app

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the main application.
COPY . ./

# Expose port 3000 to the Docker host, so we can access it
# from the outside.
EXPOSE 3000

# Configure an entry point, so we don't need to specify
# "bundle exec" for each of our commands.
ENTRYPOINT ["bundle", "exec"]

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
# CMD ["rails", "server", "-b", "0.0.0.0"]
