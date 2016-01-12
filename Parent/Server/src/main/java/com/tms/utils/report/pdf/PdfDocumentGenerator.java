package com.tms.utils.report.pdf;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.log4j.Logger;
import org.w3c.dom.Document;
import org.xhtmlrenderer.pdf.ITextRenderer;

/**
 * PDF 生成
 * 
 * @ClassName: PdfGenerator
 * @Description:pdf 生成
 */
public class PdfDocumentGenerator {
	private final static Logger logger = Logger.getLogger(PdfDocumentGenerator.class);

	private final static HtmlGenerator htmlGenerator;
	static {
		htmlGenerator = new HtmlGenerator();
	}

	/**
	 * 使用模板,模板数据,生成pdf
	 * 
	 * @Title: generate
	 * @Description: 使用模板,模板数据,生成pdf
	 * @param template
	 *            classpath中路径模板路径
	 * @param documentVo
	 *            模板数据
	 * @param outputFile
	 *            生成pdf的路径
	 * @throws DocumentGeneratingException
	 */
	public boolean generate(String template, List<DocumentVo> documentVos,OutputStream out) throws DocumentGeneratingException {
		Map<String, Object> variables = new HashMap<String, Object>();
		try {
			if(documentVos==null)return false;
			StringBuffer htmlContent=new StringBuffer();
			int index=0;
			String reportInfo=null;
			for(DocumentVo documentVo:documentVos){
				variables = documentVo.fillDataMap();
				if(index==0){
					reportInfo=this.htmlGenerator.generate("config\\templates\\headReport.html",variables);
				}
				htmlContent.append(this.htmlGenerator.generate(template,variables));
				index++;
			}
			reportInfo=reportInfo.replace("#reportInfo#", htmlContent.toString());
			generate(reportInfo, out);
		} catch (Exception e) {
			
			throw new DocumentGeneratingException("", e);
		}
		return true;
	}

	/**
	 * Output a pdf to the specified outputstream
	 * 
	 * @param htmlContent
	 *            the htmlstr
	 * @param out
	 *            the specified outputstream
	 * @throws Exception
	 */
	public void generate(String htmlContent, OutputStream out)
			throws Exception {
		ITextRenderer iTextRenderer = null;

		try {
			DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
			Document doc = builder.parse(new ByteArrayInputStream(htmlContent.getBytes("UTF-8")));

			iTextRenderer = (ITextRenderer) ITextRendererObjectFactory.getObjectPool().borrowObject();//获取对象池中对象

			try {
				iTextRenderer.setDocument(doc, null);
				iTextRenderer.layout();
				iTextRenderer.createPDF(out);
			} catch (Exception e) {
				ITextRendererObjectFactory.getObjectPool().invalidateObject(
						iTextRenderer);
				iTextRenderer = null;
				throw e;
			}

		} catch (Exception e) {
			throw e;
		} 
	}
}