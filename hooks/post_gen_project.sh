#!/bin/sh
# License: MIT
# Copyright © 2023 Frequenz Energy-as-a-Service GmbH
set -eu

# Color constants
ERROR='\033[0;31m'
WARN='\033[0;33m'
INFO='\033[0;36m'
SUCCESS='\033[1;32m'
RESET='\033[0m'

interpret_escapes() {
  while IFS= read -r line
  do
    echo "$line"
  done
}

warn() {
    echo "${WARN}WARNING: $@${RESET}." >&2
}

TREE_OUT=""
if test -x "$(command -v tree)"
then
    TREE_OUT=$(tree)
fi

github_org="{{cookiecutter.github_org}}"
github_repo_name="{{cookiecutter.github_repo_name}}"
license="{{cookiecutter.license}}"

cat <<EOT | interpret_escapes

--------------------------------------------------------------------------------

Your 🍪 $github_repo_name has been cut!
${TREE_OUT:+

$TREE_OUT}

Here is a list of things that should be reviewed and FIXED:

$(grep -rn --color=always 'TODO(cookiecutter):' . | sort)

We recommend you to first initialize a git repository and commit the changes before
going through the list of TODOs:

    cd "$github_repo_name"
    git init
    git add .
    git commit -s -m "Initial commit from the generated project"

After fixing the TODOs, you amend the previous commit using "git commit --amend" or
create a new commit for the changes using "git commit".

${INFO}If you had any issues or find any errors in the generated files, please report
them! https://github.com/frequenz-floss/cookiecutter-gh-action/issues/new${RESET}

EOT


if test "$github_org" = "frequenz-floss" -a "$license" != "MIT"
then
    warn "Using a non-MIT license ($license) with a frequenz-floss project is not recommended"
fi
