FROM redmine:5.1-alpine

# Install build dependencies for native extensions
RUN apk add --no-cache build-base git postgresql-dev tzdata nodejs npm

# Add OmniAuth gems for GitHub and Google authentication
RUN echo "gem 'omniauth-google-oauth2'" >> Gemfile.local && \
    echo "gem 'omniauth-github'" >> Gemfile.local && \
    echo "gem 'redmine_omniauth_google'" >> Gemfile.local && \
    echo "gem 'redmine_omniauth_github'" >> Gemfile.local

RUN bundle install --without development test

# Copy custom configuration files (we will mount these or copy them)
# To avoid build failure if they don't exist locally, we create placeholders
RUN mkdir -p /usr/src/redmine/public/themes/glimfo

# Copy initialization script
COPY docker/redmine/entrypoint.sh /docker-entrypoint-custom.sh
RUN chmod +x /docker-entrypoint-custom.sh

ENTRYPOINT ["/docker-entrypoint-custom.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
