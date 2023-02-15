package sqlcode;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// Import Database Connection Class file
import sqlcode.DatabaseConnection;
  
@WebServlet("/adminlogin")
public class adminlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final ServletResponse res = null;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
			  
	            // Initialize the database
	            Connection con = DatabaseConnection.initializeDatabase();
	  
	            PreparedStatement st = con
	                   .prepareStatement("select * from admin where email = ? and password = ?");
	  
	            st.setString(1, request.getParameter("username"));
	  
	            st.setString(2, request.getParameter("password"));
	           
	            
	            ResultSet rs = st.executeQuery();
	            
	            HttpSession session = request.getSession();

	            while (rs.next()) {
	            	session.setAttribute("user", request.getParameter("username"));
	                response.sendRedirect("dashboard.jsp?email="+user);
	                return;
	            }
	            response.setContentType("text/html");
	            PrintWriter pw=response.getWriter();
	            pw.println("<script type=\"text/javascript\">");
	            pw.println("alert('Invalid Username or Password');");
	            pw.println("</script>");
	            RequestDispatcher rd=request.getRequestDispatcher("admin_login.jsp");
	            rd.include(request, response);;
	            return;
	 
	
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
		
	}



