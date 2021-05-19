# pulsar-issue-6054-repro

Repro case for [apache/pulsar#6054](https://github.com/apache/pulsar/issues/6054)

## Repro scenario

There are 3 topics:
* random1-in
* random2-in
* random3-in

And 2 functions:
* random1, input topic: random1-in, output topic: random2-in
* random2, input topic: random2-in, output topic: random3-in

These functions use the [RandomFilterFunction](random-filter-function/src/main/java/com/github/lhotari/pulsar/RandomFilterFunction.java) implementation that sends the input to the output topic with a given probability (0.5 by default).

`pulsar-perf produce` is used to feed the random1-in topic. `pulsar-perf consume` is used to consume messages from the random3-in topic.

## Preparation

Make sure that `pulsar-admin` is in the `PATH` and that Pulsar connection setting are configured in `conf/client.conf` (under the Pulsar installation directory) or `PULSAR_CLIENT_CONF` environment variable points to a `client.conf` file for the desired target environment.

### Create partitioned topics

```bash
./create_topics.sh
```

### Deploying the function chain


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
