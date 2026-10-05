#!/bin/bash
# Starts nginx after the new revision has been installed.
set -e

systemctl enable nginx || true
systemctl start nginx || service nginx start
