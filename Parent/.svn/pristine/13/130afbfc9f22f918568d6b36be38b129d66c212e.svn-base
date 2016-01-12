package com.tms.calculator.scripts;

import com.tms.calculator.context.Context;
import com.tms.entity.CalStates;
import org.junit.Test;

import static junit.framework.TestCase.assertEquals;


/**
 * Created by larry on 15/6/6.
 */
public class GroovyCalEngineTest  {
    @Test
    public void testRun(){
        GroovyCalEngine groovyEngine = new GroovyCalEngine("def doIt(state){return \"$state\"}");

        groovyEngine.setCtx(null);

        CalStates cs = groovyEngine.run();

        assertEquals(cs, CalStates.COMPLETED);
    }

}
