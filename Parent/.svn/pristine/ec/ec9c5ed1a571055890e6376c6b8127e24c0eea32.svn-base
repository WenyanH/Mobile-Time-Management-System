package com.tms.utils.email;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
/**
 * 发送邮件服务器.
 *
 */
public class EmailServer {
    private static final Logger logger = LoggerFactory.getLogger(EmailServer.class);
    //spring中配置
    /**邮箱服务器配置**/
    private static List<EmailConfig> config;
    /**是否开启debug调试模式**/
    private boolean isDebug = false;
    /**是否启用身份验证**/
    private boolean isAuth = true;
    /**验证类型**/
    private String authType = "auth";

    public static EmailServer instance=null;
    /**
     * 私有化默认构造器,使外部不可实例化
     */
    private EmailServer(){}

    private static Authentication auth = null;
    /**
     * 单例,保证上下文中只有一个EmailServer
     *
     * @return  EmailServer
     */
    public static EmailServer getInstance(){
    	if(instance==null){
    			instance=new EmailServer();
    	}
    	if(config==null){
    		config=initEmailConfig();
    	}
    	if(auth==null){
    		auth=initAuthentication();
    	}
        return instance;
    }
    private static List<EmailConfig> initEmailConfig(){
		URL path=EmailServer.class.getClassLoader().getResource("email.xml");
		String filePath=path.getPath();
		File file =new File(filePath);
		if(file.exists()){
			FileInputStream inputStream;
			try {
				inputStream = new FileInputStream(file);
				XStream xstream = new XStream(new DomDriver());  
				List<EmailConfig> list=new ArrayList<EmailConfig>();
				xstream.alias("emailConfigs", List.class);  
				xstream.alias("emailConfig", EmailConfig.class);  
				xstream.aliasAttribute(EmailConfig.class, "name", "name");  
				xstream.aliasAttribute(EmailConfig.class, "smtp", "smtp");  
				xstream.aliasAttribute(EmailConfig.class, "port", "port");
				xstream.aliasAttribute(EmailConfig.class, "description", "description");
				list=(List)xstream.fromXML(inputStream);
				return list;
			} catch (FileNotFoundException e) {
				logger.error("init EmailConfig.xml is error ",e);
			}
		}
		return null;
	}
    private static Authentication initAuthentication(){
    	URL path=EmailServer.class.getClassLoader().getResource("sender-email.xml");
		String filePath=path.getPath();
		File file =new File(filePath);
		if(file.exists()){
			FileInputStream inputStream;
			try {
				inputStream = new FileInputStream(file);
				XStream xstream = new XStream(new DomDriver());  
				xstream.alias("authentication", Authentication.class);  
				xstream.aliasAttribute(Authentication.class, "username", "username");  
				xstream.aliasAttribute(Authentication.class, "password", "password");  
				return (Authentication)xstream.fromXML(inputStream);
			} catch (FileNotFoundException e) {
				logger.error("init sender-email.xml is error ",e);
			}
		}
		return null;
    }
    /**
     * 发送普通邮件(单个接收人)
     *
     * @param username      发件人用户名
     * @param password      发件人密码
     * @param title         邮件标题
     * @param content       邮件正文
     * @param receiver      单个接收人
     * @return
     * @throws Exception 
     */
    public boolean sendTextMail(String title, String content, String receiver) throws Exception{
        return this.sendTextMail(title, content, Collections.singletonList(receiver));
    }

    /**
     * 发送普通邮件(多个接收人)
     *
     * @param username      发件人用户名
     * @param password      发件人密码
     * @param title         邮件标题
     * @param content       邮件正文
     * @param receivers     多个接收人
     * @return
     * @throws Exception 
     */
    public boolean sendTextMail(String title, String content, List<String> receivers) throws Exception{

        Properties props = new Properties();
        props.setProperty("mail.smtp.auth", this.isAuth() ? "true" : "false");
        props.setProperty("mail.transport.protocol", "auth");
        if(auth==null){auth=this.initAuthentication();}
        EmailConfig config = this.getEmailConfig(auth.getUsername());
        props.setProperty("mail.smtp.host", config.getSmtp());
        props.setProperty("mail.smtp.port", config.getPort() + "");

        // 根据邮件会话属性和密码验证器构造一个发送邮件的session
        Session session = Session.getDefaultInstance(props, auth);
        session.setDebug(this.isDebug);

        Message message = this.makeTextMail(session, title, content, auth.getUsername(), receivers, false);
        try {
            Transport.send(message);

            return true;
        } catch (MessagingException e) {
            logger.error(e.getMessage(), e);
            return false;
        }
    }

    /**
     * 发送HTML邮件(单个接收人)
     *
     * @param username      发件人用户名
     * @param password      发件人密码
     * @param title         邮件标题
     * @param content       邮件正文
     * @param receiver      单个接收人
     * @return
     * @throws Exception 
     */
    public boolean sendHtmlMail(String title, String content, String receiver) throws Exception{
        return this.sendHtmlMail(title, content, Collections.singletonList(receiver));
    }

    /**
     * 发送HTML邮件(多个接收人)
     *
     * @param username      发件人用户名
     * @param password      发件人密码
     * @param title         邮件标题
     * @param content       邮件正文
     * @param receivers     多个接收人
     * @return
     * @throws Exception 
     */
    public boolean sendHtmlMail(String title, String content, List<String> receivers) throws Exception{

        Properties props = new Properties();
        props.setProperty("mail.smtp.auth", this.isAuth() ? "true" : "false");
        props.setProperty("mail.transport.protocol", "auth");
        if(auth==null){auth=this.initAuthentication();}
        EmailConfig config = this.getEmailConfig(auth.getUsername());
        props.setProperty("mail.smtp.host", config.getSmtp());
        props.setProperty("mail.smtp.port", config.getPort() + "");

        // 根据邮件会话属性和密码验证器构造一个发送邮件的session
        Session session = Session.getDefaultInstance(props, auth);
        session.setDebug(this.isDebug);

        Message message = this.makeTextMail(session, title, content, auth.getUsername(), receivers, true);
        try {
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            logger.error(e.getMessage(), e);
            return false;
        }
    }

    /**
     * 获取邮件服务器配置
     *
     * @param email         邮箱地址
     * @return
     */
    private EmailConfig getEmailConfig(String email){
        String mailServiceDomainName = this.getMailServiceDomainName(email);
        if(this.config==null){
        	this.config=this.initEmailConfig();
        }
        for(EmailConfig config : this.config) {
            if(config.getName().equals(mailServiceDomainName)){
                return config;
            }
        }
        return null;
    }

    /**
     * 创建邮件message
     *
     * @param session       根据配置获得的session
     * @param title         邮件主题
     * @param content       邮件的内容
     * @param from          发件者
     * @param receivers     收件者
     * @param isHtmlMail    是否是html邮件
     * @throws UnsupportedEncodingException 
     */
    private Message makeTextMail(Session session, String title, String content, String from, List<String> receivers, boolean isHtmlMail) throws UnsupportedEncodingException{
        Message message = new MimeMessage(session);
        try {
            /**标题**/
            logger.info("this mail's title is {}", title);
            message.setSubject(MimeUtility.encodeText(title,"UTF-8", "B"));
            /**内容**/
            logger.info("this mail's content is {}", content);
            if(isHtmlMail){
                //是html邮件
                message.setContent(content, "text/html;charset=utf-8");
            } else {
                //普通邮件
                message.setText(content);
            }
            /**发件者地址**/
            logger.info("this mail's sender is {}", from);
            Address fromAddress = new InternetAddress(from);
            message.setFrom(fromAddress);
            /**接收者地址**/
            Address[] tos = new InternetAddress[receivers.size()];
            for(int i = 0; i < receivers.size(); i++){
                String receiver = receivers.get(i);
                if(!StringUtils.isEmpty(receiver)){
                    tos[i] = new InternetAddress(receiver);
                }
            }
            /**发件时间**/
            message.setSentDate(new Date());

            message.setRecipients(Message.RecipientType.TO, tos);
        } catch (MessagingException e) {
            logger.error(e.getMessage(), e);
            e.printStackTrace();
        }

        return message;
    }

    /**
     * 获取邮箱域名
     *
     * @param email     邮箱
     * @return
     */
    private String getMailServiceDomainName(String email){
        if(email==null||"".equals(email)){
            return "";
        } else {
        	int firstIndex = email.indexOf("@");
            int secondIndex = email.lastIndexOf(".");

            return email.substring(firstIndex + 1, secondIndex);
        }
    }

    public List<EmailConfig> getConfig() {
        return config;
    }

    public void setConfig(List<EmailConfig> config) {
        this.config = config;
    }

    public boolean isDebug() {
        return isDebug;
    }

    public void setDebug(boolean debug) {
        isDebug = debug;
    }

    public boolean isAuth() {
        return isAuth;
    }

    public void setAuth(boolean auth) {
        isAuth = auth;
    }

    public String getAuthType() {
        return authType;
    }

    public void setAuthType(String authType) {
        this.authType = authType;
    }
}
