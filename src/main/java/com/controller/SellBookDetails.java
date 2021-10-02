package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.MysqlConnection;

/**
 * Servlet implementation class SellBookDetails
 */
public class SellBookDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con=com.util.MysqlConnection.getConnection();
		String bookid=request.getParameter("id");
		System.out.println(bookid);
		try {
			Statement stmt=con.createStatement();
			String sql="insert into SellBookDetails select * from DummyBookDetails where id='"+bookid+"'";
			stmt.executeUpdate(sql);
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
