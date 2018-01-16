#!/bin/bash
for repo in $(cat repos.txt)
do
  echo $repo
  cd $repo
  cd src/main/java/de/metro/robocode
  ls
  cd ~/robocode
done

