package com.tms.utils.report.pdf;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
    
public class HtmlGenerator {     
         
    /**   
     * Generate HTML string.   
     *    
     * @param template   the name of freemarker teamlate.   
     * @param variables  the data of teamlate.   
     * @return htmlStr   
     * @throws IOException 
     * @throws TemplateException 
     * @throws Exception   
     */    
    public String generate(String template, Map<String,Object> variables) throws IOException, TemplateException{     
        BufferedWriter writer = null;   
        String htmlContent = "";
        try{
        	Configuration config = FreemarkerConfiguration.getConfiguation();     
        	Template tp = config.getTemplate(template);     
        	StringWriter stringWriter = new StringWriter();       
        	writer = new BufferedWriter(stringWriter);  
        	
        	tp.setEncoding("UTF-8");       
        	tp.process(variables, writer);       
        	htmlContent = stringWriter.toString();     
        	writer.flush();       
        	
        }finally{
        	if(writer!=null)
        		writer.close();     
        }
        return htmlContent;     
    }
    /**
     * 
     * @param template
     * @return
     * @throws IOException
     * @throws TemplateException
     */
    public Template generate(String template) throws IOException, TemplateException{     
    	Configuration config = FreemarkerConfiguration.getConfiguation();     
    	Template tp = config.getTemplate(template);     
    	tp.setEncoding("UTF-8");       
    	return tp;
    }    
    /**
     * @param tp
     * @param variables
     * @return
     * @throws IOException
     * @throws TemplateException
     */
    public String generate(Template tp, Map<String,Object> variables) throws IOException, TemplateException{     
        BufferedWriter writer = null;   
        String htmlContent = "";
        try{
        	StringWriter stringWriter = new StringWriter();       
        	writer = new BufferedWriter(stringWriter);  
        	
        	tp.setEncoding("UTF-8");       
        	tp.process(variables, writer);       
        	htmlContent = stringWriter.toString();     
        	writer.flush();       
        }finally{
        	if(writer!=null)
        		writer.close();     
        }
        return htmlContent;     
    }
} 