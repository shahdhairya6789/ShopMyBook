package com.util;

import java.sql.Connection; 
import java.sql.DriverManager;

public class MysqlConnection {
	public static Connection getConnection()
	{
		Connection con=null;
		try
		{  
			Class.forName("com.mysql.jdbc.Driver");  
			
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila","root","root"); 
			if(con==null)
			{
				System.out.println("Db is not connected 0");
			}
			else
			{
				System.out.println("Db is Connected 0");
			}
		}
		catch(Exception e){ System.out.println(e);}  
		return con;
	}
	
	public static void main(String args[])
	{  
		MysqlConnection.getConnection();
	}
}
