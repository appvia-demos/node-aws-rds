# node-aws-rds



## Overview

A production-ready todo application demonstrating Backstage integrations with AWS RDS MySQL. This template showcases cloud-native architecture using:

- **AWS RDS MySQL** for managed database persistence
- **RESTful API** with OpenAPI documentation
- **JFrog Artifactory** for Docker image publishing
- **GitHub Actions** for CI/CD automation
- **SonarQube** integration for code quality
- **Wayfinder** for cloud resource management

## Architecture

This application differs from the basic template by using AWS RDS instead of containerized MySQL:

- **Frontend**: Static HTML/JS served from the app container
- **Backend**: Node.js REST API with automatic database schema management
- **Database**: AWS RDS MySQL (managed by Wayfinder)
- **CI/CD**: GitHub Actions workflow for testing and publishing

## Prerequisites

Before deploying this application:

1. **Wayfinder Setup**: Ensure the [MySQL RDS cloud resource plan](../mysql-rds-cloud-resource-plan.yaml) is applied in your Wayfinder workspace
2. **GitHub Secrets**: Configure secrets for JFrog Artifactory (see [Artifactory Setup](artifactory-setup.md))
3. **Local Development**: Docker and Docker Compose installed

## Documentation

### Getting Started
- [Development Guide](development.md) - Local development, testing, and debugging
- [API Documentation](../app/openapi.yaml) - REST API endpoints and OpenAPI specification

### Integration Guides
- [RDS Integration](rds-integration.md) - AWS RDS configuration and cloud resource management
- [Artifactory Setup](artifactory-setup.md) - Docker registry configuration and CI/CD integration
- [SonarQube Setup](sonarqube-setup.md) - Code quality analysis configuration

### Deployment
Once your repository is created from this template:
1. Configure GitHub secrets as documented
2. Push to the main branch to trigger CI/CD
3. Deploy through Wayfinder using the generated application manifests