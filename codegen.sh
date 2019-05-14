#! /usr/bin/env bash
if [[ "$OUTLANG"==="swift" ]]  ; then
  export GENLANG="swift4"
else
  export GENLANG="$OUTLANG"
fi
export OPTIONS="-i $SPEC_FILE -g $GENLANG -o $REPO_NAME -c configs/$OUTLANG-config.json --skip-validate-spec"


if [[ "$OUTLANG"==="python" || "$OUTLANG"==="csharp" || "$OUTLANG"==="go" ]] ; then
  export OPTIONS="$OPTIONS --package-version $APIVERSION"
elif [[ "$OUTLANG"==="javascript" ]]; then
  export OPTIONS="$OPTIONS --project-version $APIVERSION"
elif [[ "$OUTLANG"==="swift" ]]; then
  export OPTIONS="$OPTIONS --pod-version $APIVERSION"
elif [[ "$OUTLANG"==="ruby" ]]; then
    export OPTIONS="$OPTIONS --gem-version $APIVERSION"
else
  export OPTIONS="$OPTIONS --artifact-version $APIVERSION"
fi
echo $OPTIONS
echo $APIVERSION
openapi-generator generate $OPTIONS

ls -al $REPO_NAME
