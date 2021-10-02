package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MysqlConnection;

/**
 * Servlet implementation class AddAddress
 */
public class AddAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String quanitysold=request.getParameter("quantitysold");
		String soldid=request.getParameter("soldid");
		String fname=request.getParameter("fname");
		String mnumber=request.getParameter("mnumber");
//		String pcode=request.getParameter("pcode");
		String fnumber=request.getParameter("fnumber");
		String lmark=request.getParameter("lmark");
		String area=request.getParameter("area");
		String email=(String)request.getSession().getAttribute("email");
		Date d=new Date();
		String cartid=email;
		String s[]=d.toString().split(" ");
		String s1[]=soldid.split(",");
		String s2[]=quanitysold.split(",");
		for(int i=0;i<s1.length;i++)
		{
			System.out.println("a++ "+s1[i]);
		}
		for(int i=0;i<4;i++)
		{
			cartid=cartid+s[i];
			System.out.println(s[i]);
		}
		System.out.println(cartid);
		Connection con=MysqlConnection.getConnection();
		String sql="insert into AddAddress(email,fname,mnumber,fnumber,area,lmark,cartid) values(?,?,?,?,?,?,?)";
		try {
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1,email);
		    pst.setString(2,fname);
		    pst.setString(3,mnumber);
		    pst.setString(4,fnumber);
		    pst.setString(5,area);
		    pst.setString(6,lmark);
		    pst.setString(7,cartid);
		    pst.executeUpdate();
		    String sql1="insert into SoldDetails(email,soldid,quantitysold,cartid) values(?,?,?,?)";
		    PreparedStatement pst1=con.prepareStatement(sql1);
		    pst1.setString(1,email);
		    pst1.setString(2,soldid);
		    pst1.setString(3,quanitysold);
		    pst1.setString(4,cartid);
		    pst1.executeUpdate();
		    Statement stmt=con.createStatement();
		    String sql2="delete from CartDetails where email='"+email+"'";
		    stmt.executeUpdate(sql2);
		    for(int i=0;i<s1.length;i++)
		    {
		    	sql2="select * from SellBookDetails where id='"+s1[i]+"'";
		    	ResultSet rs=stmt.executeQuery(sql2);
		    	String upquantity="";
		    	while(rs.next())
		    	{
		    		Integer updatedquantity=(Integer.parseInt(rs.getString("quantity"))-Integer.parseInt(s2[i]));
			    	upquantity=updatedquantity.toString();
		    	}
		    	Statement stmt1=con.createStatement();
	    		String sql3="update SellBookDetails set quantity='"+upquantity+"' where id='"+s1[i]+"'";
	    		stmt1.executeUpdate(sql3);
		    }
		    response.sendRedirect("Homepage.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
