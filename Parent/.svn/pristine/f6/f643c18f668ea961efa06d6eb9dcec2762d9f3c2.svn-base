package com.tms.calculator.actors;

import com.tms.calculator.actors.msg.ScheCommands;

import akka.actor.UntypedActor;

public class SchedulerSupervisor extends UntypedActor {

	@Override
	public void onReceive(Object message) throws Exception {

		if (ScheCommands.START.equals(message)) {
			System.err.println("scheduler cal start");
		} else {
			unhandled(message);
		}

	}

}
