# Upgrading Glimfo Projects from Upstream Redmine

Because we maintain this as a "wrapper repository", our customizations are isolated from Redmine's core code via Docker volumes and our custom `Dockerfile`. This makes upgrading to new Redmine versions painless.

## Upgrade Procedure

1. **Update the Dockerfile:**
   If Redmine releases a new version (e.g., `5.2`), update the `docker/redmine/Dockerfile`:
   ```diff
   - FROM redmine:5.1-alpine
   + FROM redmine:5.2-alpine
   ```

2. **Test Locally:**
   ```bash
   docker-compose build --no-cache redmine
   docker-compose up -d
   ```
   Ensure the database migrations run successfully (handled automatically by the entrypoint).
   Verify that the Glimfo Theme and plugins still work correctly with the new version.

3. **Commit and Push:**
   ```bash
   git add docker/redmine/Dockerfile
   git commit -m "chore: bump redmine upstream version to 5.2"
   git push origin glimfo-main
   ```

4. **CI/CD Deployment:**
   The GitHub action will automatically build the new image. Deploy it to production using the deployment webhook or your CI process.
