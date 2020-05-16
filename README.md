# New Relic Application Deployment Marker
New Relic App Deployment Marker

[![GitHub Marketplace version](https://img.shields.io/github/release/sanderblue/newrelic-deployment-marker.svg?label=Marketplace&logo=github)](https://github.com/marketplace/actions/new-relic-app-deployment-marker)

A GitHub Action to add New Relic deployment markers during your release pipeline.

## Inputs

| Key             |          | Description                                                                                                                              |
| --------------- | -------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `api_key`       | required | Your New Relic [personal API key](https://docs.newrelic.com/docs/apis/get-started/intro-apis/types-new-relic-api-keys#personal-api-key). |
| `applicationId` | required | The New Relic application ID to apply the deployment marker.                                                                             |
| `region`        | optional | The region of your New Relic account. Default: "US"                                                                                      |
| `revision`      | optional | Metadata to apply to the deployment marker - e.g. the latest release tag                                                                 |
| `accountId`     | optional | The account number the application falls under. This could also be a subaccount.                                                         |

## Example usage

```yaml
# Add a New Relic application deployment marker on release
on:
  - release

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - name: Apply New Relic deployment marker
        uses: sanderblue/newrelic-deployment-marker@master
        with:
          api_key: ${{ secrets.NEW_RELIC_API_KEY }}
          applicationId: 123456789
          region: US
          revision: ${{ github.ref }}-${{ github.sha }}
          accountId: 6543210
```
