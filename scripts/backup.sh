#!/usr/bin/env bash
set -euo pipefail

# === Configuration ===
# Adjust DB_SERVICE if your compose service isn’t named "db"
DB_SERVICE=${DB_SERVICE:-db}

# These should live in a .env file or your shell environment
DB_USER=${DB_USER:-root}
DB_PASS=${DB_PASS:-password}
DB_NAME=${DB_NAME:-wanaoni}

BACKUP_DIR="./backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Create backup folder if missing
mkdir -p "${BACKUP_DIR}"

# Audit log entry: start
echo "$(date +"%Y-%m-%d %H:%M:%S") - Starting backup of ${DB_NAME} (service: ${DB_SERVICE})" \
  >> audit.log

# Perform the dump
docker-compose exec "${DB_SERVICE}" \
  mysqldump -u"${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" \
  > "${BACKUP_DIR}/${DB_NAME}_${TIMESTAMP}.sql"

# Audit log entry: success
echo "$(date +"%Y-%m-%d %H:%M:%S") - Backup saved to ${BACKUP_DIR}/${DB_NAME}_${TIMESTAMP}.sql" \
  >> audit.log

