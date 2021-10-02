package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendError
 */
public class SendError extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=com.util.MysqlConnection.getConnection();
		String bookid=request.getParameter("id");
		System.out.println(bookid);
		try {
			Statement stmt=con.createStatement();
			String sql="select * from DummyBookDetails where id='"+bookid+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				String email=rs.getString("email");
				String id=rs.getString("id");
				String booktype=rs.getString("booktype");
				String bookname=rs.getString("bookname");
				String authorname=rs.getString("authorname");
				String price=rs.getString("price");
				String quantity=rs.getString("quantity");
				String front=rs.getString("front");
				String back=rs.getString("back");
				String description=rs.getString("description");
				String errordesc=request.getParameter("errordesc");
				PreparedStatement pst = con.prepareStatement("insert into SellBookError(email,id,booktype,authorname,bookname,price,quantity,front,back,description,errordesc) values(?,?,?,?,?,?,?,?,?,?,?)");				pst.setString(1,email);
			    pst.setString(2,id);
			    pst.setString(3,booktype);
			    pst.setString(4,authorname);
			    pst.setString(5,bookname);
			    pst.setString(6,price);
			    pst.setString(7,quantity);
			    pst.setString(8,front);
			    pst.setString(9,back);
			    pst.setString(10, description);
			    pst.setString(11, errordesc);
			    pst.executeUpdate();
			}
			Statement stmt1=con.createStatement();
			String sql1="delete from DummyBookDetails where id='"+bookid+"'";
			stmt1.executeUpdate(sql1);
			response.sendRedirect("AdminHomepage.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
