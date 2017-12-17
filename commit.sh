#! /usr/bin/env sh

cd tba-api-client-$OUTLANG

git add .

git commit -m "Updating to API version $APIVERSION"

git tag -a v$APIVERSION -m "Travis build: $TRAVIS_BUILD_NUMBER - API version $APIVERSION"

git push --tags origin master

cd ..