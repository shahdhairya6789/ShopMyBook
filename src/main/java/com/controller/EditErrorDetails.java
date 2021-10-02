package com.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.util.MysqlConnection;

/**
 * Servlet implementation class EditErrorDetails
 */

@MultipartConfig(fileSizeThreshold=1024*1024*200,maxFileSize = -1L,maxRequestSize=1024*1024*500)
public class EditErrorDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		Connection con = null;
		String bookType=request.getParameter("bookType");
		String authorName=request.getParameter("authorName");
		System.out.println(authorName);
		String bookName=request.getParameter("bookName");
		System.out.println(bookName);
		String price=request.getParameter("price");
		System.out.println(price);
		String quantity=request.getParameter("quantity");
		Part part = request.getPart("front");
		Part part1 = request.getPart("back");
		String front=extractFileName(part);
		String back=extractFileName(part1);
		String id=request.getParameter("id");
		System.out.println("id is"+id);
		String email=(String)request.getSession().getAttribute("email");
		String description=request.getParameter("description");
		String savePath="C:\\Users\\bobo\\Dropbox\\ShopMyBook\\src\\main\\webapp\\BookImages"+File.separator+front;
		System.out.println("savepathasasasa");
		String savePath1="C:\\Users\\bobo\\Dropbox\\ShopMyBook\\src\\main\\webapp\\BookImages"+File.separator+back;
		part.write(savePath + File.separator);
		part1.write(savePath1 + File.separator);
		if(part != null){
			try{
				con = MysqlConnection.getConnection();
				Statement stmt=con.createStatement();
				String sql="delete from SellBookError where id='"+id+"'";
				stmt.executeUpdate(sql);
				System.out.println("Insert");
				PreparedStatement pst = con.prepareStatement("insert into DummyBookDetails(email,id,booktype,authorname,bookname,price,quantity,front,back,description) values(?,?,?,?,?,?,?,?,?,?)");				
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
		response.sendRedirect("Search.jsp");
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
