#!/usr/bin/sh
# @author nate zhou
# @since 2024,2025

pgrep -f "foot --server" > /dev/null || foot --server

