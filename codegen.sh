#! /usr/bin/env bash

if [[ "$OUTLANG"=="swift" ]]; then export GENLANG="swift4"
else export GENLANG="$OUTLANG"
fi

echo $OUTLANG
echo $GENLANG

export OPTIONS="-i $SPEC_FILE -g $GENLANG -o $REPO_NAME -c configs/$OUTLANG-config.json --skip-validate-spec"


export OPTIONS="$OPTIONS --additional-properties packageVersion=$APIVERSION"
echo $OPTIONS
echo $APIVERSION
openapi-generator generate $OPTIONS

ls -al $REPO_NAME
