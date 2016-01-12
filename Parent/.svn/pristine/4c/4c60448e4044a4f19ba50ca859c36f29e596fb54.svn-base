package com.tms.calculator.scripts;

import com.tms.calculator.context.Context;
import com.tms.entity.CalStates;

import javax.script.*;
import java.util.Date;

/**
 * Created by larry on 15/5/30.
 */
public class GroovyCalEngine extends CalEngine {

    ScriptEngine engine = null;

   public GroovyCalEngine(String expression){
       eval(expression);

   }


    public CalStates run(){


        CalStates runResultState = null;

        //FIXME: use context instead
        Object[] params = {new String("completed")};

        try {
            Object state = ((Invocable)engine).invokeFunction(SCRIPT_FUNCTION_NAME, params);

            runResultState = CalStates.accept(state.toString());

            if(runResultState == null){
                throw new RuntimeException(String.format("invalid state {}",state));
            }
            return runResultState;

        } catch (ScriptException e) {
            throw new RuntimeException(e);
        } catch (NoSuchMethodException e) {
            throw new RuntimeException(e);
        }

    }

    private void eval(String expression){
        ScriptEngineManager factory = new ScriptEngineManager();
        engine = factory.getEngineByName("groovy");

        assert engine != null;

        try {
            engine.eval(expression);
        } catch (ScriptException e) {
            throw new RuntimeException(e);
        }

    }
}
