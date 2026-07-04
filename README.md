# Glimfo Projects

> Enterprise-grade project management powered by Redmine.

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy?repo=https://github.com/Glimfo/glimfo-projects)

## 🚀 Quick Start

### One-Click Deploy (Free)

Click the **Deploy to Render** button above to deploy Glimfo Projects with a free PostgreSQL database in minutes. No credit card required.

### Local Development (Docker)

```bash
git clone https://github.com/Glimfo/glimfo-projects.git
cd glimfo-projects
cp .env.example .env
# Edit .env with your secrets
docker compose up -d
```

## 📖 Documentation

| Guide | Description |
|-------|-------------|
| [Installation](docs/INSTALL.md) | Full setup instructions |
| [Administration](docs/ADMIN.md) | Security, backups, OAuth |
| [Upgrade](docs/UPGRADE.md) | Upgrading from upstream Redmine |

## 🏗 Architecture

- **App**: Redmine 5.1 on Ruby on Rails
- **Database**: PostgreSQL 15
- **Cache**: Redis 7
- **Proxy**: Nginx with auto-SSL
- **CI/CD**: GitHub Actions
- **Hosting**: Render.com (free tier) / Self-hosted Docker

## 🔒 Security

- HTTPS-only with HSTS
- Rate limiting via Nginx
- Trivy container vulnerability scanning
- Hadolint Dockerfile linting
- Branch protection with required reviews
- Secrets managed via environment variables

## 📄 License

This project is a fork of [Redmine](https://www.redmine.org/) and is licensed under [GPL-2.0](LICENSE).

---

Built with ❤️ by [Glimfo](https://github.com/Glimfo)
