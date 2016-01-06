package com.tms.utils.email;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import sun.misc.BASE64Decoder;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * 发送邮件时的身份认证器.
 */
public class Authentication extends Authenticator {
    private static final Logger logger = LoggerFactory.getLogger(Authentication.class);

    /**用户名(发送者邮箱地址)**/
    private String username;
    /**发送者邮箱密码**/
    private String password;

    public Authentication(String username, String password) throws Exception {
        if(StringUtils.isEmpty(username) || StringUtils.isEmpty(password)){
            logger.error("username and password is required!");
            throw new Exception("username and password is required!");
        }

        this.username = username;
        this.password = password;
    }

    protected PasswordAuthentication getPasswordAuthentication(){
        return new PasswordAuthentication(username, password);
    }

    public String getUsername() {
    	if (username == null) return null; 
		BASE64Decoder decoder = new BASE64Decoder(); 
		try { 
			byte[] b = decoder.decodeBuffer(username); 
			return new String(b); 
		} catch (Exception e) { 
			return null; 
		} 
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
    	if (password == null) return null; 
		BASE64Decoder decoder = new BASE64Decoder(); 
		try { 
			byte[] b = decoder.decodeBuffer(password); 
			return new String(b); 
		} catch (Exception e) { 
			return null; 
		} 
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
