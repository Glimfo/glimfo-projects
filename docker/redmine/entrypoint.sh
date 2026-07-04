#!/bin/sh
set -e

echo "Initializing Glimfo Projects environment..."

# Default to port 3000 if PORT is not set (Render injects PORT dynamically)
export PORT="${PORT:-3000}"

# Call the original Redmine entrypoint to handle migrations and startup
exec /docker-entrypoint.sh "$@"
