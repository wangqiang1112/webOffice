

package com.htmlDoc;

import java.io.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.web.BaseAction;


/**
 * @author Administrator
 *
 */
public class HtmlDocAction   extends BaseAction  {
	 

	private String downloadFileName;
	private InputStream inputStream;
	private HttpServletRequest  request =super.getHttpRequest();
	public void HTMLDocSuccess() throws IOException{
		request =super.getHttpRequest();
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

		
		
		String serverPath = ServletActionContext.getServletContext()
				.getRealPath("/");
		if (serverPath.indexOf("\\") != -1) {
			if (!serverPath.substring(serverPath.length() - 1).equals("\\")) {
				serverPath = serverPath + "\\";
			}
		}
	 
		Map<String, Object> map = new HashMap<String, Object>();
		
	    
		
		 List<Map<String, Object>>  list=new ArrayList<Map<String, Object>>();
		 for (int i = 0; i < 10; i++) {
			 Map<String, Object> book=new HashMap<String, Object>();
			 book.put("banme", "图书"+i);
			 book.put("date", i+"-2016-06");
			 
			 list.add(book);
		 }
		 super.getHttpRequest().setAttribute("list", list);
		 map.put("list", list);
		 map.put("name", "测试");
		 map.put("aqsjfscz_threejscz218", "1");
		 map.put("aqsjfscz_threejscz219", "0");
		 map.put("img", basePath+"bg.jpg");
		 System.out.println(basePath+"bg.jpg");
		 
	 
			
		HTMLExportDocx dh = new HTMLExportDocx();
	 
		
		
		String modelName = "doc2.html";//模板名称
		InputStream is=dh.modifyWord(modelName, map);
		String fileName="freemarker方法导出word.doc";
		String type=".doc";
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			    fileName=new String(fileName.getBytes(),"ISO8859-1");	
				response.reset(); // 必要地清除response中的缓存信息
				response.setHeader("Content-Disposition", "attachment;filename="+ fileName);
				response.setContentType("application/msword");//根据个人需要,这个是下载文件的类型
				javax.servlet.ServletOutputStream out = response.getOutputStream();
					 
				int length = 0;
				while ((length = is.read()) != -1) {
					out.write( length);
				}
				out.flush();
				out.close();
				is.close();
		} catch (Exception e) {
			
		}
	}
	 


 
	/** 中文文件名转码 */
	public String getDownloadFileName() {
		try {
			downloadFileName = new String(downloadFileName.getBytes(),
					"ISO8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return downloadFileName;
	}

	public void setDownloadFileName(String downloadFileName) {
		this.downloadFileName = downloadFileName;
	}

	

	
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
}
