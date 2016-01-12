package com.tms.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;



public class Misc
{
	public static final Timestamp MIN_TIMESTAMP = getMinTimestamp();
	
	public static final int SEVENDAYMINITES=1*24*60;
	public static final String CLIENT_INVALID_DATE= "2099-12-31"; 
	/**
	 * Use Calendar to get current timestamp.
	 * 
	 * @return current timestamp
	 */
	public static Timestamp getCurrentTimestamp() throws RuntimeException
	{
		Calendar cal = Calendar.getInstance();
		Timestamp ts = new Timestamp(cal.getTimeInMillis());
		return ts;
	}

	public static Timestamp getTenMinutesAgo() throws RuntimeException
	{
		return advanceInMinutes(getCurrentTimestamp(), -10);
	}

	public static Timestamp advanceInMinutes(Timestamp timestamp, int minutes)
			throws RuntimeException
	{
		if(timestamp==null)
			timestamp=getMinTimestamp();
		long mils = timestamp.getTime();
		mils += minutes * 60 * 1000;
		return new Timestamp(mils); //To change body of created methods use
		// File | Settings | File Templates.
	}

	public static Timestamp calToTimestamp(Calendar calendar)
			throws RuntimeException
	{
		return new Timestamp(calendar.getTimeInMillis());
	}

	/**
	 * Get minimax timestamp(1930-01-01 00:00:00).
	 * 
	 * @return minimax timestamp
	 */
	public static Timestamp getMinTimestamp() throws RuntimeException
	{
		Timestamp ts = Timestamp.valueOf("1930-01-01 00:00:00");
		return ts;
	}

	/*
	 * zwq  add
	 */

	public static String getSystemDateTimeForzwq() throws RuntimeException
	{
		Calendar cal = Calendar.getInstance();
		StringBuffer sb = new StringBuffer();
		sb.append(cal.get(Calendar.YEAR));
		//sb.append("-");
		sb.append(cal.get(Calendar.MONTH) + 1);
		//sb.append("-");
		sb.append(cal.get(Calendar.DAY_OF_MONTH));
		sb.append("_");
		sb.append(cal.get(Calendar.HOUR_OF_DAY));
		sb.append("_");
		sb.append(cal.get(Calendar.MINUTE));
		sb.append("_");
		sb.append(cal.get(Calendar.SECOND));
		return sb.toString();
	}

	public static String getSystemDateTime() throws RuntimeException
	{
		Calendar cal = Calendar.getInstance();
		StringBuffer sb = new StringBuffer();
		sb.append(cal.get(Calendar.YEAR));
		sb.append("-");
		sb.append(cal.get(Calendar.MONTH) + 1);
		sb.append("-");
		sb.append(cal.get(Calendar.DAY_OF_MONTH));
		sb.append(" ");
		sb.append(cal.get(Calendar.HOUR_OF_DAY));
		sb.append(":");
		sb.append(cal.get(Calendar.MINUTE));
		sb.append(":");
		sb.append(cal.get(Calendar.SECOND));
		return sb.toString();
	}

	/**
	 * 取得系统当前时间减去30分钟的时间
	 * 
	 * @return String
	 */
	public static String getSystemDateTimeAddThirty()
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MINUTE, -30);
		StringBuffer sb = new StringBuffer();
		sb.append(cal.get(Calendar.YEAR));
		sb.append("-");
		sb.append(cal.get(Calendar.MONTH) + 1);
		sb.append("-");
		sb.append(cal.get(Calendar.DAY_OF_MONTH));
		sb.append(" ");
		sb.append(cal.get(Calendar.HOUR_OF_DAY));
		sb.append(":");
		sb.append(cal.get(Calendar.MINUTE));
		sb.append(":");
		sb.append(cal.get(Calendar.SECOND));
		return sb.toString();
	}

	/**
	 * 比较两个时间大小
	 * 
	 * @param time
	 * @param compareTime
	 * @return 如果time大于compareTime 则返回true否则返回false
	 * @throws RuntimeException
	 */
	public static boolean compareTime(String time, String compareTime)
			throws RuntimeException
	{
		if (time == null)
		{
			throw new RuntimeException(" cause ---- time is null");
		}
		if (compareTime == null)
		{
			throw new RuntimeException(" cause ---- compareTime is null");
		}
		String[] tempTime = time.split(" ");
		String[] tempCompareTime = compareTime.split(" ");
		if (tempTime.length != 2)
		{
			throw new RuntimeException(" cause ---- time is wrong");
		}
		if (tempCompareTime.length != 2)
		{
			throw new RuntimeException(" cause ---- compareTime is wrong");
		}
		String[] tempDateTime = tempTime[0].split("-");
		String[] tempDateCompareTime = tempCompareTime[0].split("-");
		if (tempDateTime.length != 3)
		{
			throw new RuntimeException(" cause ---- time is wrong");
		}
		if (tempDateCompareTime.length != 3)
		{
			throw new RuntimeException(" cause ---- compareTime is wrong");
		}
		String[] tempTimeTime = tempTime[1].split(":");
		String[] tempTimeCompareTime = tempCompareTime[1].split(":");
		if (tempTimeTime.length != 3)
		{
			throw new RuntimeException(" cause ---- time is wrong");
		}
		if (tempTimeCompareTime.length != 3)
		{
			throw new RuntimeException(" cause ---- compareTime is wrong");
		}
		try
		{
			if (Integer.parseInt(tempDateTime[0]) > Integer
					.parseInt(tempDateCompareTime[0]))
			{
				return true;
			}
			if (Integer.parseInt(tempDateTime[0]) < Integer
					.parseInt(tempDateCompareTime[0]))
			{
				return false;
			}
			if (Integer.parseInt(tempDateTime[1]) > Integer
					.parseInt(tempDateCompareTime[1]))
			{
				return true;
			}
			if (Integer.parseInt(tempDateTime[1]) < Integer
					.parseInt(tempDateCompareTime[1]))
			{
				return false;
			}
			if (Integer.parseInt(tempDateTime[2]) > Integer
					.parseInt(tempDateCompareTime[2]))
			{
				return true;
			}
			if (Integer.parseInt(tempDateTime[2]) < Integer
					.parseInt(tempDateCompareTime[2]))
			{
				return false;
			}
			if (Integer.parseInt(tempTimeTime[0]) > Integer
					.parseInt(tempTimeCompareTime[0]))
			{
				return true;
			}
			if (Integer.parseInt(tempTimeTime[0]) < Integer
					.parseInt(tempTimeCompareTime[0]))
			{
				return false;
			}
			if (Integer.parseInt(tempTimeTime[1]) > Integer
					.parseInt(tempTimeCompareTime[1]))
			{
				return true;
			}
			if (Integer.parseInt(tempTimeTime[1]) < Integer
					.parseInt(tempTimeCompareTime[1]))
			{
				return false;
			}
			if (Integer.parseInt(tempTimeTime[2]) > Integer
					.parseInt(tempTimeCompareTime[2]))
			{
				return true;
			}
			if (Integer.parseInt(tempTimeTime[2]) < Integer
					.parseInt(tempTimeCompareTime[2]))
			{
				return false;
			}
		} catch (Exception ex)
		{
			throw new RuntimeException(ex);
		}
		return false;
	}

	/**
	 * 系统当前时间减去30天
	 * 
	 * @return
	 */
	public static String getSystempDateTimeReduceThirty()
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_MONTH, -30);
		StringBuffer sb = new StringBuffer();
		sb.append(cal.get(Calendar.YEAR));
		sb.append("-");
		sb.append(cal.get(Calendar.MONTH) + 1);
		sb.append("-");
		sb.append(cal.get(Calendar.DAY_OF_MONTH));
		sb.append(" ");
		sb.append(cal.get(Calendar.HOUR_OF_DAY));
		sb.append(":");
		sb.append(cal.get(Calendar.MINUTE));
		sb.append(":");
		sb.append(cal.get(Calendar.SECOND));
		return sb.toString();
	}
	
	/**
	 * 系统当前时间减去指定天数
	 * 
	 * @return
	 */
	public static String getSystempDateTimeReduce(int days)
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_MONTH, days);
		StringBuffer sb = new StringBuffer();
		sb.append(cal.get(Calendar.YEAR));
		sb.append("-");
		sb.append(cal.get(Calendar.MONTH) + 1);
		sb.append("-");
		sb.append(cal.get(Calendar.DAY_OF_MONTH));
		sb.append(" ");
		sb.append(cal.get(Calendar.HOUR_OF_DAY));
		sb.append(":");
		sb.append(cal.get(Calendar.MINUTE));
		sb.append(":");
		sb.append(cal.get(Calendar.SECOND));
		return sb.toString();
	}

	public static String getSystempDateTimeMONTHReduceThree()
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, -3);
		StringBuffer sb = new StringBuffer();
		sb.append(cal.get(Calendar.YEAR));
		sb.append("-");
		sb.append(cal.get(Calendar.MONTH) + 1);
		sb.append("-");
		sb.append(cal.get(Calendar.DAY_OF_MONTH));
		sb.append(" ");
		sb.append(cal.get(Calendar.HOUR_OF_DAY));
		sb.append(":");
		sb.append(cal.get(Calendar.MINUTE));
		sb.append(":");
		sb.append(cal.get(Calendar.SECOND));
		return sb.toString();
	}

	public static String getSystemDateTime(Timestamp time) throws RuntimeException
	{
		if (time == null)
			return "";
		else
		{
			Calendar cal = Calendar.getInstance();
			cal.setTimeInMillis(time.getTime());
			if (cal.get(Calendar.YEAR)<1931 )
				return "";
			else
				return time.toString();
		}
	}

	public static Timestamp stringToTimestamp(String time) throws RuntimeException
	{
		try
		{
			Timestamp ts = Timestamp.valueOf(time);
			return ts;
		} catch (Exception e)
		{
			return Misc.getMinTimestamp();
		}
	}

	public static StringBuffer getUniqString(String pre) throws RuntimeException
	{
		StringBuffer sb = new StringBuffer(pre);
		sb.append(System.currentTimeMillis());
		return sb;
	}

	public static String attrString(String value) throws RuntimeException
	{
		return value == null ? "" : value.replaceAll("`", "`~").replaceAll(
				"\r", "").replaceAll("\n", "`n");
	}

	public static String getDatimeString(String datime) throws RuntimeException
	{
		// 判断如果生日不合法则将值设为客户端默认的值 2099-12-31。
		try
		{
			String[] birthdaySplit=datime.split("-");
			if(Integer.parseInt(birthdaySplit[0])<1930 || Integer.parseInt(birthdaySplit[0])>2090)	
				return CLIENT_INVALID_DATE; 
			else
				return datime;
		} 
		catch (Exception ex) 
		{			
			//e1.printStackTrace();
			return CLIENT_INVALID_DATE; 
		}		
	}

	public static String getDate() throws RuntimeException
	{
		String temp = getSystemDateTime();
		int index = temp.indexOf(" ");
		temp = temp.substring(0, index);
		if ("".equals(temp))
		{
			throw new RuntimeException();
		} else
		{
			return temp;
		}
	}
	
	public static String offSetDate(final String date,int days){
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
		String[] myDay = date.split("-");
		GregorianCalendar greCalendear = new GregorianCalendar();
		greCalendear.set(Calendar.YEAR,Integer.parseInt(myDay[0]));
		greCalendear.set(Calendar.MONTH,Integer.parseInt(myDay[1])-1);
		greCalendear.set(Calendar.DAY_OF_MONTH,Integer.parseInt(myDay[2]));
		//System.out.println(df.format(greCalendear.getTime()));
		int day = greCalendear.get(Calendar.DAY_OF_MONTH);
		day+=days;
		greCalendear.set(Calendar.DAY_OF_MONTH,day);
		return df.format(greCalendear.getTime());
	}
	
	/**
	 * 对传入时戳的时间提前或者延迟相应的秒数
	 * 
	 * @param timestamp
	 * @return
	 */
	public static Timestamp offsetTimestamp(final Timestamp timestamp,
			int offset)
	{
		GregorianCalendar greCalendear = null;
		Calendar cal = Calendar.getInstance();

		cal.setTimeInMillis(timestamp.getTime());

		greCalendear = new GregorianCalendar(cal.get(Calendar.YEAR), cal
				.get(Calendar.MONTH), cal.get(Calendar.DATE), cal
				.get(Calendar.HOUR_OF_DAY), cal.get(Calendar.MINUTE), cal
				.get(Calendar.SECOND));
		
		greCalendear.add(Calendar.SECOND, offset); //偏移指定的秒

		return new Timestamp(greCalendear.getTimeInMillis());

	}
	
	public static boolean  validateDate(String date){
		boolean flag = true;
		if(date == null || "0000-00-00".equals(date) || "0000-00-00 00:00:00".equals(date)){
			flag = false;
		} 
		return flag;
	}
	
	public static String getForumNumber(String s,long l){
		String n = Long.valueOf(l).toString();
		return s+n;
	}
	
	/**
	 * 取得系统当前时间减去24小时
	 * 
	 * @return String
	 */
	public static String getSystemDateTime24()
	{
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.HOUR_OF_DAY, -24);
		StringBuffer sb = new StringBuffer();
		sb.append(cal.get(Calendar.YEAR));
		sb.append("-");
		sb.append(cal.get(Calendar.MONTH) + 1);
		sb.append("-");
		sb.append(cal.get(Calendar.DAY_OF_MONTH));
		sb.append(" ");
		sb.append(cal.get(Calendar.HOUR_OF_DAY));
		sb.append(":");
		sb.append(cal.get(Calendar.MINUTE));
		sb.append(":");
		sb.append(cal.get(Calendar.SECOND));
		return sb.toString();
	}
	
	public static String getFormattedDateUtil(java.util.Date dtDate, String strFormatTo)
	{
		if (dtDate == null)
		{
			return "";
		}
		strFormatTo = strFormatTo.replace('/', '-');
		try
		{
			SimpleDateFormat formatter = new SimpleDateFormat(strFormatTo);
			return formatter.format(dtDate);
		}
		catch (Exception e)
		{
			//Common.printLog("转换日期字符串格式时出错;" + e.getMessage());
			return "";
		}
	}
}

