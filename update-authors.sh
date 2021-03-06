#!/bin/bash
set -e

# Get a list of authors ordered by number of commits
# and remove the commit count column
AUTHORS=$(git --no-pager shortlog HEAD -nse | cut -f 2-)
if [ -z "$AUTHORS" ] ; then
    echo "Authors list was empty"
    exit 1
fi

# Write the authors list to the file
echo "$AUTHORS" | tee "$(git rev-parse --show-toplevel)/AUTHORS" > /dev/null

echo "Updated AUTHORS file"
