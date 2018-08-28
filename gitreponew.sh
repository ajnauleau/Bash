
## This bash script will create a new public 
## repository for a given github user. Exp:
## gitreponew username git@github.com/reponame/

#! /usr/bin/env bash
git init
git add .
git commit -m 'First Commit'
curl -u $1 https://api.github.com/user/repos -d '{"name":"'"$2"'"}'
git remote add origin 'https://github.com/'"$1"'/'$2
git push -u origin master
