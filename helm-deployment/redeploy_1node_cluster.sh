#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
$SCRIPT_DIR/delete_deployment.sh || exit 1
. $SCRIPT_DIR/test-env.env
echo 'Installing 1node cluster'
helm upgrade --install --namespace "${DEPLOYMENT_NAMESPACE}" --create-namespace -f $SCRIPT_DIR/1node_values.yaml -f $SCRIPT_DIR/custom_values.yaml --set initialize=true "${DEPLOYMENT_NAME}" apache/pulsar