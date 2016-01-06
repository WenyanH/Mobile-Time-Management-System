package com.tms.calculator.scripts;

import com.tms.entity.CalStates;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by larry on 15/5/30.
 */
public class NilCalEngine extends CalEngine {

    private static final Logger LOG = LoggerFactory.getLogger(NilCalEngine.class);

    public CalStates run(){

        LOG.info("NilScriptEngine with state {}");
        return null;

    }
}
