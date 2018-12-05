#!/bin/bash -l
cd .
rvm use 2.3

gem install bundler
bundle install

bundle exec rake ci:bump_build # Adds git tag for each successful build
bundle exec rspec --format RspecJunitFormatter --out rspec.xml. #Formats output in a format Jenkins can understand