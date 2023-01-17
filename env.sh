#!/bin/sh
repo=$1
#user=dekopon21020014:
user=`cat username.txt`
#pass=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
pass=`cat password.txt`
http=https://
github=@github.com/
echo | awk -v repo=${repo} '{gsub(/.*github\.com./, "", repo); print repo}' > repo.txt
repo=`cat repo.txt`
target=$http$user$pass$github$repo
git clone $target review
cd review
/root/.rbenv/shims/bundle install
/root/.rbenv/shims/rails webpacker:install
/root/.rbenv/shims/rails webpacker:compile
/root/.rbenv/shims/rails db:migrate
/root/.rbenv/shims/rails db:migrate RAILS_ENV=test
/root/.rbenv/shims/bundle exec rspec spec/ --format documentation
/root/.rbenv/shims/rails s -b 0.0.0.0
