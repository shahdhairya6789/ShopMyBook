package com.controller;
import java.io.File;  
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.util.MysqlConnection;

//import com.util.DbConnection;


/**
 * Servlet implementation class ImageUploadServlet
 */
@MultipartConfig(fileSizeThreshold=1024*1024*200,maxFileSize = 1024*1024*100,maxRequestSize=1024*1024*500)
public class ViewProfile extends HttpServlet{
 
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		response.setContentType("text/html;charset=UTF-8");
		Connection con = null;
		Part part = request.getPart("file");
		String fileName=extractFileName(part);
		String savePath="C:\\Users\\Dell\\Dropbox\\ShopMyBook\\src\\main\\webapp\\profile"+File.separator+fileName;
		File fileSaveDir=new File(savePath);
		part.write(savePath + File.separator);
		
		System.out.println("Part");
		if(part != null){
			System.out.println("If");
			try{				
		
			con = MysqlConnection.getConnection();
			if(con==null)
				System.out.println("Null");
			else
				System.out.println("Not null");
			    //PreparedStatement pst = con.prepareStatement("insert into img_table(id,filename,path) values(?,?,?)");
			    
			    String email = (String) request.getSession().getAttribute("email");
			    Statement stmt=con.createStatement();
			    if(stmt.executeUpdate("update  ViewProfile set front='"+fileName+"' where email='"+email+"'")==0){
			    	System.out.println("no update");
			    }
				else{
					System.out.println("Yes");
				}
			con.close();
			    
			}
			catch(Exception e){
				e.printStackTrace();
			}	
			
		}
		
		response.sendRedirect("ViewProfile.jsp");
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


