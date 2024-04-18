steps to add `api-token` into secret "so far":
1. use environment secret [API from GitHub REST API endpoints for GitHub Actions Secrets - GitHub Docs](https://docs.github.com/en/rest/actions/secrets?apiVersion=2022-11-28#list-environment-secrets)
2. use **GenerateLibSodiumForValue** C# console project to encrypt value with produced key
3. change *.yml files to inherit secrets to prod also on plan & apply before run any pipeline job **if** you have multiple job inheritance