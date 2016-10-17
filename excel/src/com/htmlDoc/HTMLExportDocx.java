package com.htmlDoc;

import java.io.BufferedWriter;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.filechooser.FileSystemView;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class HTMLExportDocx {
	private Configuration configuration = null;

	public HTMLExportDocx() {
		configuration = new Configuration();
		configuration.setDefaultEncoding("UTF-8");
	}

	public InputStream modifyWord(String templateFile, Map<String, Object> dataMap) {
		
		//模板放在com.yuanwang.web.scep.util.office.resource包下
		configuration.setClassForTemplateLoading(this.getClass(), "/com/model");
		Template t = null;
		try {
			t = configuration.getTemplate(templateFile);
			t.setEncoding("utf-8");
		} catch (IOException e) {
			e.printStackTrace();
		}
		ByteArrayOutputStream ostream = new ByteArrayOutputStream();
        try {
        	Writer out = new BufferedWriter(new OutputStreamWriter(ostream,"UTF8"));
			t.process(dataMap, out);
			out.close();
        } catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 输出字节流
		return new ByteArrayInputStream(ostream.toByteArray());
	}
	
	
	// 2个参数分别是：模板的名称，导出文件的路径
	public void createDoc(String modelName, String exportFilePath) {

		Template t = null;
		// 1、导入模板
		configuration.setClassForTemplateLoading(this.getClass(), "/com/model");

		try {
			// test.ftl为要装载的模板
			t = configuration.getTemplate(modelName);
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 2、打包数据--每次导出的word文件模板不同，打包数据的方法要单独写
		Map<String, Object> dataMap = new HashMap<String, Object>();
		getData(dataMap);

		// 3、导出文件
		// 输出文档路径及名称
		File outFile = new File(exportFilePath);
		Writer out = null;
		try {
			out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile), "utf-8"));
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		try {
			t.process(dataMap, out);
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//把数据打包成map;dataMap里存放的数据Key值要与模板中的参数相对应
	private void getData(Map<String, Object> dataMap) {
		

	}

	public static void main(String[] args) {
	 
		File desktop=FileSystemView.getFileSystemView().getHomeDirectory();
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		HTMLExportDocx dh = new HTMLExportDocx();
		
		String filePath = desktop+"/out/outFile"+sdf.format(date)+".doc";//导出doc文件的路径
		String modelName = "doc.html";//模板名称
		dh.createDoc(modelName, filePath);
		System.out.println("	导出成功");
	}

}
