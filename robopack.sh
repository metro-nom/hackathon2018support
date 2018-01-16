#!/bin/bash
for repo in $(cat repos.txt)
do
  cd $repo
  mvn clean install
  cd ..
done

