package com.tms.utils.report.pdf;

import java.io.File;
import java.io.IOException;

import com.tms.utils.ResourceLoader;

import freemarker.template.Configuration;
/**
 * freemark配置
 * @ClassName: FreemarkerConfiguration
 * @Description: freemark配置
 * 修改内容：新建
 */
public class FreemarkerConfiguration {

	private static Configuration config = null;

	/**
	 * 获取 FreemarkerConfiguration
	 * 
	 * @Title: getConfiguation
	 * @Description:
	 * @return
	 */
	public static synchronized Configuration getConfiguation() {
		if (config == null) {
			setConfiguation();
		}
		return config;
	}
	/**
	 * 设置 配置
	 * @Title: setConfiguation
	 */
	private static void setConfiguation() {
		config = new Configuration();
		String path = ResourceLoader.getPath("");
		System.out.println("path="+path);
		try {
			config.setDirectoryForTemplateLoading(new File(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}