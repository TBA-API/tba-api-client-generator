#! /usr/bin/env sh

export SWGR_PATH="https://www.thebluealliance.com/swagger/api_v3.json"
export OUT_PATH="tba-api-client-$OUTLANG"

mkdir -p $OUT_PATH

export OPTIONS="-i $SWGR_PATH -l $OUTLANG -o $OUT_PATH -c configs/$OUTLANG-config.json"

if [ "$OUTLANG" = "python" ] ; then
  export OPTIONS="$OPTIONS --package-version $APIVERSION"
else
  export OPTIONS="$OPTIONS --artifact-version $APIVERSION"
fi

java -jar swagger-codegen-cli.jar generate $OPTIONS

ls -al tba-api-client-$OUTLANG
