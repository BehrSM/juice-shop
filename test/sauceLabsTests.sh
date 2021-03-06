#!/usr/bin/env bash
if [ "$TRAVIS_NODE_VERSION" == "6" ]; then
    if [ "$TRAVIS_PULL_REQUEST" == "false" -o "$TRAVIS_BRANCH" == "master" -a "$TRAVIS_PULL_REQUEST" != "false" ]; then
        echo -e "\033[1;33mRunning unit tests on SauceLabs...\033[0m"
        karma start karma.conf-ci.js
        echo -e "\033[1;33mRunning e2e tests on SauceLabs...\033[0m"
        npm run protractor
    else
        echo -e "\033[0;33mSkipping SauceLabs tests for PR #$TRAVIS_PULL_REQUEST onto $TRAVIS_BRANCH branch (only executed for PRs onto master)\033[0m"
    fi
  else
    echo -e "\033[0;33mSkipping SauceLabs tests for Node.js v$TRAVIS_NODE_VERSION (only executed on v6)\033[0m"
  fi