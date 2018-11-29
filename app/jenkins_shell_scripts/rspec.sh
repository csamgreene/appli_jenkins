#!/bin/bash -l
cd .
rvm use 2.3

gem install bundler
bundle install
bundle exec rspec