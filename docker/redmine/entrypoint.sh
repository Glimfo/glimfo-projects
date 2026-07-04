#!/bin/sh
set -e

echo "Initializing Glimfo Projects environment..."

# Default to port 3000 if PORT is not set (Render injects PORT dynamically)
export PORT="${PORT:-3000}"

# If the CMD is "rails server", we append the port binding so the upstream entrypoint
# still recognizes "$1" = "rails" and sets up the database.yml correctly.
if [ "$1" = 'rails' ] && [ "$2" = 'server' ]; then
    set -- rails server -b 0.0.0.0 -p "$PORT"
fi

# Call the original Redmine entrypoint to handle migrations and startup
exec /docker-entrypoint.sh "$@"
