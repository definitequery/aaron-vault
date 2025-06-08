#!/bin/bash

###############################################################
# A script to sync my vault folder automatically. Pull the
# latest changes to the remote repo, then commit and push local
# to remote, all in one command.
###############################################################

if [ -z "$1" ]; then
  echo "Error: No commit message provided."
  echo "Usage: ./note_sync.sh 'Your commit message'"
  exit 1
fi

git config --global credential.helper osxkeychain

echo "Pulling the latest changes from 'main'..."
git pull origin main

echo "Adding changes to staging..."
git add .

echo "Committing changes..."
git commit -m "$1"

echo "Pushing changes to 'main'..."
git push origin main

echo "Done!"
