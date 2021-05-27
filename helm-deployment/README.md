# Helm deployment

## Preparation

```
helm repo add apache https://pulsar.apache.org/charts
```

## Deployment 

```
./redeploy_1node_cluster.sh
```

## Portforwarding to use pulsar-admin & pulsar-perf

this assumes that ports 8080 and 6650 are available for use.

```
./pulsar_port_forward.sh
```

set `PULSAR_CLIENT_CONF` environment variable that contains the settings:
```
export PULSAR_CLIENT_CONF=$PWD/client.conf
```

Now `pulsar-admin` and `pulsar-perf` should use the cluster over the forwarded ports.
