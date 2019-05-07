#! /usr/bin/env sh
if [ "$OUTLANG" = "swift" ] ; then
  export GENLANG="swift4"
else
  export GENLANG="$OUTLANG"
fi
export OPTIONS="-i $SPEC_FILE -g $GENLANG -o $REPO_NAME -c configs/$OUTLANG-config.json --skip-validate-spec"


#if [ "$OUTLANG" = "python" ] ; then
#  export OPTIONS="$OPTIONS --package-version $APIVERSION"
#else
  export OPTIONS="$OPTIONS --artifact-version $APIVERSION"
#fi
echo $OPTIONS
echo $APIVERSION
echo $APIVERSION > $REPO_NAME/api_version.txt
java -jar openapi-generator-cli.jar generate $OPTIONS

ls -al $REPO_NAME
