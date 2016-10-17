
package com.web;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.*;


public class WebAction extends BaseAction {
	private HttpServletRequest  request =super.getHttpRequest();
	private HttpSession session;
	private String name="";//
	private int age=-1;//
	private String downFileName="";//
	//下载
	private InputStream inputSteam;

	
	
	public String doc(){
		
		request =super.getHttpRequest();
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		request.setAttribute("img", basePath+"bg.jpg");
		 
		 List<Book>  list=new ArrayList<Book>();
		 for (int i = 0; i < 10; i++) {
			 Book book=new Book();
			 book.setBname("图书"+i);
			 book.setDate(i+"-2016-06");
			 list.add(book);
		 }
		 request.setAttribute("list", list);
		 
		String fileName="JSP+S标签处理word.doc";
		try {
			 fileName=new String(fileName.getBytes(),"ISO8859-1");
		} catch (Exception e) {
			// TODO: handle exception
		}
		 super.getResponse().setHeader("Content-Disposition", "attachment;filename="+fileName);
		 
		return "success";
	}
	

	
	
	public static String encodeFileName(String fileName){
		try {
			return new String(fileName.getBytes(),
					"ISO8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public String getDownFileName() {
		return downFileName;
	}

	public void setDownFileName(String downFileName) {
		this.downFileName = downFileName;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}

	public InputStream getInputSteam() {
		return inputSteam;
	}

	public void setInputSteam(InputStream inputSteam) {
		this.inputSteam = inputSteam;
	}
	
}
