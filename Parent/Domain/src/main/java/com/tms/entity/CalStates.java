package com.tms.entity;

import com.google.common.collect.Maps;
import java.util.Map;

/**
 */
public enum CalStates {

    START("start"),
    BEFORE_ROUND("before_round"),
    ROUNDED("rounded"),
    BEFORE_MATCH("before_match"),
    MATCHED("matched"),
    BEFORE_CALC("before_calc"),
    CALCULATED("calculated"),
    EXCEPTION("exception"),
    COMPLETED("completed"),
    ;

    private String state;

    private CalStates(String state) {
        this.state = state;

    }


    public String toString(){
        return this.state;
    }

    // Implementing a fromString method on an enum type
    private static final Map<String, CalStates> stringToEnum = Maps.newHashMap();
    static {
        // Initialize map from constant name to enum constant
        for(CalStates blah : values()) {
            stringToEnum.put(blah.toString(), blah);
        }
    }

    // Returns Blah for string, or null if string is invalid
    public static CalStates accept(String symbol) {
        return stringToEnum.get(symbol);
    }


}
