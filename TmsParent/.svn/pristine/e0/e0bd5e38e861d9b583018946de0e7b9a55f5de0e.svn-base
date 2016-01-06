package com.tms.controller.base;

import java.beans.PropertyEditorSupport;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.NoSuchMessageException;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;


public class BaseController<Entity> extends MultiActionController {
	public final static String SUCCESS ="success";  
	
	public final static String MSG ="msg";  
	
	public final static String DATA ="data";  
	
	public final static String LOGOUT_FLAG = "logoutFlag";  
	
    @Autowired
    protected ApplicationContext ctx;
    
    private Integer DEFAULT_COUNT = 10;
    
    /**
     * 获取国际化.
     * 
     * @param key 国际化key
     * @return 国际化文本
     */
    public String getMessage(final String key) {
        try {
            return getWebApplicationContext().getMessage(key, null, null);
        } catch (NoSuchMessageException t_e) {
            return key;
        }
    }


    /**
     * 获取国际化.
     * 
     * @param key 国际化key
     * @param locale 语言
     * @return 国际化文本
     */
    public String getMessage(final String key, final Locale locale) {
        try {
            return getWebApplicationContext().getMessage(key, null, locale);
        } catch (NoSuchMessageException t_e) {
            return key;
        }
    }

    /**
     * 获取国际化.
     * 
     * @param key 国际化key
     * @param arguments 国际化文本中参数列表
     * @param locale 语言
     * @return 国际化文本
     */
    public String getMessage(final String key, final Object[] arguments, final Locale locale) {
        try {
            return getWebApplicationContext().getMessage(key, arguments, locale);
        } catch (NoSuchMessageException t_e) {
            return key;
        }
    }

    /**
     * 转换对象为JSON串
     * 
     * @param obj 被转换的对象
     * @return String JSON串
     */
    protected String toJson(final Object obj) {
        if (obj == null) {
            return "[]";
        }
        return JSONArray.fromObject(obj).toString();
    }


    /**
     * the next page number
     * 
     * @return
     */
    public int getPageNumber(HttpServletRequest request) {
        String page = request.getParameter("page");
        int pageNumber = 1;
        try {
            if (page != null && page.length() > 0) {
                pageNumber = Integer.parseInt(page);
            }
            if (pageNumber <= 0) {
                pageNumber = 1;
            }
        } catch (Exception e) {
        }
        return pageNumber;
    }
    
    public int getStartRow(HttpServletRequest request) {
        return this.getPageCount(request) * (this.getPageNumber(request) - 1);
    }
    
    /**
     * The number of displaying items per page. Returned value will more or equals
     * then <code>null</code> and less than value returnd by {@link #getMaxPossibleCount()}
     * @return
     */
    public int getPageCount(HttpServletRequest request) {
        return getCustomizePageCount(DEFAULT_COUNT,request);
    }

    /**
     * Page count from request parameter <code>count</code>. Returned value will more or equals
     * then <code>null</code> and less than value returnd by {@link #getMaxPossibleCount()}  
     * @param defaultCount value  for return if parameter <code>count</code> 
     * @return
     */
    public int getCustomizePageCount(int defaultCount,HttpServletRequest request) {
        String pageCount = request.getParameter("count");
        int count = defaultCount;
        try {
            if (pageCount != null && pageCount.length() > 0) {
                count = Integer.parseInt(pageCount);
            }
            if (count <= 0) {
                count = defaultCount;
            }
        } catch (Exception e) {
        }   
        
        if (count > DEFAULT_COUNT ) {
            count = DEFAULT_COUNT;    
        }
        return count;
    }

    public String getWebAppPath(HttpServletRequest request) {
        StringBuffer sb = new StringBuffer(request.getScheme() + ":" + "//"
                + request.getServerName() + ":" + request.getServerPort());
        sb.append(request.getContextPath());
        return sb.toString();
    }
    
    public void SaveFileFromInputStream(InputStream stream, String path, String filename) throws IOException {
        File file = new File(path);
        if (!file.isDirectory()){
            file.mkdir();
        }
        FileOutputStream fs = new FileOutputStream(path + "/" + filename);
        byte[] buffer = new byte[1024 * 1024];
        int bytesum = 0;
        int byteread = 0;
        while ((byteread = stream.read(buffer)) != -1) {
            bytesum += byteread;
            fs.write(buffer, 0, byteread);
            fs.flush();
        }
        fs.close();
        stream.close();
    }   
    

    public static Timestamp getCurrentTimestamp() throws RuntimeException {
        Calendar cal = Calendar.getInstance();
        Timestamp ts = new Timestamp(cal.getTimeInMillis());
        return ts;
    }
    
    public void downloadfile(String path, HttpServletResponse response) throws Exception {
        
            File file = new File(path);
            
            response.addHeader("Content-Disposition", "attachment; filename="
                    + new String(file.getName().getBytes(), "iso-8859-1"));
            response.setContentType("application/octet-stream");
            
            OutputStream out = response.getOutputStream();
           
            BufferedInputStream bin = new BufferedInputStream(new FileInputStream(path));
            byte[] buf = new byte[1024];
            int len = 0;
            while ((len = bin.read(buf)) > 0)
                out.write(buf, 0, len);
            out.close();
            bin.close();
        
    }
	/**
	 * 统一跳转页面
	 * @param viewName
	 * @param context
	 * @return
	 */
	public ModelAndView forword(String viewName,Map context){
		return new ModelAndView(viewName,context); 
	}
	 /**
	  * c 统一从这里获取
	  * @return
	  */
	public Map<String,Object> getRootMap(){
		Map<String,Object> rootMap = new HashMap<String, Object>();
		//添加url到 Map中
		//rootMap.putAll(URLUtils.getUrlMap());
		return rootMap;
	}
	
	@InitBinder
	public void InitBinder(WebDataBinder dataBinder)
	{
		dataBinder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
		    public void setAsText(String value) {
		        try {
		            setValue(new SimpleDateFormat("yyyy-MM-dd").parse(value));
		        } catch(ParseException e) {
		            setValue(null);
		        } 
		    }

		    public String getAsText() {
		        return new SimpleDateFormat("yyyy-MM-dd").format((Date) getValue());
		    }        

		});
	}
}
