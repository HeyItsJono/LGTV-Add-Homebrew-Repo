#!/bin/sh

# Check if a URL was provided
if [ -z "$1" ]; then
    echo "Error: Missing URL argument."
    echo "Usage: $0 https://your-custom-repo.url"
    exit 1
fi

REPO_URL="$1"

echo "Sending repository to Homebrew Channel: $REPO_URL"

# Execute the webOS Luna Service command
luna-send -n 1 -f luna://com.webos.applicationManager/launch \
  "{\"id\": \"org.webosbrew.hbchannel\", \"params\": {\"launchMode\": \"addRepository\", \"url\": \"$REPO_URL\"}}"

echo "Check your TV screen to confirm the addition."
