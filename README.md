# Wanaoni Family Welfare

This repository contains the Docker Compose stack for running
Drupal + CiviCRM on port 8000, plus helper scripts and docs.

## Quickstart

1. cp .env.example .env  
2. docker-compose up -d  
3. Access the site at http://localhost:8000/  

## Scripts & Makefile

- `./healthcheck.sh` — checks HTTP 200 on port 8000  
- `backup.sh` / `restore.sh` — DB backup and restore

## Maintenance

- To stop: `docker-compose down`  
- To backup: `make backup`  
- To restore: `make restore backups/db_XXXX.sql`

