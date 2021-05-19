# pulsar-issue-6054-repro

Repro case for [apache/pulsar#6054](https://github.com/apache/pulsar/issues/6054)

## Deploying the function chain

Make sure that pulsar-admin is in the PATH and that Pulsar connection setting are configured in `conf/client.conf` (under the Pulsar installation directory).

Deploy the function chain with this command:

```bash
./deploy_function_chain.sh
```

## Running the scenario

### Producing messages

this produces messages to the `persistent://public/default/random1-in` input topic

```bash
./produce.sh
```

### Consuming messages

this consumes messages from the `persistent://public/default/random3-in` topic

```bash
./consume.sh
```
