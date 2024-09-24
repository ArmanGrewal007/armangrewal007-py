#! /usr/bin/env bash

# This script is used to automate the process of incrementing the version number
# and uploading the package to PyPI.
# My API token is already there in $HOME/.pypirc file

set -e 

# Function to increment version number
increment_version() {
  version=$1
  # Split version number into components (major.minor.patch)
  IFS='.' read -r -a version_parts <<< "$version"
  patch=$((version_parts[2] + 1))
  new_version="${version_parts[0]}.${version_parts[1]}.$patch"
  echo "$new_version"
}

# Get current version from pyproject.toml
if [[ "$(uname)" == "Darwin" ]]; then
  # BSD syntax
  current_version=$(grep -oE 'version = "[^"]+"' pyproject.toml | cut -d'"' -f2)
  sed_command="sed -i ''"
else
  # GNU syntax
  current_version=$(grep -oP '(?<=version = ")[^"]*' pyproject.toml)
  sed_command="sed -i"
fi
echo "Current version: $current_version"

new_version=$(increment_version "$current_version")
echo "New version: $new_version"

# Manual input to confirm
read -p "Continue? (y/n): " confirm
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
  sed -i '' "s/version = \"$current_version\"/version = \"$new_version\"/" pyproject.toml
  rm -rf dist/*
  python -m build || python3 -m build
  twine upload dist/*
else
  echo "Aborted..."
  exit 1
fi

