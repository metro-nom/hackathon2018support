#!/bin/bash
for repo in $(cat repos.txt)
do
  git clone https://github.com/techmetro/$repo.git
done

