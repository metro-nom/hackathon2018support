#!/bin/bash
for repo in $(cat repos.txt)
do
  cp $repo/robots/*.jar $1/robots/
done

