
package com.web;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.*;

import com.util.ExcelMakes;


public class WebAction extends BaseAction {
	private HttpServletRequest  request =super.getHttpRequest();
	private HttpSession session;
	private String name="";//
	private int age=-1;//
	private String downFileName="";//
	//下载
	private InputStream inputSteam;

	/***
	 * 导出word文档
	 * @return
	 */
	
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
	
	/*******导出Excel**********/
	public void getExcels(){
/*
		List<Map<String,Object>> list=(List<Map<String,Object>>)map.get("list");
	
		
		//表列名
		String[] cellNames={"序号","用户名","用户姓名	","操作IP","操作时间","事件类型","事件描述","事件结果"};
		String[] orderedAttrs={"Id","UserName","RealName","Ip","CreateTime","FunctionCategory","Description","Result"};

		ExcelMakes excelMakes=new ExcelMakes("系统操作审计", cellNames, orderedAttrs);
		excelMakes.setSheetName("系统操作审计");
		
		excelMakes.addData(list);*/
		 

		String[] cellNamesForReq = { "","资讯网站","","","工作网站","","","宣传网站","",""};

		String[] cellNamesForReq1 = { "区域","全部","已注册","未注册","全部","已注册","未注册","全部","已注册","未注册"};
		String[] orderedAttrsForReq1 = {"qy","all1","aq1","aq0","asll1","asq1","asq0","awll1","awq1","awq0"};
		
	    /********
	     * 表格2 
	     */
	    
	    List<Map<String, String>> list23=new ArrayList<Map<String,String>>();
	    
	    for (int i = 0; i < 100; i++) {

		    Map<String, String> a10=new HashMap<String, String>();
		    a10.put("qy", "1203"+i);
		    
		    a10.put("all1", "张三"+1);
		    a10.put("aq1", "40");
		    a10.put("aq0", "1203"+i);
		    
		    a10.put("asll1", "张三"+1);
		    a10.put("asq1", "40");
		    a10.put("asq0", "1203"+i);
		    
		    a10.put("awll1", "张三"+1);
		    a10.put("awq1", "40");
		    a10.put("awq0", "1203"+i);
		    list23.add(a10);
		}
	    
	    
	    /****
	     *测试单表格数据
	     */
	    ExcelMakes excel=new ExcelMakes("测试单表格",cellNamesForReq1,orderedAttrsForReq1);
	  
	 	excel.setTitile("测试单表格");
	 	excel.setCellNamesTop(cellNamesForReq);
		excel.addData(list23);
	
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
