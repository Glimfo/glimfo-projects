# Glimfo Projects - Installation Guide

## Prerequisites
- Docker & Docker Compose
- A domain name (e.g., projects.glimfo.com) pointing to your server
- Ports 80 and 443 open on the server firewall

## Step-by-Step Setup

1. **Clone the wrapper repository:**
   ```bash
   git clone https://github.com/glimfo/glimfo-projects.git
   cd glimfo-projects
   ```

2. **Configure Environment:**
   Copy the example environment file and fill in your secrets and OAuth credentials.
   ```bash
   cp .env.example .env
   nano .env
   ```
   Ensure you generate a strong `SECRET_KEY_BASE`. You can use `openssl rand -hex 64`.

3. **Start the Infrastructure:**
   ```bash
   docker-compose up -d
   ```
   This will build the custom Glimfo Redmine Docker image, start PostgreSQL, Redis, and Nginx.

4. **Initialize Let's Encrypt SSL (First time only):**
   Acquire the certificate.
   ```bash
   docker-compose run --rm certbot certonly --webroot --webroot-path=/var/www/certbot -d projects.glimfo.com --email admin@glimfo.com --agree-tos --no-eff-email
   docker-compose restart nginx
   ```

5. **Access Redmine:**
   Navigate to `https://projects.glimfo.com`.
   The default Redmine login is `admin` / `admin`. You MUST change this immediately upon first login.
