# {{cookiecutter.name}} Action

## Introduction

{{cookiecutter.description}}

TODO(cookiecutter): Improve the README file

Here is an example demonstrating how to use it in a workflow:

```yaml
jobs:
  upload:
    runs-on: ubuntu-22.04

    steps:
      - name: Fetch sources
        uses: actions/checkout@v4

      - name: Setup Git
        # Replace the version with the latest version
        uses: {{cookiecutter.github_org}}/{{cookiecutter.github_repo_name}}@v1.0.0
        with:
          # TODO(cookiecutter): Update the inputs.
          input1: value1
          input2: value2
```

This will configure the username and email to impersonate the GitHub Actions
bot when new commits are created. No credentials are configured by default.

## Inputs

TODO(cookiecutter): Update the inputs.

* `input1`: ...
* `input2`: ...

## Changelog

Please see the
[releases](https://github.com/{{cookiecutter.github_org}}/{{cookiecutter.github_repo_name}}/releases/)
page.
