package com.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

public class ForgetPasswordController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// j1iQn/RbJX0-cWwG83SPicIV8kYNkwQiJFRqCS7xhE
		// u0V2a92ec6s-545VAdHKpNjTPCZLjGf0OJpjx3uhQC
		//String mo = request.getParameter("mo");
		String api="u0V2a92ec6s-545VAdHKpNjTPCZLjGf0OJpjx3uhQC";

		try {
			// Construct data
			String apiKey = "apikey=" + api;
			String message = "&message=" + "Congratualations!!!! Now you can also suck DB's big cock.\nNow DB is your new Customer";
			String sender = "&sender=" + "TXTLCL";
			String numbers = "&numbers=" + "916351937227";
			
			HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
			String data = apiKey + numbers + message + sender;
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
			conn.getOutputStream().write(data.getBytes("UTF-8"));
			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			final StringBuffer stringBuffer = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
				stringBuffer.append(line);
			}
			rd.close();
			
			System.out.println(stringBuffer.toString());
		} catch (Exception e) {
			System.out.println("Error SMS "+e);
			//return "Error "+e;
		}
		}
}