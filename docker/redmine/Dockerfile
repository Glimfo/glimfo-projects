FROM redmine:6.1-alpine

# Install build dependencies for native extensions
# hadolint ignore=DL3018
RUN apk add --no-cache build-base git postgresql-dev tzdata nodejs npm && \
    echo "gem 'omniauth-google-oauth2'" >> Gemfile.local && \
    echo "gem 'omniauth-github'" >> Gemfile.local && \
    bundle config set --local without 'development test' && \
    bundle install && \
    mkdir -p /usr/src/redmine/public/themes/glimfo

# Copy initialization script
COPY docker/redmine/entrypoint.sh /docker-entrypoint-custom.sh
RUN sed -i 's/\r$//' /docker-entrypoint-custom.sh && \
    chmod +x /docker-entrypoint-custom.sh

ENTRYPOINT ["/docker-entrypoint-custom.sh"]
CMD ["rails", "server"]

