package sqlcode;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

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
	  
	            PreparedStatement st = con
	                   .prepareStatement("insert into teacher(fname,lname,email,dept) values(?, ?, ?, ?)");
               
	            st.setString(1, request.getParameter("tfname"));
	            st.setString(2, request.getParameter("tlname"));
	            st.setString(3, request.getParameter("temail"));
	            st.setString(4, request.getParameter("tdepart"));
	  
	            int rowCount = st.executeUpdate();
	            if(rowCount>0) {
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
