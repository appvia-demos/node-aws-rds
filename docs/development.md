# Development Guide

This guide covers local development, testing, and debugging for the Todo application with AWS RDS integration.

## Prerequisites

- Docker and Docker Compose
- Node.js 18+ (for local development without Docker)
- Git
- Access to a Wayfinder workspace (for RDS deployment)

## Quick Start

The application uses Docker Compose with a local MySQL container for development:

```bash
# Clone the repository
git clone <your-repo-url>
cd <your-repo-name>

# Start the application with local MySQL
docker compose up --build

# Run in detached mode
docker compose up --build --detach

# The app will be available at http://localhost:3000
```

## Development vs Production

### Local Development
- Uses Docker Compose with a containerized MySQL instance
- Immediate feedback and fast iteration
- No cloud resources required

### Production Deployment
- Uses AWS RDS MySQL managed by Wayfinder
- Environment variables automatically injected by Wayfinder
- See [RDS Integration](rds-integration.md) for details

## Testing

### Running Tests

```bash
# Run unit tests
cd app
npm test

# Run tests with coverage
npm run test:coverage

# Run tests in watch mode
npm run test:watch
```

### Manual Testing

The application provides:
- Web interface at http://localhost:3000
- Swagger UI at http://localhost:3000/docs
- Direct API access for testing endpoints

## Environment Variables

The application uses these environment variables (see [RDS Integration](rds-integration.md) for production values):

| Variable | Description | Local Default | Production Source |
|----------|-------------|---------------|-------------------|
| `MYSQL_HOST` | Database hostname | `mysql` | RDS endpoint via Wayfinder |
| `MYSQL_USER` | Database username | `root` | RDS credentials via Wayfinder |
| `MYSQL_PASSWORD` | Database password | `secret` | RDS credentials via Wayfinder |
| `MYSQL_DB` | Database name | `todos` | RDS database via Wayfinder |
| `PORT` | Application port | `3000` | `3000` |

## Project Structure

```
.
├── app/                    # Application source code
│   ├── index.js           # Main application with database setup
│   ├── package.json       # Dependencies
│   ├── openapi.yaml       # API specification
│   └── src/
│       └── static/        # Frontend files
├── wayfinder/             # Wayfinder deployment configs
│   ├── application.yml    # Application definition
│   └── components.yml     # Component definitions (app + RDS)
├── docker-compose.yml     # Local development setup
├── Dockerfile            # Application container
└── docs/                 # Documentation
```

## Common Development Tasks

### Viewing Logs

```bash
# All services
docker compose logs -f

# Application only
docker compose logs -f app

# MySQL only (local development)
docker compose logs -f mysql
```

### Database Access (Local Development)

```bash
# Connect to local MySQL
docker compose exec mysql mysql -uroot -psecret

# Check database
USE todos;
SHOW TABLES;
SELECT * FROM items;
```

### Rebuilding After Changes

```bash
# Rebuild and restart
docker compose up --build

# Clean rebuild
docker compose down -v
docker compose up --build
```

## CI/CD Configuration

For GitHub Actions integration with JFrog Artifactory, see the [Artifactory Setup Guide](artifactory-setup.md).

## Troubleshooting

### Port Conflicts
```bash
# Check what's using port 3000
lsof -i :3000

# Use a different port
PORT=3001 docker compose up
```

### Database Connection Issues
1. Ensure MySQL container is healthy: `docker compose ps`
2. Check logs: `docker compose logs mysql`
3. Verify environment variables are set correctly
4. Try restarting: `docker compose restart`

### Schema Updates Not Applied
The application automatically creates tables on startup. If schema changes aren't reflected:
1. Stop containers: `docker compose down`
2. Remove volumes: `docker compose down -v`
3. Restart: `docker compose up --build`

## Next Steps

- Configure [JFrog Artifactory](artifactory-setup.md) for CI/CD
- Review [RDS Integration](rds-integration.md) for production deployment
- Check the [API Documentation](../app/openapi.yaml) for endpoint details