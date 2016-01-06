package com.tms.calculator.scripts;

import com.tms.calculator.context.Context;
import com.tms.entity.CalStates;

/**
 */
public abstract class CalEngine {

    public static final String SCRIPT_FUNCTION_NAME = "doIt";

    private Context ctx = null;



    /**
     * the states will implies the next action
     * @return
     */
    public abstract CalStates run();

    public void setCtx(Context ctx) {
        this.ctx = ctx;
    }

}
