#!/bin/bash
topics=("random1-in" "random2-in" "random3-in")
for topic in "${topics[@]}"; do
  topic_name=persistent://public/default/$topic
  echo "Deleting possible existing ${topic_name}"
  pulsar-admin topics delete -f "${topic_name}"
  pulsar-admin topics delete-partitioned-topic -f "${topic_name}"
  echo "Creating topic ${topic_name}"
  pulsar-admin topics create-partitioned-topic -p 4 "${topic_name}"
done
