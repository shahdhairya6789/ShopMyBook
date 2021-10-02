package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Signup;
import com.dao.Signupinsert;
import com.util.MysqlConnection;

/**
 * Servlet implementation class CheckSignup
 */
public class CheckSignup extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String fName=request.getParameter("fName");
		String lName=request.getParameter("lName");
		String email=request.getParameter("email").toLowerCase();
		String password=request.getParameter("password");
		System.out.println(email);
		Connection con=MysqlConnection.getConnection();
		Statement ps;
		try {
			ps=con.createStatement();
			String sql="select * from  SignupDetails where email='"+email+"'";
			ResultSet rs=ps.executeQuery(sql);
			RequestDispatcher rd=null;
			if(rs.next()==false)
			{
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
				String cart=request.getParameter("cart");
				//request.setAttribute("cart", cart);
				String id=request.getParameter("id");
				//request.setAttribute("id", id);
				String gotopage=request.getParameter("gotopage");
				System.out.println(gotopage);
				//request.setAttribute("gotopage", gotopage);
				String quantity=request.getParameter("quantity");
				//request.setAttribute("quantity", quantity);
				String price=request.getParameter("price");
				//request.setAttribute("price", price);
				if(id.compareTo("null")==0 && cart.compareTo("null")==0)
					rd=request.getRequestDispatcher("MainHome.jsp");
				else
					rd=request.getRequestDispatcher("AddtoCart.jsp?cart="+cart+" &id="+id+" &quantity="+quantity+" &price="+price+"");
			}
			else
			{
				String error="This email is already used";
				request.setAttribute("error", error);
				rd=request.getRequestDispatcher("AgainSignupDetails.jsp");
			}
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}