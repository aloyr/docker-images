#!/bin/sh

set -eo pipefail

# Avoid ssh prompting when connecting to new ssh hosts
mkdir -p $HOME/.ssh && echo "StrictHostKeyChecking no" >> "$HOME/.ssh/config"

# Configure the GitHub Oauth token if it is available
if [ -n "$GITHUB_TOKEN" ] ; then
  composer -n config --global github-oauth.github.com $GITHUB_TOKEN
fi

# Set up our default git config settings.
git config --global user.email "$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_EMAIL"
git config --global core.fileMode false
