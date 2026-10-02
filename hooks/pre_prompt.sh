#!/bin/sh
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

cat <<EOT | interpret_escapes

${SUCCESS}Welcome to the GitHub Actions new repository template!${RESET}

This template will ask you some questions to generate a new repository for your
project. Here you can read a description of what each question is about.

$(cat questions-help.md | sed 's/^\* \([^`]\+\):/* \\033\[0;36m\1:\\033\[0m/')


${SUCCESS}Questions:${RESET}

EOT
