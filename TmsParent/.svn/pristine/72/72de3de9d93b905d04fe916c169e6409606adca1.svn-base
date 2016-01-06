package com.tms.calculator.scripts;

import com.google.common.collect.Maps;
import com.tms.calculator.actors.msg.CalMsg;
import com.tms.calculator.context.Context;
import com.tms.entity.CalStates;

import java.util.List;
import java.util.Map;

/**
 * Created by larry on 15/5/20.
 */
public class CalEngineHolder {


    Map<CalStates,CalEngine> engines = Maps.newHashMap();

    /**
     * get all script engine related to a user
     * @param msg
     * @param context
     * @return
     */
    public CalEngineHolder(CalMsg msg, Context context, String employeeID){

        List allScripts = null;


        String script = null;

        GroovyCalEngine gv = new GroovyCalEngine(script);


    }


    public void start(){
        CalStates calStates = engines.get(CalStates.START).run();

        while (CalStates.COMPLETED != calStates){
            run(calStates);
        }
    }

    private CalStates run(CalStates calStates){
        return engines.get(calStates.toString()).run();
    }

}

