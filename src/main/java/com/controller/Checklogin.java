package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.MysqlConnection;

/**
 * Servlet implementation class Checklogin
 */
public class Checklogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		Connection con=MysqlConnection.getConnection();
		System.out.println(email);
		System.out.println(password);
		Statement ps;
		try {
			ps = con.createStatement();
			String sql="select * from SignupDetails where email='"+email+"' and password='"+password+"'";
			ResultSet rs=ps.executeQuery(sql);
			RequestDispatcher rd=null;
			if(rs.next()==false)
			{
				String error="Wrong Email or password";
				rd=request.getRequestDispatcher("AgainSigninDetails.jsp?error="+error);
			}
			else
			{
				HttpSession session=request.getSession();
				session.setAttribute("email", email);
				String cart=request.getParameter("cart");
				//request.setAttribute("cart", cart);
				String id=request.getParameter("id");
				//request.setAttribute("id", id);
				String gotopage=request.getParameter("gotopage");
				//request.setAttribute("gotopage", gotopage);
				String quantity=request.getParameter("quantity");
				//request.setAttribute("quantity", quantity);
				String price=request.getParameter("price");
				System.out.println(price);
				System.out.println(cart);
				System.out.println(id);
				System.out.println(quantity);
				//request.setAttribute("price", price);
				System.out.println(id+" is "+cart);
				if(id.compareTo("null")==0 && cart.compareTo("null")==0)
				{
					rd=request.getRequestDispatcher("MainHome.jsp");
					System.out.println(cart+"if"+id);
				}
				else
				{
					rd=request.getRequestDispatcher("AddtoCart.jsp?cart="+cart+" &id="+id+" &quantity="+quantity+" &price="+price+"");
					System.out.println("else");
				}
			}
			con.close();
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
