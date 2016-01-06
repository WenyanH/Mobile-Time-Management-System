package com.tms.calculator.utils;

import java.util.Calendar;
import java.util.Date;

public class DateUtil {

	private static DateUtil util = new DateUtil();

	private DateUtil() {

	}

	public static final DateUtil getInstance() {
		return util;
	}

	public boolean isSameDay(Date day, Date day2) {

		Calendar cal1 = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		cal1.setTime(day);
		cal2.setTime(day2);

		return cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR) && cal1.get(Calendar.DAY_OF_YEAR) == cal2.get(Calendar.DAY_OF_YEAR);		
	}

}
