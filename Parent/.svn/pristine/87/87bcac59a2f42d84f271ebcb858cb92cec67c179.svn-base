package com.tms.calculator.utils;

import scala.concurrent.duration.Duration;
import scala.concurrent.duration.FiniteDuration;
import akka.actor.ActorRef;
import akka.actor.ActorSystem;
import akka.actor.Cancellable;

import com.tms.calculator.actors.msg.ScheCommands;

public class ActorUtil {

	private static final ActorUtil util = new ActorUtil();

	private final ActorSystem system = ActorSystem.create("Calculators");

	private ActorUtil() {

	}

	public static final ActorUtil getInstance() {
		return util;
	}

	public ActorSystem getActorSystem() {
		return system;
	}

	public Cancellable runScheduler(FiniteDuration interval, ActorRef task) {
		return system.scheduler().schedule(Duration.Zero(), interval, task, ScheCommands.START, system.dispatcher(), null);
	}
}
