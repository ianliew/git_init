#!/bin/sh

##  git_deploy.sh [git repo]
##  This script will force deploy everything in this directory into github

##  Check for arg. Use name of current directory if no arg is provided.
if [ $# -eq 0 ] && [ -z "$1" ]; then
	GIT=`pwd | sed -E 's/.*\/(.*)/\1/'`
else
	GIT=$1
fi

GIT="${GIT}.git"
echo "using $GIT"

read -r -p "Continue? " REPLY
if [[ $REPLY != "y" ]]; then
	exit 0
fi


rm -rf .git
git init
git add .
git commit -m  "commit"
git remote add origin git@github.com:ianliew/$GIT
git push --force origin master