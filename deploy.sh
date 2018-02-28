#!/bin/bash
DIRECTORY=${PWD}/.docker

dockerArray=("secrets")

if [ -d "$DIRECTORY" ]; then
  echo "docker directory already exists..."
  exit 0
else
  for dockerPaths in "${dockerArray[@]}"
  do
    mkdir -p "$DIRECTORY/$dockerPaths"
  done
  if [ -d "$DIRECTORY/secrets" ]; then
    echo "codeigniter" >> "$DIRECTORY/secrets/db_user.txt"
    gpg --gen-random --armor 1 14 >> "$DIRECTORY/secrets/db_password.txt"
  fi
  echo "docker directory was created successfully... everything is ready... ;)"
  exit 0
fi

mkdir -p db-data
