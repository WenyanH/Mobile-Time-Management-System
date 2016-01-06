package com.tms.calculator;

import java.util.concurrent.TimeUnit;

import scala.concurrent.duration.FiniteDuration;
import akka.actor.ActorRef;
import akka.actor.Props;

import com.tms.calculator.actors.SchedulerSupervisor;
import com.tms.calculator.context.Context;
import com.tms.calculator.service.ServiceLocator;
import com.tms.calculator.utils.ActorUtil;
import com.tms.calculator.utils.ActorUtil;

public class Server {

	private ActorUtil actorUtil = ActorUtil.getInstance();

	public static void main(String[] args) {

		Server server = new Server();
		server.init();

	}

	private void init() {
		
		//Init service locator
		ServiceLocator.getInstance();
		
		//Load Company Context
		Context.getInstance();
		
		// Startup calculate scheduler
		initScheduler();

		// Startup REST for calculate immediately
		initRESTService();

	}

	private void initRESTService() {

	}

	private void initScheduler() {

		FiniteDuration interval = FiniteDuration.create(6, TimeUnit.HOURS);

		ActorRef schedulerSupervisor = actorUtil.getActorSystem().actorOf(Props.create(SchedulerSupervisor.class));

		actorUtil.runScheduler(interval, schedulerSupervisor);
	}

}