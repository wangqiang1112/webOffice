package com.yuanwang.web.jointPlatform.earlywarning.dispose.action;

import com.opensymphony.xwork2.ModelDriven;
import com.yuanwang.web.jointPlatform.audit.LogAspect;
import com.yuanwang.web.jointPlatform.audit.LogType;
import com.yuanwang.web.jointPlatform.earlywarning.BaseAction;
import com.yuanwang.web.jointPlatform.earlywarning.dispose.dao.IncidentDao;
import com.yuanwang.web.jointPlatform.earlywarning.dispose.input.DisposeInput;
import com.yuanwang.web.jointPlatform.util.AjaxResult;
import com.yuanwang.web.jointPlatform.util.ExcelMakes;
import com.yuanwang.web.jointPlatform.util.dwz.AjaxObject;
import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.hssf.util.CellRangeAddressList;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 安全事件处理Action
 * Created by CYRUS on 2016/7/29.
 */
@Component
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class IncidentAction extends BaseAction implements ModelDriven<DisposeInput> {

    @Autowired
    private LogAspect logAspect;

    @Autowired
    private IncidentDao incidentDao;

    private File file;

    private String fileFileName;

    private DisposeInput disposeInput = new DisposeInput();

    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    /**
     * 安全事件处理主页
     *
     * @return
     */
    public String main() {
        addRequestAttribute("maxDate", sdf.format(new Date()));

        String pstate = String.valueOf(disposeInput.getProcessState());
        if ("-1".equals(pstate)) {
            disposeInput.setProcessStates("");
        } else {
            disposeInput.setProcessStates(pstate);
        }
        Map<String, Object> incMap = incidentDao.listIncident(disposeInput);
        List<Map<String, Object>> incList = (List<Map<String, Object>>) incMap.get("list");
        for (Map<String, Object> map : incList) {
            if ("1900-01-01 00:00:00.0".equals(map.get("ProcessTime").toString())) {
                map.put("ProcessTime", "");
            }
            if ("1900-01-01 00:00:00.0".equals(map.get("UpdateTime").toString())) {
                map.put("UpdateTime", "");
            }
            if ("1900-01-01 00:00:00.0".equals(map.get("OccurTime").toString())) {
                map.put("OccurTime", "");
            }
        }
        addRequestAttribute("incList", incList);

        logAspect.audit(1, LogType.SystemAudit, "安全预警", "安全预警->预警处理->安全事件处理->主页");
        return SUCCESS;
    }

    /**
     * 转到安全事件处理页面
     */
    public String toHandle() {
        int stateFlag = disposeInput.getToHandleState();
        if (stateFlag == 1) {//新增事件
            List<Map<String, Object>> unitList = incidentDao.listUnit();
            addRequestAttribute("unitList", unitList);
        } else {
            Map<String, Object> incMap = incidentDao.listIncident(disposeInput);
            Map<String, Object> map = incidentDao.listIncidentProgress(disposeInput);
            List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("list");
            String details = "";
            for (Map<String, Object> stringObjectMap : list) {
                int state = Integer.parseInt(stringObjectMap.get("ProcessState").toString());
                if (state == 9 || state == 4) {
                    details = stringObjectMap.get("ProcessDesc").toString();
                    break;
                }
            }

            List<Map<String, Object>> incList = (List<Map<String, Object>>) incMap.get("list");
            if (incList.size() > 0) {
                Map<String, Object> m = incList.get(0);
                m.put("ProcessDesc", details);
                addRequestAttribute("incMap", m);
                disposeInput.setProcessState(Integer.parseInt(m.get("ProcessState").toString()));
            }
        }
        addRequestAttribute("stateFlag", stateFlag);
        List<Map<String, Object>> cateList = incidentDao.listIncidentCategory(1);
        addRequestAttribute("cateList", cateList);

        logAspect.audit(1, LogType.SystemAudit, "安全预警", "安全预警->预警处理->安全事件处理->处理页面");
        return SUCCESS;
    }

    /**
     * 安全事件处理
     */
    public AjaxResult handle() {
        int i = 0;
        String MSG = MSG_ERROR;
        if (disposeInput.getProcessType() == 3) {
            DisposeInput input = new DisposeInput();
            input.setIncidentId(disposeInput.getIncidentId());
            Map<String, Object> map = incidentDao.listIncident(input);
            List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("list");
            Map<String, Object> incMap = list.get(0);
            int pState = Integer.parseInt(incMap.get("ProcessState").toString());
            if (pState == 0 || pState == 10) {
                i = incidentDao.processIncident(disposeInput);
            } else {
                i = 0;
                MSG = "该状态无法删除！";
            }
        } else {
            i = incidentDao.processIncident(disposeInput);
        }
        AjaxObject ajaxObject = i > 0 ? AjaxObject.newRefreshNavtab(NAVTAB_ID, MSG_OK) : AjaxObject.newError(MSG);

        logAspect.audit(1, LogType.SystemAudit, "安全预警", "安全预警->预警处理->安全事件处理->处理功能");
        return AjaxResult.valueOf(ajaxObject);
    }


    /**
     * 状态修改
     */
    public void editState() {
        int curState = disposeInput.getProcessState();
        int flag = 0;
        flag = incidentDao.editState(disposeInput);


        getResponse().setContentType("text/html");// 服务器告诉浏览器响应内容以text/html的方式打开
        try {
            getResponse().getWriter().write(flag + "");
        } catch (IOException e) {
            e.printStackTrace();
        }// js获得后台返回的值

        logAspect.audit(1, LogType.SystemAudit, "安全预警", "安全预警->预警处理->安全事件处理->状态修改");
    }

    /**
     * 跳转到导入页面
     *
     * @return
     */
    public String toIncImport() {
        logAspect.audit(1, LogType.SystemAudit, "安全预警", "安全预警->预警处理->安全事件处理->导入页面");
        return "success";
    }

    /**
     * 批量导入安全事件
     */
    public void importExcel() {
        String serverPath = ServletActionContext.getServletContext().getRealPath("/");
        if (serverPath.indexOf("\\") != -1) {
            if (!serverPath.substring(serverPath.length() - 1).equals("\\")) {
                serverPath = serverPath + "\\";
            }
        }
        String path = serverPath + "upload\\earlyWarnning\\";

        if (!path.equals("")) {
            File dir = new File(path);
            if (!dir.exists()) {
                dir.mkdirs();
            }

        }

        File newFile = new File(path, fileFileName);
        //如果文件存在，删除原有文件
        if (newFile.exists()) {
            newFile.delete();
        }
        try {
            FileUtils.copyFile(file, newFile);
        } catch (IOException e) {
            e.printStackTrace();
        }

        List<DisposeInput> listInputs = excelToObject(newFile);
        int rows = 0;
        int row;
        if (listInputs.size() == 0) {
            row = 0;//表格为空
        } else {
            for (int i = 0; i < listInputs.size(); i++) {
                listInputs.get(i).setProcessState(0);
                rows += incidentDao.processIncident(listInputs.get(i));
            }
            if (rows == listInputs.size()) {
                row = 1;//导入成功
            } else {
                row = -1;//导入有误
            }
        }

        getResponse().setContentType("text/html");// 服务器告诉浏览器响应内容以text/html的方式打开
        try {
            getResponse().getWriter().write("<div id='importNum'>" + row + "</div>");
        } catch (IOException e) {
            e.printStackTrace();
        }// js获得后台返回的值
        logAspect.audit(1, LogType.SystemAudit, "安全预警", "安全预警->预警处理->安全事件处理->批量导入");
    }

    public List<DisposeInput> excelToObject(File file) {
        List<DisposeInput> inputList = new ArrayList<DisposeInput>();
        List<Map<String, Object>> cateList = incidentDao.listIncidentCategory(1);
        List<Map<String, Object>> unitList = incidentDao.listUnit();

        Workbook workbook = null;
        try {
            workbook = new HSSFWorkbook(new FileInputStream(file));
        } catch (Exception e) {

        }
        Sheet sheet = workbook.getSheetAt(0);//获得第一个表单
        int firstRowNum = sheet.getFirstRowNum();//第一行
        int lastRowNum = sheet.getLastRowNum();

        Row titleRow = sheet.getRow(0);
        Cell titleCell = titleRow.getCell(0);
        String title = titleCell.getStringCellValue();
        if (title.indexOf("安全事件") == -1) {
            return inputList;
        }


        //跳过标题行
        for (int i = firstRowNum + 3; i < lastRowNum + 1; i++) {
            DisposeInput input = new DisposeInput();
            input.setProcessType(1);
            Row row = sheet.getRow(i);
            if (row == null) {
                continue;
            }
            int j = 0;
            Cell cell = row.getCell(j);

            //单位名称
            if (cell != null) {
                boolean flag = true;
                if (!emptyStringCell(cell)) {
                    for (Map<String, Object> unitMap : unitList) {
                        if (unitMap.get("UnitName").toString().equals(getStringCellValue(cell))) {
                            input.setUnitId(Integer.parseInt(unitMap.get("UnitId").toString()));
                            input.setUnitName(getStringCellValue(cell));
                            flag = false;
                        }
                    }
                    if (flag) {
                        continue;
                    }
                } else {
                    continue;
                }
            } else {
                continue;
            }
            //事件名称
            cell = row.getCell(++j);
            if (cell != null) {
                if (!emptyStringCell(cell)) {
                    input.setIncidentName(getStringCellValue(cell));
                } else {
                    continue;
                }
            } else {
                continue;
            }
            //事件类型
            cell = row.getCell(++j);
            if (cell != null) {
                if (!emptyStringCell(cell)) {
                    for (Map<String, Object> map : cateList) {
                        if (getStringCellValue(cell).equals(map.get("CategoryName").toString())) {
                            input.setCategoryId(Integer.parseInt(map.get("CategoryId").toString()));
                            input.setCategoryName(map.get("CategoryName").toString());
                        }
                    }
                } else {
                    continue;
                }
            } else {
                continue;
            }
            //事件分级
            cell = row.getCell(++j);
            if (cell != null) {
                if (!emptyStringCell(cell)) {
                    int classification = -1;
                    if ("特别重大事件".equals(getStringCellValue(cell))) {
                        classification = 1;
                    } else if ("重大事件".equals(getStringCellValue(cell))) {
                        classification = 2;
                    } else if ("较大事件".equals(getStringCellValue(cell))) {
                        classification = 3;
                    } else if ("一般事件".equals(getStringCellValue(cell))) {
                        classification = 4;
                    }
                    input.setClassification(classification);
                } else {
                    continue;
                }
            } else {
                continue;
            }
            //发生时间
            cell = row.getCell(++j);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date curTime = new Date();
            if (HSSFDateUtil.isCellDateFormatted(cell)) {
                Date writeTime = HSSFDateUtil.getJavaDate(cell.getNumericCellValue());
                input.setOccurTime(sdf.format(curTime.getTime() < writeTime.getTime() ? curTime : writeTime));
            } else {
                input.setOccurTime(sdf.format(curTime));
            }

            //事件详情
            cell = row.getCell(++j);
            if (cell != null) {
                if (!emptyStringCell(cell)) {
                    input.setDescription(getStringCellValue(cell));
                } else {
                    continue;
                }
            } else {
                continue;
            }
            //建议处理方法
            cell = row.getCell(++j);
            if (cell != null) {
                if (!emptyStringCell(cell)) {
                    input.setAdvice(getStringCellValue(cell));
                }
            }

            inputList.add(input);
        }

        return inputList;

    }

    /**
     * 导出安全事件列表
     *
     * @throws IOException
     */
    @SuppressWarnings("unchecked")
    public void exportIncList() throws IOException {
        disposeInput.setPageSize(100000000);
        disposeInput.setPageIndex(0);
        String pstate = String.valueOf(disposeInput.getProcessState());
        if ("-1".equals(pstate)) {
            disposeInput.setProcessStates("");
        } else {
            disposeInput.setProcessStates(pstate);
        }
        Map<String, Object> map = incidentDao.listIncident(disposeInput);
        List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("list");

        //表列名
        String[] cellNames = {"序号", "单位名称", "事件名称", "事件类型", "事件分级", "事件发生时间", "处理时间", "处理状态", "事件详情", "建议处理方法", "更新时间"};
        String[] orderedAttrs = {"RowNumber", "UnitName", "IncidentName", "CategoryName", "Classification", "OccurTime", "ProcessTime", "ProcessState", "Description", "Advice", "UpdateTime"};
        /****
         *测试单表格数据
         */
        ExcelMakes excel = new ExcelMakes("安全事件列表", cellNames, orderedAttrs);

        excel.setTitile("安全事件列表");
        List<Map<String, Object>> list11 = new ArrayList<Map<String, Object>>();
        for (int j = 0; j < list.size(); j++) {
            Map<String, Object> map11 = list.get(j);
            int classification = Integer.parseInt(map11.get("Classification").toString());
            int processState = Integer.parseInt(map11.get("ProcessState").toString());
            String secretLevel = "";//事件分级
            String isBasic = "";//处理状态
            if (classification == 1) {
                secretLevel = "特别重大事件";
            } else if (classification == 2) {
                secretLevel = "重大事件";
            } else if (classification == 3) {
                secretLevel = "较大事件";
            } else if (classification == 4) {
                secretLevel = "一般事件";
            }
            map11.put("Classification", secretLevel);
            if (processState == 0) {
                isBasic = "未下发";
            } else if (processState == 1) {
                isBasic = "已下发";
            } else if (processState == 2) {
                isBasic = "已接收";
            } else if (processState == 3) {
                isBasic = "已打回";
            } else if (processState == 4) {
                isBasic = "已处理";
            } else if (processState == 5) {
                isBasic = "已关闭";
            } else if (processState == 10) {
                isBasic = "已忽略";
            }
            map11.put("ProcessState", isBasic);

            //将时间为“1900-01-01 00:00:00”的字段设置为空
            String time = map11.get("ProcessTime").toString().substring(0, 19);
            map11.put("ProcessTime", "1900-01-01 00:00:00".equals(time) ? "" : time);

            list11.add(map11);
        }
        excel.addData(list11);
        logAspect.audit(1, LogType.SystemAudit, "安全预警", "安全预警->预警处理->安全事件处理->导出");
    }


    public void exportModel() {
        HttpServletResponse response = super.getResponse();
        response.reset();
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment;filename=" + encodeFileName("安全事件模板") + ".xls");
        try {
            OutputStream out = response.getOutputStream();
            HSSFWorkbook wb = new HSSFWorkbook();
            HSSFSheet sheet = wb.createSheet("new sheet");

            //标题样式
            CellStyle styleTitle = wb.createCellStyle();
            Font titleFont = wb.createFont();
            titleFont.setFontHeightInPoints((short) 18);
            titleFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
            styleTitle.setAlignment(CellStyle.ALIGN_CENTER);
            styleTitle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
            styleTitle.setFont(titleFont);
            sheet.addMergedRegion(CellRangeAddress.valueOf("$A$1:$G$1"));
            sheet.addMergedRegion(CellRangeAddress.valueOf("$A$2:$G$2"));
            HSSFRow titleRowss = sheet.createRow(0);
            HSSFCell titleCells = titleRowss.createCell(0);
            titleCells.setCellValue("安全事件列表");
            titleCells.setCellStyle(styleTitle);


            //标注样式
            CellStyle styleAttr = wb.createCellStyle();
            Font attrFont = wb.createFont();
            attrFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
            attrFont.setColor(HSSFColor.RED.index);
            styleAttr.setFont(attrFont);

            HSSFRow rowMark = sheet.createRow(1);
            HSSFCell cellMark = rowMark.createCell(0);
            cellMark.setCellStyle(styleAttr);
            cellMark.setCellValue("**建议处理方法为非必填项，其余未必填项；时间格式：2016-06-06 12:12:12");

            sheet.setColumnWidth(0, 25 * 256);
            sheet.setColumnWidth(1, 25 * 256);
            sheet.setColumnWidth(2, 25 * 256);
            sheet.setColumnWidth(3, 25 * 256);
            sheet.setColumnWidth(4, 30 * 256);
            sheet.setColumnWidth(5, 50 * 256);
            sheet.setColumnWidth(6, 50 * 256);

            //字段样式
            HSSFRow row = sheet.createRow(2);
            CellStyle styleAttr1 = wb.createCellStyle();
            Font attrFont1 = wb.createFont();
            attrFont1.setBoldweight(Font.BOLDWEIGHT_BOLD);
            attrFont1.setColor(HSSFColor.BLACK.index);
            styleAttr1.setFont(attrFont1);
            attrFont1.setColor(HSSFColor.BLACK.index);
            styleAttr1.setFont(attrFont1);

            HSSFCell cell0 = row.createCell(0);
            cell0.setCellStyle(styleAttr1);
            cell0.setCellValue("单位名称");
            HSSFCell cell1 = row.createCell(1);
            cell1.setCellStyle(styleAttr1);
            cell1.setCellValue("事件名称");
            HSSFCell cell2 = row.createCell(2);
            cell2.setCellStyle(styleAttr1);
            cell2.setCellValue("事件类型");
            HSSFCell cell3 = row.createCell(3);
            cell3.setCellStyle(styleAttr1);
            cell3.setCellValue("事件分级");
            HSSFCell cell4 = row.createCell(4);
            cell4.setCellStyle(styleAttr1);
            cell4.setCellValue("发生时间");
            HSSFCell cell5 = row.createCell(5);
            cell5.setCellStyle(styleAttr1);
            cell5.setCellValue("事件详情");
            HSSFCell cell6 = row.createCell(6);
            cell6.setCellStyle(styleAttr1);
            cell6.setCellValue("建议处理方法");

            //单位名称
            List<Map<String, Object>> unitList = incidentDao.listUnit();
            String[] unitListCell = new String[unitList.size()];
            if (unitList.size() > 0) {
                for (int m = 0; m < unitList.size(); m++) {
                    unitListCell[m] = unitList.get(m).get("UnitName").toString();
                }
            }

            //事件分类名称
            List<Map<String, Object>> cateList = incidentDao.listIncidentCategory(1);
            String[] cateListCell = new String[cateList.size()];
            if (cateList.size() > 0) {
                for (int m = 0; m < cateList.size(); m++) {
                    cateListCell[m] = cateList.get(m).get("CategoryName").toString();
                }
            }

            //事件分级
            String[] classification = new String[]{"特别重大事件", "重大事件", "较大事件", "一般事件"};

            for (int i = 3; i < 1000; i++) {
                //设置事件名称单元格为文本类型
                CellStyle css = wb.createCellStyle();
                DataFormat df = wb.createDataFormat();
                css.setDataFormat(df.getFormat("@"));
                sheet.setDefaultColumnStyle(1, css);
                //单位名称下拉菜单
                CellRangeAddressList unitRegions = new CellRangeAddressList(i, i, 0, 0);
                DVConstraint unitConstraint = DVConstraint.createExplicitListConstraint(unitListCell);
                HSSFDataValidation unitDataValidation = new HSSFDataValidation(unitRegions, unitConstraint);
                sheet.addValidationData(unitDataValidation);

                //事件类型下拉菜单
                CellRangeAddressList cateRegions = new CellRangeAddressList(i, i, 2, 2);
                DVConstraint cateConstraint = DVConstraint.createExplicitListConstraint(cateListCell);
                HSSFDataValidation cateDataValidation = new HSSFDataValidation(cateRegions, cateConstraint);
                sheet.addValidationData(cateDataValidation);

                //事件分级下拉菜单
                CellRangeAddressList classificationRegions = new CellRangeAddressList(i, i, 3, 3);
                DVConstraint classificationConstraint = DVConstraint.createExplicitListConstraint(classification);
                HSSFDataValidation classificationDataValidation = new HSSFDataValidation(classificationRegions, classificationConstraint);
                sheet.addValidationData(classificationDataValidation);
            }

            wb.write(out);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        logAspect.audit(1, LogType.SystemAudit, "安全预警", "安全预警->预警处理->安全事件处理->模版导出");
    }


    protected static String encodeFileName(String fileName) {
        try {
            return new String(fileName.getBytes(), "ISO8859-1");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }

    private static boolean emptyStringCell(Cell cell) {

        return cell == null || "".equals(getStringCellValue(cell));
    }

    private static String getStringCellValue(Cell cell) {
        try {
            return cell.getStringCellValue();
        } catch (Exception e) {
            switch (cell.getCellType()) {
                case Cell.CELL_TYPE_BOOLEAN:
                    return String.valueOf(cell.getBooleanCellValue());
                case Cell.CELL_TYPE_NUMERIC:
                    return String.valueOf(cell.getNumericCellValue());
                case Cell.CELL_TYPE_ERROR:
                    return String.valueOf(cell.getErrorCellValue());
                default:
                    return "";
            }
        }
    }


    @Override
    public DisposeInput getModel() {
        return disposeInput;
    }

    private static String NAVTAB_ID = "620";

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }


}
