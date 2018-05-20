#! /usr/bin/env sh

export OPTIONS="-i $SPEC_FILE -l $OUTLANG -o $REPO_NAME -c configs/$OUTLANG-config.json"

#if [ "$OUTLANG" = "python" ] ; then
#  export OPTIONS="$OPTIONS --package-version $APIVERSION"
#else
  export OPTIONS="$OPTIONS --artifact-version $APIVERSION"
#fi
echo $OPTIONS
echo $APIVERSION
java -jar swagger-codegen-cli.jar generate $OPTIONS

ls -al $REPO_NAME
