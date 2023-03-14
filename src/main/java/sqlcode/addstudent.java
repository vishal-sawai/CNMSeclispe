package sqlcode;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.mail.*;  
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeMessage;
import java.util.Properties;
  
import sqlcode.DatabaseConnection;
/**
 * Servlet implementation class addstudent
 */
@WebServlet("/addstudent")
public class addstudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
  		       RequestDispatcher rd = null;
	              try {
	            // Initialize the database
	            Connection con = DatabaseConnection.initializeDatabase();
	            
	            Random rand = new Random();
	            int randno = rand.nextInt(90000) + 10000;
	            String pass =  request.getParameter("fname")+randno;
	  
	            PreparedStatement st = con.prepareStatement("insert into student(fname,lname,phone,roll_no,email,dept,password) values(?, ?, ?, ?, ?, ?,?)");
	      
	            
	            st.setString(1, request.getParameter("fname"));
	            st.setString(2, request.getParameter("lname"));
	            st.setString(3, request.getParameter("phone"));
	            st.setString(4, request.getParameter("rollno"));
	            st.setString(5, request.getParameter("email"));
	            st.setString(6, request.getParameter("depart"));
	            st.setString(7,pass);
	            
	            String email = request.getParameter("email");
	            
	        	Properties props = new Properties();
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.socketFactory.port", "465");
				props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.port", "465");
				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("vishalsawai17252@gmail.com", "bnjmncgivtjpnusq");																								// id and
																										
					}
				});
	        	
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress("vishalsawai17252@gmail.com"));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
				message.setSubject("CNMS Authentication details");
				message.setText("Your Username/Mail: "+email+ " And Your Password Is: "+pass);
			
	         
	  
	            int rowCount = st.executeUpdate();
	            rd=request.getRequestDispatcher("dashboard.jsp");

	            if(rowCount>0) {
	            	Transport.send(message);        	
	            	request.setAttribute("status", "success");            
	            }else {
	                request.setAttribute("status", "failed");
	            }
	            rd.forward(request, response);
	            return;
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }
		
	}

}
