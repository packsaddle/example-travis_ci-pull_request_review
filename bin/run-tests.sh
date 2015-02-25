#!/bin/bash
set -v
if [ -n "${TRAVIS_PULL_REQUEST}" ] && [ "${TRAVIS_PULL_REQUEST}" != "false" ]; then
  # Travis-CI
  #
  # git clone --depth=50 \
  # git://github.com/packsaddle/example-ruby-travis-ci.git \
  # packsaddle/example-ruby-travis-ci
  # cd packsaddle/example-ruby-travis-ci
  # git fetch origin +refs/pull/1/merge:
  # git checkout -qf FETCH_HEAD

  gem install --no-document rubocop-select rubocop rubocop-checkstyle_formatter \
              checkstyle_filter-git saddler saddler-reporter-github

  git diff -z --name-only origin/master

  git diff -z --name-only origin/master \
   | xargs -0 rubocop-select

  git diff -z --name-only origin/master \
   | xargs -0 rubocop-select \
   | xargs rubocop \
       --require rubocop/formatter/checkstyle_formatter \
       --format RuboCop::Formatter::CheckstyleFormatter

  git diff -z --name-only origin/master \
   | xargs -0 rubocop-select \
   | xargs rubocop \
       --require rubocop/formatter/checkstyle_formatter \
       --format RuboCop::Formatter::CheckstyleFormatter \
   | checkstyle_filter-git diff origin/master

  git diff -z --name-only origin/master \
   | xargs -0 rubocop-select \
   | xargs rubocop \
       --require rubocop/formatter/checkstyle_formatter \
       --format RuboCop::Formatter::CheckstyleFormatter \
   | checkstyle_filter-git diff origin/master \
   | saddler report \
      --require saddler/reporter/github \
      --reporter Saddler::Reporter::Github::PullRequestReviewComment
fi
bundle exec rake
