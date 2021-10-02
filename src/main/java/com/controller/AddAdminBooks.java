package com.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.util.MysqlConnection;

/**
 * Servlet implementation class AddAdminBooks
 */

@MultipartConfig(fileSizeThreshold=1024*1024*200,maxFileSize = -1L,maxRequestSize=1024*1024*500)
public class AddAdminBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Connection con = null;
		String bookType=request.getParameter("bookType");
		String authorName=request.getParameter("authorName");
		String bookName=request.getParameter("bookName");
		String price=request.getParameter("price");
		String quantity=request.getParameter("quantity");
		Part part = request.getPart("front");
		Part part1 = request.getPart("back");
		String front=extractFileName(part);
		String back=extractFileName(part1);
		Date d=new Date();
		String s[]=d.toString().split(" ");
		String email="admin";
		String description=request.getParameter("description");
		String id=email;
		for(int i=0;i<4;i++)
		{
			id=id+s[i];
			System.out.println(s[i]);
		}
		System.out.println(id);
		String savePath="C:\\Users\\bobo\\Dropbox\\ShopMyBook\\src\\main\\webapp\\BookImages"+File.separator+front;
		String savePath1="C:\\Users\\bobo\\Dropbox\\ShopMyBook\\src\\main\\webapp\\BookImages"+File.separator+back;
		part.write(savePath + File.separator);
		part1.write(savePath1 + File.separator);
		if(part != null){
			try{
				con = MysqlConnection.getConnection();
				if(con==null)
					System.out.println("Null");
				PreparedStatement pst = con.prepareStatement("insert into SellBookDetails(email,id,booktype,authorname,bookname,price,quantity,front,back,description) values(?,?,?,?,?,?,?,?,?,?)");
			    pst.setString(1,email);
			    pst.setString(2,id);
			    pst.setString(3,bookType);
			    pst.setString(4,authorName);
			    pst.setString(5,bookName);
			    pst.setString(6,price);
			    pst.setString(7,quantity);
			    pst.setString(8,front);
			    pst.setString(9,back);
			    pst.setString(10, description);
			    pst.executeUpdate();
			}
			catch(Exception e){
				e.printStackTrace();
			}	
			
		}
		
		response.sendRedirect("AdminHomepage.jsp");
	}
	
	private String extractFileName(Part part)
	{
		String contentDisp=part.getHeader("content-disposition");
		String[] items=contentDisp.split(";");
		for(String s:items)
		{
			if(s.trim().startsWith("filename"))
			{
				return s.substring(s.indexOf("=")+2, s.length()-1);
			}
		}
		return null;
	}
}