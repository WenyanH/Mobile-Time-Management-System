package com.tms.entity;

/**
 */
public enum ScriptEngineEnum {
    JAVASCRIPT("javascript"),
    GROOVY("groovy");

    private String script;

    private ScriptEngineEnum(String script){
        this.script = script;

    }
    public String toString(){
        return this.script;
    }

}
