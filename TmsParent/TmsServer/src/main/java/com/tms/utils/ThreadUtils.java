package com.tms.utils;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class ThreadUtils {

	private static final ExecutorService executors = Executors.newFixedThreadPool(Runtime.getRuntime().availableProcessors() * 2 - 1);

	public static final <T> Future<T> run(Callable<T> worker) {
		return executors.submit(worker);
	}

	public static final void run(Runnable worker) {
		executors.submit(worker);
	}

}
