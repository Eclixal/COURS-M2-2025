#!/bin/bash

current_version=$(git tag --sort=-v:refname | head -n 1)

IFS='.' read -r major minor patch <<< "${current_version#v}"

new_patch=$((patch + 1))

new_version="v$major.$minor.$new_patch"

git tag "$new_version"
git push origin "$new_version"