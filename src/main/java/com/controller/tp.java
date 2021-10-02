package com.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class tp
 */
public class tp  {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	public static void main(String[] args) {
		Date d=new Date();
		String s[]=d.toString().split(" ");
		String id="";
		for(int i=0;i<4;i++)
		{
			id=id+s[i];
			System.out.println(s[i]);
		}
		System.out.println(id);
	}

}
