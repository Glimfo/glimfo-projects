#!/bin/sh
set -e

# Custom initializations for Glimfo Redmine can go here
echo "Initializing Glimfo Projects environment..."

# Call the original Redmine entrypoint to handle migrations and startup
exec /docker-entrypoint.sh "$@"
