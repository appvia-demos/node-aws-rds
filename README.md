# Todo App

This is a simple demo nodejs todo app which depends on AWS RDS cloud resouce (MySQL database). It allows you to create, update, and delete tasks in a user-friendly interface.

## Features

- Add item to list
- Mark item as done
- Delete item from list

## Pre-requisites

Ensure [MySQL RDS cloud resource plan](./mysql-rds-cloud-resource-plan.yaml) is applied in Wayfinder.

## Installation

1. Clone the repository: `git clone https://github.com/appvia/todo-app.git`
2. Run docker compose up --build --detach

## 🔧 Required GitHub Secrets

When projects are created from this template, configure the following GitHub repository secrets for the CI/CD pipeline using the GitHub CLI:

### JFrog Artifactory Secrets (Required)

```bash
# Set JFrog Artifactory URL
gh secret set ARTIFACTORY_URL --body "https://your-artifactory-instance.jfrog.io"

# Set JFrog username
gh secret set ARTIFACTORY_USERNAME --body "your-username@example.com"

# Set JFrog access token
gh secret set ARTIFACTORY_ACCESS_TOKEN --body "your-artifactory-access-token"

# Set Docker repository name
gh secret set ARTIFACTORY_DOCKER_REPO --body "docker-repo-name"
```

### SonarQube Secrets (Optional)

```bash
# Set SonarQube authentication token
gh secret set SONAR_TOKEN --body "your-sonarqube-token"

# Set SonarQube server URL
gh secret set SONAR_HOST_URL --body "https://sonarcloud.io"
```

### List All Secrets

To verify all secrets have been added:

```bash
gh secret list
```

For detailed setup instructions, see:
- [Artifactory Setup Guide](docs/artifactory-setup.md)
- [SonarQube Setup Guide](docs/sonarqube-setup.md)

**Note**: The `GITHUB_TOKEN` is automatically provided by GitHub Actions.

## Usage

1. Open the app in your browser: `http://localhost:3000` (may take a few seconds to start up)
2. Create a new task by entering a description and clicking "Add Item"
3. Update the status of a task by clicking the checkbox next to it
4. Delete a task by clicking the "Delete" button next to it


## Published Images

The images are published on Github Container Registry: https://github.com/appvia/todo-app/pkgs/container/todo-app

## Contributing

Contributions are welcome! If you find a bug or have a feature request, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
