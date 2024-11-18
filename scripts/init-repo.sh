#!/bin/bash

# Initialize a repository with Cdaprod standard configuration
# Usage: init-repo.sh <owner/repo> <github-token>

set -e

repo_name="$1"
token="$2"

if [ -z "$repo_name" ] || [ -z "$token" ]; then
    echo "Usage: init-repo.sh <owner/repo> <github-token>"
    echo "Example: init-repo.sh Cdaprod/my-new-repo ghp_1234567890"
    exit 1
fi

# Validate repository format
if [[ ! "$repo_name" =~ ^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$ ]]; then
    echo "Error: Repository name must be in format 'owner/repo'"
    exit 1
fi

# Validate token
if [[ ! "$token" =~ ^ghp_ ]]; then
    echo "Warning: Token doesn't start with 'ghp_'. Make sure you're using a valid GitHub Personal Access Token"
fi

echo "🚀 Initializing repository: $repo_name"

# Trigger the workflow
echo "📦 Triggering initialization workflow..."
response=$(curl -X POST \
  -H "Authorization: token $token" \
  -H "Accept: application/vnd.github.v3+json" \
  "https://api.github.com/repos/$repo_name/dispatches" \
  -d '{"event_type":"initialize-repository"}' \
  -s -w "\n%{http_code}")

http_code=$(echo "$response" | tail -n1)
response_body=$(echo "$response" | head -n-1)

if [ "$http_code" -eq 204 ]; then
    echo "✅ Repository initialization triggered successfully!"
    echo "🔍 Check the Actions tab in your repository to monitor progress"
else
    echo "❌ Failed to trigger initialization"
    echo "HTTP Status: $http_code"
    echo "Response: $response_body"
    exit 1
fi