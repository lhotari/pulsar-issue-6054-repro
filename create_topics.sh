#!/bin/bash
pulsar-admin topics create-partitioned-topic -p 16 persistent://public/default/random1-in
pulsar-admin topics create-partitioned-topic -p 8 persistent://public/default/random2-in
pulsar-admin topics create-partitioned-topic -p 4 persistent://public/default/random3-in
