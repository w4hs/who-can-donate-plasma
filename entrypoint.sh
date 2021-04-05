#!/bin/sh

set -

echo "Running on: $RAILS_ENV"

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

bin/rails db:migrate

bin/rails assets:clean

bin/rails assets:precompile

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"