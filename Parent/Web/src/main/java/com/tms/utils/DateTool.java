package com.tms.utils;
import java.text.*;    
import java.util.*;  

import org.apache.commons.lang.StringUtils;

/**
 * @author zwq  时区计算工具类
 *
 */
public class DateTool {
    public static final String DATE_FORMAT = "yyyy-MM-dd hh:mm:ss";  
       
 public static String dateTransformBetweenTimeZone(Date sourceDate, DateFormat formatter,  
        TimeZone sourceTimeZone, TimeZone targetTimeZone) {  
      Long targetTime = sourceDate.getTime() - sourceTimeZone.getRawOffset() + targetTimeZone.getRawOffset();  
        return getTime(new Date(targetTime), formatter);  
    }  
         
   public static String getTime(Date date, DateFormat formatter){  
       return formatter.format(date);  
    }  
         
    public static void main(String[] args){  
       DateFormat formatter = new SimpleDateFormat(DATE_FORMAT);  
       Date date = Calendar.getInstance().getTime();         
       System.out.println("firstDate="+formatter.format(date));
       System.out.println(dateTrans(date,"", "GMT+0800"));  
   } 
    
    /**
     * {method description}.
     * @param sourceDate  时间Date类型
     * @param sourceTime  源时区
     * @param targetTime   目的时区
     * @return 格式化后时间字符串
     */
    public  static String  dateTrans(Date sourceDate,String sourceTime,String targetTime){
        DateFormat formatter = new SimpleDateFormat(DATE_FORMAT);  
       TimeZone srcTimeZone =  getTimeZone(sourceTime);
       //System.out.println("源时区ID="+srcTimeZone.getID());
       TimeZone destTimeZone = getTimeZone(targetTime);
       //System.out.println("目的时区ID="+destTimeZone.getID());
        return dateTransformBetweenTimeZone(sourceDate, formatter, srcTimeZone, destTimeZone);
    }
    
    /**
     * 获取时区对象
     * @param str
     * @return
     */
    private static TimeZone getTimeZone(String str){
        TimeZone result=TimeZone.getDefault();
        if(StringUtils.isNotEmpty(str)){
            result= TimeZone.getTimeZone(str);  
        }       
        return result;
    }

}
