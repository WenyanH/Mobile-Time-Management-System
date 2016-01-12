package com.tms.utils;

import java.util.regex.Pattern;

/**
 * @author zwq
 *
 */
public class ProcessSignUtil {
	public static String S_SIGN=",";
	ProcessSignUtil() {

	}   
	public static ProcessSignUtils instance = null;
	 //单例模式
	 public static ProcessSignUtils getInstance(){
	    	if(instance==null){
	    			instance=new ProcessSignUtils();
	    	}
	        return instance;
	    }
	 
	 /** 分割 "," 返回字符串数组
	 * @param strIds
	 * @return result
	 * @throws Exception 异常
	 */
	public String[] processComma(final String strIds) throws Exception{
		 String[] result = null;
		 Pattern pt = Pattern.compile(S_SIGN);
		 result = pt.split(strIds);		 
		 return result;
	 }
}
