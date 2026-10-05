#!/bin/bash
# Runs before the new revision is copied onto the instance.
# Installs nginx if it isn't already present. Idempotent - safe to run on every deployment.
set -e

if command -v nginx >/dev/null 2>&1; then
  echo "nginx already installed."
else
  if command -v yum >/dev/null 2>&1; then
    yum install -y nginx
  elif command -v apt-get >/dev/null 2>&1; then
    apt-get update -y
    apt-get install -y nginx
  else
    echo "No supported package manager found (expected yum or apt-get)." >&2
    exit 1
  fi
fi

mkdir -p /usr/share/nginx/html
