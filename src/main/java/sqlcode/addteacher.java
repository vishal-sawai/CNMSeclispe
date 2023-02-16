package sqlcode;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
  
import sqlcode.DatabaseConnection;
/**
 * Servlet implementation class addteacher
 */
@WebServlet("/addteacher")
public class addteacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
  		       RequestDispatcher rd = null;
	              try {


	            // Initialize the database
	            Connection con = DatabaseConnection.initializeDatabase();
	            
	            Random rand = new Random();
	            int randno = rand.nextInt(90000) + 10000;
	            String pass =  request.getParameter("tfname")+randno;
	            
	            PreparedStatement st = con.prepareStatement("insert into teacher(fname,lname,email,dept,password) values(?, ?, ?, ?,?)");
               
	            st.setString(1, request.getParameter("tfname"));
	            st.setString(2, request.getParameter("tlname"));
	            st.setString(3, request.getParameter("temail"));
	            st.setString(4, request.getParameter("tdepart"));
	            st.setString(5, pass);
	            
                 String email = request.getParameter("temail");
	            
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
	            if(rowCount>0) {
	            	Transport.send(message);        
	            	response.setContentType("text/html");
		            PrintWriter pw=response.getWriter();
		            pw.println("<script type=\"text/javascript\">");
		            pw.println("alert('Teacher Added Successfuly');");
		            pw.println("</script>");
		            rd=request.getRequestDispatcher("dashboard.jsp");
	            }else {
	            	response.setContentType("text/html");
		            PrintWriter pw=response.getWriter();
		            pw.println("<script type=\"text/javascript\">");
		            pw.println("alert('Something wrong');");
		            pw.println("</script>");
		            rd=request.getRequestDispatcher("dashboard.jsp");
	            }
	            rd.include(request, response);;
	            return;
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }
		
	}

}
