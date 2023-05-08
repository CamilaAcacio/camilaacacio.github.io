#!/bin/bash
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

BASE_DIR=`dirname $0`
SOURCE="out/"
TARGET="sftp.ic.uff.br:public_html"

cd $BASE_DIR

echo "Checking requirements..."
command -v webgen >/dev/null 2>&1 || { echo >&2 "I require webgen but it's not installed.  Aborting."; exit 1; }
command -v rsync >/dev/null 2>&1 || { echo >&2 "I require rsync but it's not installed.  Aborting."; exit 1; }

echo "Generating site..."
webgen -v

echo "Synchronizing..."
rsync --archive --delete --chmod=Do+rx,Fo+r --progress $SOURCE $TARGET
