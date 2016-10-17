<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//String fileName="测试.doc";
 
/* fileName=new String(fileName.getBytes(),"ISO8859-1");
		
response.setHeader("Content-Disposition", "attachment;filename="+fileName); */
%> 
 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>测试</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 
  </head>

<script type="text/javascript" src="jquery-1.7.2.js"> </script>
<script type="text/javascript">
     

</script>
<body> 

<a href="doc.do">方法一</a>
<a href="HTMLDocSuccess.do">方法二(freemarker改进)</a>
<form action="uploadServlet" method="post">
  <input type="text" name="fileName">
    <input type="submit" value="提交">
</form>
	<table width="500" border="1">
	  <tr>
	    <th scope="col">&nbsp;${name }</th>
	    <th scope="col">&nbsp;${age }</th>
	    <th scope="col">&nbsp;</th>
	  </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	  </tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	  </tr>
	</table>
	

  </body>
</html>
