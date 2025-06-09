#!/usr/bin/env bash

set -o errexit

bundle install
bundle config set frozen false
bin/rails assets:precompile
bin/rails assets:clean

bin/rails db:migrate
