package com.controller;

import java.util.Properties;    
import javax.mail.*;    
import javax.mail.internet.*;
import javax.servlet.http.HttpSession;    
class Mailer1{  
    public static void send(String from,String password,String to,String sub,String msg){  
          //Get properties object    
          Properties props = new Properties();    
          props.put("mail.smtp.host", "smtp.gmail.com");    
          props.put("mail.smtp.socketFactory.port", "465");    
          props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");    
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", "465");    
          //get Session   
          Session session = Session.getDefaultInstance(props,new javax.mail.Authenticator() {    
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication("test@gmail.com","test1234");  
           }    
          });    
          //compose message    
          try {    
           MimeMessage message = new MimeMessage(session);    
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
           message.setSubject(sub);    
           message.setText(msg);    
           //send message  
           Transport.send(message);    
           System.out.println("message sent successfully");    
          } catch (MessagingException e) {throw new RuntimeException(e);}    
          
    }  
    public void sendMail(String email,String uName){
    	
    	Mailer1.send("test@gmail.com","test7898",email,"Verification!!! ","hello "+uName+"\nyou are successful logged");  
        
    }
}  
public class MailOnly{    
 public static void main(String[] args) {    
     //from,password,to,subject,message  
     //change from, password and to
	 Mailer1 m=new Mailer1();
	 m.sendMail("test@gmail.com","test7898");
 }    
 
}    
