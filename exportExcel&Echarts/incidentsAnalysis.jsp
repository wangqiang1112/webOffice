<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<style>
  #security-situation-incident label {
    display: inline-block;
    margin: 0 10px;
    width: auto;
    line-height: 26px;
  }

  #security-situation-incident-charts {
    /*width: 800px;*/
    height: 300px;
    /*margin: 0 auto;*/
  }
</style>
<script>
  $(function() {
  	
  	var isShowDiv = $("input[name=isShowDiv]").val()
  	if(isShowDiv == 0){
  		$("#isShowDiv").hide();
  	}
  
    var $container = $('#security-situation-incident');
    var xAxisData = [];
    var seriesData = [];

    $('tbody tr', $container).each(function() {
      var $this = $(this);
      xAxisData.push($this.find('td').eq(1).text().trim());
      
      if(isShowDiv != 0){
      	var element = {
      		"value": $this.find('td:last').text(),
      		"name": $this.find('td').eq(1).text().trim()
      	};
      	seriesData.push(element);
      }else{
      	seriesData.push($this.find('td:last').text());
      }
      
      $this.find('td')
    });
    
		                                	
    xAxisData.reverse();
    seriesData.reverse();

    require.config({
      paths: {
        echarts: 'chart/echarts/dist'
      }
    });

    require(
        [
          'echarts',
          'echarts/chart/bar',
          'echarts/chart/pie'
        ],
        function(ec) {
          var charts = ec.init(document.getElementById('security-situation-incident-charts'));
          var legendName = $('select[name="analysisInput.category"]', $container).children('option').filter(':selected').text() || '安全事件总数';
          var option;
          if(isShowDiv != 0){
          		option = {
				    title : {
				        text: '安全事件分析',
				        x:'center'
				    },
				    tooltip : {
				        trigger: 'item',
				        formatter: "{b} : {c} ({d}%)"
				    },
				    legend: {
				        orient : 'vertical',
				        x : 'left',
				        y: 'center',
				        data: xAxisData
				    },
				    calculable : true,
				    series : [
				        {
				            name:'',
				            type:'pie',
				            radius : '55%',
				            center: ['50%', '60%'],
				            itemStyle: {
		                        normal: {
		                            label: {
		                                show: false
		                            },
		                            labelLine: {
		                                show: false,
		                                length:1
		                            }
		                        }
		                    },
				            data: seriesData
				        }
				    ]
				};
          }else{
          		option = {
				    title : {
				        text: '安全事件单位情况分析图',
				        x: 'center'
				    },
				    tooltip : {
				        trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        }
				    },
				    legend: {
				        data: [legendName],
			              x: 'right',
			              y: 'center'
				    },
				    grid: {
		              borderWidth: 0
		            },
				    calculable : true,
				    xAxis : [
				        {
				            type : 'category',
				            axisLabel:{
				            	interval:0,
				            	/* rotate: -20 */
				            	formatter: function(v) {
				            		return v = v.replace(/(.{8})/g,'$1\n')
				            		
				            	}
				            },
				            splitLine:{
				        		show:false
				        	},
				            data : xAxisData.reverse()
				        }
				    ],
				    yAxis : [
				        {
				        	splitLine:{
				        		show:false
				        	},
				            type : 'value'
				        }
				    ],
				    series : [
				        {
				            name:'安全事件总数',
				            type:'bar',
				            data:seriesData.reverse(),
				            itemStyle: {
			                  normal: {
			                    label: {
			                      show: true,
			                      position: 'top'
			                    }
			                  }
			                },
				        }
				    ]
				};
	          }
          
          charts.setOption(option);
        }
    )

  });
  
  function showSelected(val){
  	var url  = "incVulAnalysis.do?selectIncVul="+val;
  	if(val == 1){
	  	navTab.openTab(630, url,{title:'安全事件/漏洞占比分析'});
  	}else{
	  	navTab.openTab(631, url,{title:'安全事件/漏洞占比分析'});
  	}
  }
  
</script>
<input type="hidden" name="isShowDiv" value="${isShowDiv }">
<div id="security-situation-incident">
	<s:if test="#request.isShowDiv != 0">
		<form id="pagerForm" method="post" action="incVulAnalysis.do">
		    <input type="hidden" name="pageIndex" value="${pageIndex}"/>
		    <input type="hidden" name="pageSize" value="${analysisInput.pageSize}"/>
			<input type="hidden" name="selectIncVul" value="1">
		</form>
	</s:if><s:else>
		<form id="pagerForm" method="post" action="incidentsAnalysis.do">
		    <input type="hidden" name="pageIndex" value="${pageIndex}"/>
		    <input type="hidden" name="pageSize" value="${analysisInput.pageSize}"/>
		    <input type="hidden" name="selectIncVul" value="1">
  		</form>
	</s:else>
  
  <div class="pageHeader">
  	
  	<div class="searchBar">
        <div class="searchContent"  id="isShowDiv">
            <label>
        分类：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <select name="analysisInput.selectType" onchange="showSelected(this.options[this.options.selectedIndex].value);">
	       <option value="1" <s:if test="analysisInput.selectType == 1">selected</s:if>>安全事件分析</option>
	       <option value="2" <s:if test="analysisInput.selectType == 2">selected</s:if>>安全漏洞分析</option>
	   </select>
   </label>
        </div>
      </div>
  	
    <s:if test="#request.isShowDiv != 0">
    	<form onsubmit="return navTabSearch(this);" action="incVulAnalysis.do" method="post" rel="pagerForm">
    </s:if><s:else>
    	<form onsubmit="return navTabSearch(this);" action="incidentsAnalysis.do" method="post" rel="pagerForm">
    </s:else>
      <input type="hidden" name="selectIncVul" value="1">
      <div class="searchBar">
        <div class="searchContent">
        <s:if test="#request.isShowDiv != 0">
        	<label>
          单位名称：
            <input type="text" name="analysisInput.unitName" value="${analysisInput.unitName }">
          </label>
        </s:if>
        <s:else>
        	<label>
          事件分类：
            <select name="analysisInput.category">
              <option value="-1" <s:if test="categoryId == -1">selected</s:if>>所有事件</option>
              <s:iterator value="#request.categoryList1">
                <option value="${categoryName}" <s:if test="categoryName == analysisInput.category">selected</s:if>>${categoryName}</option>
              </s:iterator>
            </select>
          </label>
        </s:else>
          
          <label>
         发生时间：
            <input type="text" class="date" name="analysisInput.timeBegin" value="${analysisInput.timeBegin}"/>
            至
            <input type="text" class="date" name="analysisInput.timeEnd" value="${analysisInput.timeEnd}"/>
          </label>
        </div>
        <div class="subBar">
          <ul>
            <li>
              <div class="buttonActive">
                <div class="buttonContent">
                  <button type="submit">检索</button>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </form>
  </div>

  <div class="pageContent"  width="80%">
  
    <div id="security-situation-incident-charts" width="80%">

    </div>

    <div width="100%" >
      <table class="table" width="95%" layoutH="387">
        <thead>
        <tr>
          <th width="10" align="center">序号</th>
          <th width="10" align="center">单位名称</th>
          <s:iterator value="#request.innerList"  status="sta" id="ca">
          	<th width="10" align="center">${CategoryName}</th>
          </s:iterator>
          <s:if test="#request.isShowLastTd == 1">
          	<th width="10" align="center">安全事件总数</th>
          </s:if>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="#request.securityIncidentTrend" status="sta" id="ca">
          <tr>
            <td width="10" align="center">${rowNumber}</td>
            <td width="20" align="center">${UnitName}</td>
            <s:iterator value="#ca.innerList">
	        	<td width="15" align="center">${count}</td>
	        </s:iterator>
	        <s:if test="#request.isShowLastTd == 1">
           		<td width="15" align="center">${IncidentCount}</td>
           	</s:if>
          </tr>
        </s:iterator>
        </tbody>
      </table>
    </div>
    <div class="panelBar">
      <div class="pages">
        <span>显示</span>
        <select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
          <option value="10" <s:if test="pageSize == 10">selected</s:if>>10</option>
          <option value="20" <s:if test="pageSize == 20">selected</s:if>>20</option>
          <option value="50" <s:if test="pageSize == 50">selected</s:if>>50</option>
          <option value="100" <s:if test="pageSize == 100">selected</s:if>>100</option>
        </select>
        <span>条，共${totalCount}条</span>
      </div>
      <div class="pagination" targetType="navTab" totalCount="${totalCount}" numPerPage="${pageSize}" pageNumShown="10" currentPage="${pageIndex}"></div>
    </div>
  </div>

</div>
