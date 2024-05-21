# Base image for Ruby on Rails development
FROM ruby:3.1.2-slim

# Install dependencies for building Rails app
RUN apt-get update && \
    apt-get install -y build-essential libpq-dev curl

# Set working directory for the application
WORKDIR /app

# Copy Gemfile and Gemfile.lock (replace with your actual files)
COPY Gemfile Gemfile.lock ./

# Install Rails gems
RUN bundle install

# Copy your Rails application code (replace with your actual code)
COPY . ./

# Expose Rails port (default for development is 3000)
EXPOSE 3000

# Command to start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
