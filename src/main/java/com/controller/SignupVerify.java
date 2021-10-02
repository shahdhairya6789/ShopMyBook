package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Signup;
import com.dao.Signupinsert;

/**
 * Servlet implementation class SignupVerify
 */
public class SignupVerify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fName=request.getParameter("fName");
		String lName=request.getParameter("lName");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		Signup signup=new Signup();
		signup.setFname(fName);
		signup.setLname(lName);
		signup.setEmail(email);
		signup.setPassword(password);
		Signupinsert signupinsert =new Signupinsert();
		signupinsert.insert(signup);
		HttpSession session=request.getSession();
		session.setAttribute("email", email);
		Mailer mailer=new Mailer();
		mailer.sendMail(email,fName);
	}

}
