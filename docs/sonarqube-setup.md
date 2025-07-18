# SonarQube Setup for GitHub Actions

This document explains how to configure GitHub secrets for SonarQube integration in repositories created from this template.

## Overview

The CI/CD pipeline includes optional SonarQube scanning for code quality analysis. When SonarQube secrets are configured, the workflow will:
1. Automatically create a SonarQube project if it doesn't exist
2. Run code analysis on each push to the main branch
3. Report code quality metrics to your SonarQube instance

## Required GitHub Secrets

The following secrets are required to enable SonarQube integration:

1. **SONAR_TOKEN** - SonarQube authentication token
   - Generate from: Your SonarQube instance → My Account → Security → Generate Token
   - Required permissions: Execute Analysis, Create Projects

2. **SONAR_HOST_URL** - SonarQube server URL
   - Example: `https://sonarqube.example.com`
   - Must be the full URL including protocol

## Setting Up Secrets

### Using GitHub CLI

```bash
# Navigate to your repository
cd your-repo-name

# Add SonarQube authentication token
gh secret set SONAR_TOKEN --body "YOUR_SONARQUBE_TOKEN_HERE"

# Add SonarQube host URL
gh secret set SONAR_HOST_URL --body "https://sonarqube.example.com"
```

### Using GitHub Web Interface

1. Go to your repository on GitHub
2. Click on **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Add each secret:
   - Name: `SONAR_TOKEN`, Value: Your SonarQube token
   - Name: `SONAR_HOST_URL`, Value: Your SonarQube server URL

## How It Works

When SonarQube secrets are configured, the GitHub Actions workflow will:

1. **Create Project**: Automatically create a SonarQube project using the pattern `{github_org}_{repo_name}`
2. **Run Analysis**: Execute SonarQube scanner on your codebase
3. **Upload Results**: Send analysis results to your SonarQube server
4. **Quality Gate**: View code quality metrics in SonarQube dashboard

## Project Configuration

The SonarQube analysis uses the configuration from `sonar-project.properties`:
- Project key: `{github_org}_{repo_name}`
- Source directories: Current directory
- Exclusions: `node_modules/**`, `coverage/**`, `app/static/js/*.min.js`

## Optional Setup

SonarQube integration is optional. If the secrets are not configured:
- The workflow will skip SonarQube-related steps
- No errors will be thrown
- The rest of the CI/CD pipeline will continue normally

## Verifying the Setup

After configuring the secrets and pushing to main:

1. Check the **Actions** tab in your GitHub repository
2. Look for the "CI/CD Pipeline" workflow
3. Verify the "Setup SonarQube project" and "SonarQube Scan" steps run successfully
4. Visit your SonarQube instance to view the analysis results

## Troubleshooting

- **401 Unauthorized**: Verify your SONAR_TOKEN is valid and has the required permissions
- **Project creation failed**: Ensure your token has "Create Projects" permission
- **Analysis failed**: Check that source code paths in `sonar-project.properties` are correct
- **Connection refused**: Verify SONAR_HOST_URL is accessible from GitHub Actions runners

## Additional Resources

- [SonarQube Documentation](https://docs.sonarqube.org/)
- [GitHub Actions SonarQube Scanner](https://github.com/SonarSource/sonarqube-scan-action)