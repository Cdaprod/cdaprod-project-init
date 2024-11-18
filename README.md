# 📦 Cdaprod Project Initialization

[![Self Initialize Using Our Action](https://github.com/Cdaprod/cdaprod-project-init/actions/workflows/self-init.yml/badge.svg)](https://github.com/Cdaprod/cdaprod-project-init/actions/workflows/self-init.yml)

Automate the setup of GitHub repositories with standardized labels and milestones.

## Structure

```
cdaprod-project-init/
├── .github/
│   └── workflows/
│       ├── reusable-labels.yml      # Reusable workflow for labels
│       ├── reusable-milestones.yml  # Reusable workflow for milestones
│       └── call-init.yml            # Workflow that calls both
├── templates/
│   ├── labels.json        # Label definitions
│   └── milestones.json    # Milestone definitions
├── scripts/
│   └── init-repo.sh       # CLI tool for initialization
└── action.yml             # Composite action definition
```

## Features

- 🏷️ Standardized label creation with emojis
- 🎯 Project milestone initialization
- 🔄 Reusable GitHub Actions workflows
- 🛠️ CLI tool for quick setup

# Using Cdaprod Project Init Action

## Prerequisites
1. GitHub repository with Actions enabled
2. Workflow permissions for issues and contents

## Setup Steps

1. Create a workflow file in your repository at `.github/workflows/init.yml`:

```yaml
name: Initialize Repository
on:
  workflow_dispatch:  # Allows manual triggering

jobs:
  init:
    runs-on: ubuntu-latest
    permissions:
      issues: write    # Required for creating labels/milestones
      contents: write  # Required for repo operations
    steps:
      - uses: actions/checkout@v4
      
      - name: Initialize Repository
        uses: Cdaprod/project-init@v1  # Using @v1 for stability in other repos
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

## Optional: Custom Configurations

If you want to use custom configurations:

1. Create your custom config files:
   ```
   your-repo/
   ├── .github/
   │   └── workflows/
   │       └── init.yml
   └── .config/
       ├── labels.json
       └── milestones.json
   ```

2. Update the workflow to use your custom configs:
```yaml
      - name: Initialize Repository
        uses: Cdaprod/project-init@v1
        with:
          labels-config: '.config/labels.json'
          milestones-config: '.config/milestones.json'
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

## Configuration

### Custom Labels

Create a `labels.json` file:

```json
[
  {
    "name": "🗺️ roadmap",
    "color": "0366d6",
    "description": "Strategic planning"
  }
]
```

### Custom Milestones

Create a `milestones.json` file:

```json
[
  {
    "title": "🛠️ Project Initialization",
    "state": "open",
    "description": "Initial setup"
  }
]
```

## Usage

This action can be used to initialize any GitHub repository with standardized labels and milestones.

### Basic Usage

```yaml
- uses: Cdaprod/cdaprod-project-init@v1
  with:
    token: ${{ secrets.GITHUB_TOKEN }}
```

### Custom Configuration

1. Create your own configuration files:
```json
// labels.json
[
  {
    "name": "priority/high",
    "color": "b60205",
    "description": "🚨 Urgent attention needed"
  }
]
```

2. Use custom configs in the workflow:
```yaml
- uses: Cdaprod/cdaprod-project-init@v1
  with:
    token: ${{ secrets.GITHUB_TOKEN }}
    labels-config: '.github/labels.json'
    milestones-config: '.github/milestones.json'
```

### Permissions

Make sure your workflow has the necessary permissions:
```yaml
permissions:
  issues: write    # For labels and milestones
  contents: write  # For repository operations
```

### Inputs

| Input | Description | Required | Default |
|-------|-------------|----------|---------|
| `token` | GitHub token | Yes | N/A |
| `labels-config` | Path to labels JSON | No | templates/labels.json |
| `milestones-config` | Path to milestones JSON | No | templates/milestones.json |
| `skip-existing` | Skip existing items | No | true |

## Running the Action

1. Go to your repository's "Actions" tab
2. Select the "Initialize Repository" workflow
3. Click "Run workflow"
4. Select the branch and click "Run workflow"

## Troubleshooting

- Ensure your repository has Actions enabled (Settings > Actions > General)
- Verify the workflow has proper permissions (Settings > Actions > General > Workflow permissions)
- Check that `GITHUB_TOKEN` has sufficient permissions

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 👥 Connect with Cdaprod

<div align="center">
  <p>
    <a href="https://youtube.com/@Cdaprod">
      <img src="https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white" alt="YouTube Channel" />
    </a>
    <a href="https://twitter.com/cdasmktcda">
      <img src="https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white" alt="Twitter Follow" />
    </a>
    <a href="https://www.linkedin.com/in/cdasmkt">
      <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn" />
    </a>
    <a href="https://github.com/Cdaprod">
      <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" alt="GitHub followers" />
    </a>
    <a href="https://sanity.cdaprod.dev">
      <img src="https://img.shields.io/badge/Blog-FF5722?style=for-the-badge&logo=blogger&logoColor=white" alt="Personal Blog" />
    </a>
  </p>
</div>

## 📜 License

MIT

---

<div align="center">
  <p>Built with ❤️ by <a href="https://github.com/Cdaprod">Cdaprod</a></p>
  <p><em>Making Enterprise Software Awesome!</em></p>
</div>
