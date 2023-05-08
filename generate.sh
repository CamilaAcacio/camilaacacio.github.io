#!/bin/bash
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

BASE_DIR=`dirname $0`

cd $BASE_DIR

echo "Checking requirements..."
command -v webgen >/dev/null 2>&1 || { echo >&2 "I require webgen but it's not installed.  Aborting."; exit 1; }

echo "Generating site..."
webgen -v
