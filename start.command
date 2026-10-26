#!/bin/bash
# Double-click to open Woodshed. It runs a tiny local web server so the
# microphone, offline mode and "Add to Dock" all work.
cd "$(dirname "$0")"
PORT=8765
if ! lsof -iTCP:$PORT -sTCP:LISTEN >/dev/null 2>&1; then
  python3 -m http.server $PORT --bind 127.0.0.1 >/dev/null 2>&1 &
  sleep 1
fi
open "http://localhost:$PORT/"
