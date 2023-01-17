#!/bin/sh
#$1 = https://github.com/dekopon21020014/bookers2.git
repo=$1
user=dekopon21020014:
pass=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
http=https://
github=@github.com/
echo | awk -v repo=${repo} '{gsub(/.*github\.com./, "", repo); print repo}' > repo.txt
repo=`cat repo.txt`
target=$http$user$pass$github$repo
echo $target
