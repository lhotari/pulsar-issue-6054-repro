#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

cd "$SCRIPT_DIR"

function delete_function() {
    (
    local funcnumber=$1
    local name="random${funcnumber}"
    set -x
    pulsar-admin functions delete \
      --name $name
    )
}

delete_function 1
delete_function 2