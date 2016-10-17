package com.web;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport {

	private int pageSize;
	private static final long serialVersionUID = 1L;

	protected String getCurrentURI() {
		return ServletActionContext.getRequest().getRequestURI();
	}

	public String getPageContext() {
		return getContextPath();
	}

	protected String getContextPath() {
		return ServletActionContext.getRequest().getContextPath();
	}

	public HttpServletRequest getHttpRequest() {
		return ServletActionContext.getRequest();
	}

	protected HttpSession getHttpSession() {
		return ServletActionContext.getRequest().getSession();
	}

	protected String getRealPath(String fileName) {
		return ServletActionContext.getServletContext().getRealPath(fileName);
	}

	protected ServletContext getServletContext() {
		return ServletActionContext.getServletContext();
	}

	protected ServletOutputStream getOutputStream() {
		try {
			return ServletActionContext.getResponse().getOutputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	protected ActionContext getActionContext() {
		return ActionContext.getContext();
	}

	protected HttpServletResponse getResponse() {

		ServletActionContext.getResponse().setCharacterEncoding("UTF-8");

		return ServletActionContext.getResponse();
	}

	/**
	 * @return the pageSize
	 */
	public int getPageSize() {
		if (this.getHttpSession().getAttribute("pagingStandard") != null) {
			return Integer.parseInt((String) this.getHttpSession()
					.getAttribute("pagingStandard"));
		} else {
			return 10;
		}
	}

	/**
	 * @param pageSize
	 *            the pageSize to set
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	/**
	 * 得到操作者IP
	 * 
	 * @param request
	 * @return
	 */
	public String getIPAddr() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknow".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknow".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknow".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
}
