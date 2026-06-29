#!/bin/bash
# Restore script for Glimfo Redmine
# Usage: ./restore.sh <db_backup_file.sql.gz> <files_backup_file.tar.gz>

set -e

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <db_backup_file.sql.gz> <files_backup_file.tar.gz>"
    exit 1
fi

DB_BACKUP=$1
FILES_BACKUP=$2

if [ ! -f "$DB_BACKUP" ]; then
    echo "Database backup file not found: $DB_BACKUP"
    exit 1
fi

if [ ! -f "$FILES_BACKUP" ]; then
    echo "Files backup file not found: $FILES_BACKUP"
    exit 1
fi

echo "Restoring database from $DB_BACKUP..."
# Note: Dropping schema assumes the user has rights and schema is public.
docker exec -i glimfo_postgres psql -U redmine -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"
gunzip -c "$DB_BACKUP" | docker exec -i glimfo_postgres psql -U redmine

echo "Restoring files from $FILES_BACKUP..."
docker run --rm \
  --volumes-from glimfo_redmine \
  -v $(dirname "$(realpath "$FILES_BACKUP")"):/backup_dir \
  alpine tar -xzvf /backup_dir/$(basename "$FILES_BACKUP") -C /usr/src/redmine/files

echo "Restore complete! Restarting Redmine..."
docker restart glimfo_redmine
