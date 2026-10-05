#!/bin/bash
# Stops nginx before the new revision is installed.
# Exits 0 even if nginx isn't running yet (e.g. first-ever deployment).
systemctl stop nginx 2>/dev/null || service nginx stop 2>/dev/null || true
exit 0
