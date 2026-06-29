#!/bin/bash
# Backup script for Glimfo Redmine
# Should be run via cron, e.g. daily at 2am
# 0 2 * * * /path/to/scripts/backup.sh >> /var/log/redmine_backup.log 2>&1

set -e

BACKUP_DIR="/var/backups/glimfo_projects"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
POSTGRES_CONTAINER="glimfo_postgres"
COMPOSE_PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

mkdir -p "$BACKUP_DIR"

echo "Starting backup at $DATE"

# Backup Database
echo "Backing up PostgreSQL database..."
docker exec -t $POSTGRES_CONTAINER pg_dumpall -c -U redmine | gzip > "$BACKUP_DIR/db_backup_$DATE.sql.gz"

# Backup Files
echo "Backing up Redmine uploaded files..."
# Assuming volume is managed by compose, find the exact path or mount
# A safer way to backup volumes is using a temporary container attached to it
docker run --rm \
  --volumes-from glimfo_redmine \
  -v $BACKUP_DIR:/backup \
  alpine tar -czvf /backup/files_backup_$DATE.tar.gz -C /usr/src/redmine/files .

echo "Backup complete! Files stored in $BACKUP_DIR"

# Optional: Sync to S3
# echo "Syncing to S3..."
# aws s3 sync $BACKUP_DIR s3://glimfo-backups/redmine/
