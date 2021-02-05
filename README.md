# Tidelift Scan GitHub Action

The Tidelift Scan GitHub action allows you to integrate a Tidelift
catalog scan into your GitHub repositories.

This lets you fail PRs that add unapproved dependencies as a part
of your CI/CD process.

**Because this action runs a scan in a dedicated container, it only works with projects that have lock files (yarn.lock, package-lock.json) and will not work for projects that need to resolve dependencies in their own environment (Maven, Python). If you need to resolve dependencies in your environment, you will want to use a CI system rather than a GitHub Action.**

For more information see https://docs.tidelift.com

## Example usage

To use this Action, you need to create a workflow like the following

```yaml
name: Tidelift Scan
on: [push]

jobs:
  build:
    name: Run Tidelift to ensure approved open source libraries are in use
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Scan
        uses: tidelift/scan-action@master
        env:
          TIDELIFT_API_KEY: ${{ secrets.TIDELIFT_API_KEY }}
          TIDELIFT_TEAM_NAME: ${{ secrets.TIDELIFT_TEAM_NAME }}
          TIDELIFT_REPOSITORY_NAME: ${{ secrets.TIDELIFT_REPOSITORY_NAME }}
```

## Tidelift secrets

The example above refers to a number of secrets. These secrets can be retrieved
from your Tidelift web UI in the API key section. More information on Tidelift
API keys can be found in
[the documentation](https://docs.tidelift.com/article/27-tracking-repositories-and-creating-api-keys)
