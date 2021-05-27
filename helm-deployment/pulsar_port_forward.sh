#!/bin/bash
kubectl port-forward -n pulsar-testenv pod/pulsar-testenv-deployment-broker-0 6650 8080