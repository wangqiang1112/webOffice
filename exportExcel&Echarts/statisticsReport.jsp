<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">
    #analysis-statement .buttonActive{
        float: right;
    }
    #analysis-statement span.span-label {
        display: inline-block;
        margin: 0 10px;
        width: auto;
        line-height: 26px;
    }

    #analysis-statement table * {
        text-align: center;
    }

    #analysis-statement table th,
    #analysis-statement table td {
        border: 1px solid #ddd;
        height: 25px;
    }
    #analysis-statement .color-blod {
        font-weight: bold;
        color: #00B050;
    }
</style>
<script type="text/javascript">
    function exportStatement() {
        alertMsg.confirm("确认导出该统计报表？", {
            okCall: function () {
                var pType = $("#periodType").val().trim();
                var bPoint = $("#beginPoint").val().trim();
                var theYear = $("#theYears").val().trim();
                var theOrder = $("#theOrders").val().trim();
                window.location = "exportStatement.do?analysisInput.periodType=" + pType + "&analysisInput.beginPoint=" + bPoint + "&analysisInput.theYear=" + theYear+ "&analysisInput.theOrder=" + theOrder;
            }
        });
    }
    $(function () {
        var pType = $("#periodType").val().trim();
        var theYear = $("#theYears").val().trim();
        if (pType != 1 && pType != 5) {
            $.ajax({
                url: "listPeriod.do",
                type: "post",
                data: {
                    "analysisInput.periodType": pType,
                    "analysisInput.theYear": theYear
                },
                dataType: "text",
                success: function (data) {
                    var vz = "周";
                    if (pType == 3) {
                        vz = "月";
                    }
                    $("#theOrder").html("");
                    var str = "";
                    for (var i = 0; i < data; i++) {
                        if (pType == 4) {
                            str += "<option value='" + (i + 1) + "'>第" + (i + 1) + "季度</option>";
                        } else {
                            str += "<option value='" + (i + 1) + "'>" + (i + 1) + vz + "</option>";
                        }
                    }
                    $("#theOrder").html(str);
                    $("#theYear").show();
                    $("#theOrder").show();
                    $("#beginPoint").hide();
                    $("#time-split").hide();
            		$("#endPoint").hide();
                    $("#theOrder").val($("#theOrders").val());
                },
                error: function () {
                    alertMsg.error("error");
                }
            });
        }
        if (pType == 1) {
            $("#theYear").hide();
            $("#theOrder").hide();
            $("#beginPoint").show();
            $("#time-split").show();
            $("#endPoint").show();
        } else if (pType == 5) {
            $("#theYear").show();
            $("#theOrder").hide();
            $("#beginPoint").hide();
            $("#time-split").hide();
            $("#endPoint").hide();
        } else {
            $("#theYear").show();
            $("#theOrder").show();
            $("#beginPoint").hide();
            $("#time-split").hide();
            $("#endPoint").hide();
        }

        $("#periodType").change(function () {
            var pType = $("#periodType").val().trim();
            if (pType == 1) {
                $("#theYear").hide();
                $("#theOrder").hide();
                $("#beginPoint").show();
                $("#time-split").show();
            	$("#endPoint").show();
            } else if (pType == 5) {
                $("#theYear").show();
                $("#theOrder").hide();
                $("#beginPoint").hide();
                $("#time-split").hide();
            	$("#endPoint").hide();
            } else {
                var theYear = $("#beginPoint").val().trim();
                $.ajax({
                    url: "listPeriod.do",
                    type: "post",
                    data: {
                        "analysisInput.periodType": pType,
                        "analysisInput.theYear": theYear
                    },
                    dataType: "text",
                    success: function (data) {
                        var vz = "周";
                        if (pType == 3) {
                            vz = "月";
                        }
                        $("#theOrder").html("");
                        var str = "";
                        for (var i = 0; i < data; i++) {
                            if (pType == 4) {
                                str += "<option value='" + (i + 1) + "'>第" + (i + 1) + "季度</option>";
                            } else {
                                str += "<option value='" + (i + 1) + "'>" + (i + 1) + vz + "</option>";
                            }
                        }
                        $("#theOrders").val(1);
                        $("#theOrder").html(str);
                        $("#theYear").show();
                        $("#theOrder").show();
                        $("#beginPoint").hide();
                        $("#time-split").hide();
            			$("#endPoint").hide();
                    },
                    error: function () {
                        alertMsg.error("error");
                    }
                });
            }
        });

        //向隐藏于赋值
        $("#theOrder").change(function () {
            $("#theOrders").val($("#theOrder").val());
        });
    });
    function datess() {
        WdatePicker(
                {
                    dateFmt: 'yyyy',
                    onpicking: function (dp) {
                        var newdate = dp.cal.getNewDateStr();
                        setSelectInnerHTMLs(newdate);
                        //向隐藏域赋值
                        $("#theYears").val(newdate);
                        var pT = $("#periodType").val().trim();
                        if (pT == 2 || pT == 3 || pT == 4) {
                            var vz = "周";
                            if (pT == 3) {
                                vz = "月";
                            }
                            $.ajax({
                                url: "listPeriod.do",
                                type: "post",
                                data: {
                                    "analysisInput.periodType": pT,
                                    "analysisInput.theYear": newdate
                                },
                                dataType: "text",
                                success: function (data) {
                                    $("#theOrder").attr("disabled", false);
                                    $("#theOrder").html("");
                                    var str = "";
                                    if (data == 0) {
                                        str = "<option value='0'>无数据</option>";
                                        $("#theOrders").val(0);
                                        $("#theOrder").html(str);
                                        $("#theOrder").attr("disabled", true);
                                    } else {
                                        for (var i = 0; i < data; i++) {
                                            if (pT == 4) {
                                                str += "<option value='" + (i + 1) + "'>第" + (i + 1) + "季度</option>";
                                            } else {
                                                str += "<option value='" + (i + 1) + "'>" + (i + 1) + vz + "</option>";
                                            }
                                        }
                                        $("#theOrder").html(str);
                                        $("#theOrders").val(1);
                                    }
                                    $("#theYear").show();
                                    $("#theOrder").show();
                                    $("#beginPoint").hide();
                                    $("#time-split").hide();
            						$("#endPoint").hide();
                                },
                                error: function () {
                                    alertMsg.error("error");
                                }
                            });
                        }
                    },
                    onclearing: function (dp) {
                        setSelectInnerHTMLs("");
                    }
                }
        )
    }
    function setSelectInnerHTMLs(date) {
    }
</script>
<div id="analysis-statement">
    <form id="pagerForm" method="post" action="statisticsReport.do">
        <input type="hidden" name="pageIndex" value="${pageIndex}"/>
        <input type="hidden" name="pageSize" value="${analysisInput.pageSize}"/>
    </form>
    <div class="pageHeader">
        <form onsubmit="return navTabSearch(this);" action="statisticsReport.do" method="post" rel="pagerForm">
            <div class="searchBar">
                <div class="buttonActive">
                    <div class="buttonContent">
                        <button type="submit">查询</button>
                    </div>
                </div>
                <div class="searchContent">
                    <span class="span-label">报表类型：
                        <select id="periodType" name="analysisInput.periodType">
                            <option
                                    <s:if test="analysisInput.periodType==1">selected</s:if> value="1">日报表
                            </option>
                            <option
                                    <s:if test="analysisInput.periodType==2">selected</s:if> value="2">周报表
                            </option>
                            <option
                                    <s:if test="analysisInput.periodType==3">selected</s:if> value="3">月报表
                            </option>
                            <option
                                    <s:if test="analysisInput.periodType==4">selected</s:if> value="4">季报表
                            </option>
                            <option
                                    <s:if test="periodType==5">selected</s:if> value="5">年报表
                            </option>
                        </select>
                    </span>
                    <span class="span-label">
                        时间：
                        <input id="theYear" type="text" class="Wdate" onclick="datess()" value="${analysisInput.theYear}"/>
                        <input id="theYears" hidden name="analysisInput.theYear" value="${analysisInput.theYear}"/>
                        &nbsp;&nbsp;&nbsp;
                        <select id="theOrder"></select>
                        <input id="theOrders" hidden name="analysisInput.theOrder" value="${analysisInput.theOrder}"/>

                        <input id="beginPoint" type="text" class="date" datefmt="yyyy-MM-dd" name="analysisInput.beginPoint" value="${analysisInput.beginPoint}"/>
                        <span id="time-split">-</span>
                        <input id="endPoint" type="text" class="date" datefmt="yyyy-MM-dd" name="analysisInput.endPoint" value="${analysisInput.endPoint}"/>
                    </span class="span-label">
                    单位名称:&nbsp;&nbsp;           	
                    	<input type="text" name="analysisInput.unitName" value="${analysisInput.unitName}">
                    <span>
                    </span>
                </div>
            </div>
        </form>
    </div>
    <div class="pageContent">
        <div class="panelBar">
            <ul class="toolBar">
                <li>
                    <a class="icon" href="javascript:exportStatement();"><span>导出</span></a>
                </li>
            </ul>
        </div>
        <div>
            <table width="100%" layoutH="92">
                <thead>
                <tr>
                    <th rowspan="2" width="10%">单位名称</th>
                    <th class="color-blod" colspan="${categoryColspan}" width="45%">安全事件</th>
                    <th class="color-blod" colspan="4" width="45%">安全漏洞</th>
                </tr>
                <tr>
                    <s:iterator value="#request.incCateList" id="ic">
                        <th>${ic.categoryName}</th>
                    </s:iterator>
                    <th class="color-blod">安全事件小计</th>
                    <th>高危漏洞</th>
                    <th>中危漏洞</th>
                    <th>低危漏洞</th>
                    <th class="color-blod">安全漏洞小计</th>
                </tr>
                </thead>
                <tbody>
                <s:iterator value="#request.listIncVul" id="all" status="sta">
                    <tr>
                        <%-- <td>
                            <s:if test="#request.pTypeFlag==1">${BeginDate}</s:if>
                            <s:elseif test="#request.pTypeFlag==2">${TheYear}年${TheOrder}周</s:elseif>
                            <s:elseif test="#request.pTypeFlag==3">${TheYear}年${TheOrder}月</s:elseif>
                            <s:elseif test="#request.pTypeFlag==4">${TheYear}年 第${TheOrder}季度</s:elseif>
                            <s:elseif test="#request.pTypeFlag==5">${TheYear}年</s:elseif>
                        </td> --%>
                        <td>${UnitName }</td>
                        <s:iterator value="#request.incCateList" id="icn">
                            <td><s:if test="#all[icn.categoryName]==null">0</s:if><s:else>${all[icn.categoryName]}</s:else></td>
                        </s:iterator>
                        <td class="color-blod"><s:if test="#all.IncidentCount==null">0</s:if><s:else>${all.IncidentCount}</s:else></td>

                        <td><s:if test="#all['高危漏洞']==null">0</s:if><s:else>${all['高危漏洞']}</s:else></td>
                        <td><s:if test="#all['中危漏洞']==null">0</s:if><s:else>${all['中危漏洞']}</s:else></td>
                        <td><s:if test="#all['低危漏洞']==null">0</s:if><s:else>${all['低危漏洞']}</s:else></td>
                        <td class="color-blod"><s:if test="#all.VulnerabilityCount==null">0</s:if><s:else>${all.VulnerabilityCount}</s:else></td>
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