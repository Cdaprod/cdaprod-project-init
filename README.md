# 📦 Cdaprod Project Initialization

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

## Running the Action

1. Go to your repository's "Actions" tab
2. Select the "Initialize Repository" workflow
3. Click "Run workflow"
4. Select the branch and click "Run workflow"

## Troubleshooting

- Ensure your repository has Actions enabled (Settings > Actions > General)
- Verify the workflow has proper permissions (Settings > Actions > General > Workflow permissions)
- Check that `GITHUB_TOKEN` has sufficient permissions

## License

MIT

## Author

Cdaprod