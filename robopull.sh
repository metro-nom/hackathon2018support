#!/bin/bash
for repo in $(cat repos.txt)
do
  cd $repo
  rm -r robots
  git fetch --all
  git reset --hard origin/master
  git pull
  cd ..
done

