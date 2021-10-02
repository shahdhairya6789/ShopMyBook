package com.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminLogin
 */
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}


	public void destroy() {
		// TODO Auto-generated method stub
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext c=getServletContext();
		System.out.println("abc");
		String username=c.getInitParameter("username");
		String password=c.getInitParameter("password");
		
		boolean isError=false;
		String uname=request.getParameter("username");
		String pword=request.getParameter("password");
		if(username.compareTo(uname)!=0)
			isError=true;
		if(password.compareTo(pword)!=0)
			isError=true;
		if(isError==true)
			response.sendRedirect("AdminLogin.jsp");
		else
			response.sendRedirect("AdminHomepage.jsp");
	}
}
