<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script>
	$(function(){
		var val = $("#selectIncVulId").val();
		var isShowDiv = $("#isShowDivId").val();
		var unitName = $("#unitName").val();
		var url = "";
		if(val == 2){
			url = "vulnerabilityAnalysis.do?isShowDiv="+isShowDiv
										+"&analysisInput.unitName="+unitName
										+"&analysisInput.selectType=2";
		}else{
			url = "incidentsAnalysis.do?isShowDiv="+isShowDiv
										+"&analysisInput.unitName="+unitName
										+"&analysisInput.selectType=1";
										
			
		}
		var $rel = $("#incVulAnalysis");
        var data = {
        	"analysisInput.timeBegin" :'${analysisInput.timeBegin}',
        	"pageIndex" :'${analysisInput.pageIndex}',
        	"pageSize" :'${analysisInput.pageSize}',
        	"analysisInput.timeEnd":'${analysisInput.timeEnd}'
        };
        $rel.loadUrl(url, data, function () {
            $rel.find("[layoutH]").layoutH();
        });
	})
</script>


<input type="hidden" id="selectIncVulId" value="${selectIncVul}">
<input type="hidden" id="unitName" value="${analysisInput.unitName}">
<input type="hidden" id="isShowDivId" value="1">
<input type="hidden" name="analysisInput.classification" value="${analysisInput.classification }">
<input type="hidden" name="analysisInput.category" value="${analysisInput.category }">
<div id="incVulAnalysis"></div>

