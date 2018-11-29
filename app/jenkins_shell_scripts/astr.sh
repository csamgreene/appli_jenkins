#!/bin/bash -l
cd .
rvm use 2.3

gem install bundler
bundle install

cd config/astr-hello
java -jar ../../lib/ApplitoolsSimpleTestRunner.jar job.xml