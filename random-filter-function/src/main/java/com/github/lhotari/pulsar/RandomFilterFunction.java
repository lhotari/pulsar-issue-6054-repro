package com.github.lhotari.pulsar;

import java.util.Random;
import org.apache.pulsar.functions.api.Context;
import org.apache.pulsar.functions.api.Function;

/**
 * Dummy function that passes input to the output topic with a probability defined in "pass-fraction" user config
 * value.
 *
 * Author: Devin G. Bost
 * Source: https://github.com/apache/pulsar/issues/6054#issuecomment-843675423
 */
public class RandomFilterFunction implements Function<String, String> {

    private Random rand = new Random();

    @Override
    public String process(String input, Context context) {
        double passFraction = Double.parseDouble((String) context.getUserConfigValueOrDefault("pass-fraction", "0.5"));
        if (rand.nextDouble() < passFraction) {
            return input;
        } else {
            return null;
        }
    }
}