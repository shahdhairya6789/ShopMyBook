package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bean.Signup;
import com.util.MysqlConnection;

public class Signupinsert {

	public void insert(Signup signup)
	{
		Connection con=MysqlConnection.getConnection();
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("insert into SignupDetails(fname,lname,email,password) values(?,?,?,?)");
			ps.setString(1, signup.getFname());
			ps.setString(2, signup.getLname());
			ps.setString(3, signup.getEmail());
			ps.setString(4, signup.getPassword());
			ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
