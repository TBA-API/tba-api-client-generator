#! /usr/bin/env bash

python3 swiftenv.py

export GENLANG=$(cat genlang)

export OPTIONS="-i $SPEC_FILE -g $GENLANG -o $REPO_NAME -c configs/$OUTLANG-config.json --skip-validate-spec"

if [ "$GENLANG" = "dart" ]; then
    export OPTIONS="$OPTIONS --additional-properties pubVersion=$APIVERSION"
else
    export OPTIONS="$OPTIONS --additional-properties packageVersion=$APIVERSION"
fi
echo $OPTIONS
echo $APIVERSION
openapi-generator generate $OPTIONS

ls -al $REPO_NAME
