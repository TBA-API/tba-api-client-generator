#! /usr/bin/env sh

export SWGR_PATH="https://www.thebluealliance.com/swagger/api_v3.json"
export OUT_PATH="tba-api-client-$OUTLANG"
export PACKAGE="com.thebluealliance.api.v3"

mkdir -p $OUT_PATH

export OPTIONS="-i $SWGR_PATH -l $OUTLANG -o $OUT_PATH"

export OPTIONS="$OPTIONS -DhideGenerationTimestamp=true --api-package $PACKAGE --model-package $PACKAGE.model"

java -jar swagger-codegen-cli.jar generate $OPTIONS

ls -al tba-api-client-$OUTLANG
