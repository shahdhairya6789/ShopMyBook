package com.controller;

import java.io.IOException; 
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.util.MysqlConnection;;




/**
 * Servlet implementation class SearchAjax2
 */
public class SearchAjax2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		Connection con = null;
        PrintWriter out = null;
        Statement stmt = null;
        ResultSet rs = null;
        String s=request.getParameter("id");
        //System.out.println();
        JSONObject jsonObject = null,dbObject=null;
        JSONArray dbResultJSON;
        try {
        	out=response.getWriter();
			con=MysqlConnection.getConnection();
			stmt=con.createStatement();
			String q="select bookname from sellbookdetails where bookname like '"+s+"%"+"'";
			System.out.println(q);
			rs = stmt.executeQuery(q);
			//ArrayList< String> li=new ArrayList<String>();
			int size =0;
//			if (rs != null) 
//			{
//			  rs.last();    // moves cursor to the last row
//			  size = rs.getRow(); // get row id 
//			}
			//System.out.println(size);
			//if (!resultSet.next()) {
			dbResultJSON =new JSONArray();	
			int cnt=0;
			while(rs.next()) {
					jsonObject=new JSONObject();
					
            		jsonObject.put("name", rs.getString("bookname"));
            		//li.add(rs.getString("name"));
            		
            		dbResultJSON.add(jsonObject);
            		cnt++;
            	}
            System.out.println("cnt"+cnt);
            	//dbObject=new JSONObject();
            	//dbObject.put("json", dbResultJSON);
            	//out.write(li.toString());
            	//System.out.println(jsonObject.size());
            	out.write(dbResultJSON.toString()); 
            
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
