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

@WebServlet("/contact")
public class contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
  		       RequestDispatcher rd = null;
	              try {


	            // Initialize the database
	            Connection con = DatabaseConnection.initializeDatabase();
	  
	            PreparedStatement st = con
	                   .prepareStatement("insert into contact(name,email,phone,msg) values(?, ?, ?, ?)");
               
	            st.setString(1, request.getParameter("name"));
	            st.setString(2, request.getParameter("email"));
	            st.setInt(3, Integer.valueOf(request.getParameter("phone")));
	            st.setString(4, request.getParameter("msg"));
	  
	            int rowCount = st.executeUpdate();
	            if(rowCount>0) {
	            	response.setContentType("text/html");
		            PrintWriter pw=response.getWriter();
		            pw.println("<script type=\"text/javascript\">");
		            pw.println("alert('your Message Send Successfuly');");
		            pw.println("</script>");
		            rd=request.getRequestDispatcher("index.jsp");
	            }else {
	            	response.setContentType("text/html");
		            PrintWriter pw=response.getWriter();
		            pw.println("<script type=\"text/javascript\">");
		            pw.println("alert('Something wrong');");
		            pw.println("</script>");
		            rd=request.getRequestDispatcher("index.jsp");
	            }
	            rd.include(request, response);;
	            return;
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }
		
	}

}
