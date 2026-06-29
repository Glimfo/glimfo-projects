# Glimfo Projects - Administration & Security Guide

## Security Configurations

- **HTTPS Only**: Nginx handles SSL termination and enforces HTTPS via `return 301`. Strict-Transport-Security (HSTS) is enabled.
- **Rate Limiting**: Configured in Nginx (`limit_req_zone $binary_remote_addr zone=one:10m rate=10r/s;`).
- **Secret Management**: Passwords, DB credentials, and secret keys are stored in the `.env` file and never committed to source control.
- **Docker Hardening**: Redmine runs as a non-root user `redmine` internally.
- **Least Privilege**: Only necessary ports (80/443) are exposed to the host. The database and Redis are only accessible on the internal Docker network.

## Backup Management

- Backups are automated via `scripts/backup.sh`.
- Set up a cron job to run this script daily:
  `0 2 * * * /path/to/glimfo-projects/scripts/backup.sh >> /var/log/redmine_backup.log 2>&1`
- Backups are stored in `/var/backups/glimfo_projects`.

## Configuring OAuth

1. Obtain Client ID and Client Secret from the Google Cloud Console or GitHub Developer Settings.
2. Update the `.env` file with these credentials.
3. Restart the container (`docker-compose up -d`) to inject the environment variables.

## Initial Setup of Projects, Roles, and Trackers
After installation, the admin should:
1. Log in and change the default `admin` password.
2. Go to **Administration -> Settings -> Authentication** and enable Google/GitHub OAuth if configured.
3. Go to **Administration -> Roles and permissions** and define standard Glimfo roles.
4. Go to **Administration -> Trackers** to define issue types (e.g., Bug, Feature, Task).
5. Go to **Administration -> Workflows** to link Roles, Statuses, and Trackers.
