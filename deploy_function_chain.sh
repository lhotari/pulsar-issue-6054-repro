#!/bin/bash -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

cd "$SCRIPT_DIR"

if [ ! -f random-filter-function/target/random-filter-function-1.0-SNAPSHOT.jar ]; then
    (
        cd "${SCRIPT_DIR}/random-filter-function"
        mvn package
    )
fi

function deploy_function() {
    (
    local funcnumber=$1
    local fraction=${2:-0.5}
    local name="random${funcnumber}"
    local nextname="random$((funcnumber + 1))"

    echo "Deploying $name"
    set -x
    pulsar-admin functions create \
      --name $name --parallelism 4 \
      --inputs persistent://public/default/${name}-in \
      --output persistent://public/default/${nextname}-in \
      --jar "${SCRIPT_DIR}/random-filter-function/target/random-filter-function-1.0-SNAPSHOT.jar" \
      --classname com.github.lhotari.pulsar.RandomFilterFunction \
      --userConfig '{"pass-fraction":"'$fraction'"}'
    )
}

# deploy function chain
deploy_function 1 0.3
echo "Waiting 30 seconds before deploying next function (workaround for some bug in creating functions)"
sleep 30
deploy_function 2 0.5
