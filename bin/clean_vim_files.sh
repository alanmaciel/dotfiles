#!/bin/bash
find ~/ -name "*.un~" -not -path "~/.tmp/*" -delete
find ~/ -name "*.swp" -not -path "~/.tmp/*" -delete
