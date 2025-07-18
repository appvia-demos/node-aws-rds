# JFrog Artifactory Setup for GitHub Actions

This document explains how to configure GitHub secrets for JFrog Artifactory integration in repositories created from this template.

## Required GitHub Secrets

The GitHub Actions workflow requires the following secrets to be configured in your repository:

1. **ARTIFACTORY_URL** - JFrog Artifactory hostname (without https://)
   - Example: `trialm6kl97.jfrog.io`

2. **ARTIFACTORY_USERNAME** - Your JFrog username
   - Example: `susan.sun@appvia.io`

3. **ARTIFACTORY_ACCESS_TOKEN** - JFrog access token with push permissions

4. **ARTIFACTORY_DOCKER_REPO** - JFrog Docker repository name
   - Example: `docker-trial`

## Setting Up Secrets

### Using GitHub CLI

```bash
# Navigate to your repository
cd your-repo-name

# Add JFrog Artifactory URL (without https://)
gh secret set ARTIFACTORY_URL --body "trialm6kl97.jfrog.io"

# Add JFrog Artifactory username
gh secret set ARTIFACTORY_USERNAME --body "your.email@appvia.io"

# Add JFrog Artifactory access token
gh secret set ARTIFACTORY_ACCESS_TOKEN --body "YOUR_ACCESS_TOKEN_HERE"

# Add JFrog Docker repository name
gh secret set ARTIFACTORY_DOCKER_REPO --body "docker-trial"
```

### Using GitHub Web Interface

1. Go to your repository on GitHub
2. Click on **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Add each secret with the appropriate name and value

## How It Works

The GitHub Actions workflow (`.github/workflows/test.yml`) will:

1. Run tests with coverage
2. Build a Docker image from your application
3. Tag the image with:
   - `latest` tag
   - Git commit SHA tag
4. Push both tags to JFrog Artifactory at `${ARTIFACTORY_DOCKER_REPO}/YOUR_REPO_NAME`

## Verifying the Setup

After setting up the secrets and pushing to the main branch:

1. Check the **Actions** tab in your GitHub repository
2. Look for the "Test" workflow run
3. Verify the "Build and push Docker image to JFrog Artifactory" step completes successfully

## Troubleshooting

- **Login failed**: Verify your ARTIFACTORY_ACCESS_TOKEN is valid and has push permissions
- **404 errors**: Check that ARTIFACTORY_URL is correct (without https://)
- **Permission denied**: Ensure your user has access to the Docker repository specified in ARTIFACTORY_DOCKER_REPO
- **Missing secrets**: All four secrets (ARTIFACTORY_URL, ARTIFACTORY_USERNAME, ARTIFACTORY_ACCESS_TOKEN, ARTIFACTORY_DOCKER_REPO) must be configured