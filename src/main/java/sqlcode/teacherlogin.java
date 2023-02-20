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

/**
 * Servlet implementation class teacherlogin
 */
@WebServlet("/teacherlogin")
public class teacherlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final ServletResponse res = null;
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
        HttpSession session = request.getSession();
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
		 try {
			  
	            // Initialize the database
	            Connection con = DatabaseConnection.initializeDatabase();
	  
	            PreparedStatement st = con
	                   .prepareStatement("select * from teacher where email = ? and password = ?");
	  
	            st.setString(1, request.getParameter("username"));
	  
	            st.setString(2, request.getParameter("password"));
	           
	            
	            ResultSet rs = st.executeQuery();

	            if(rs.next()) {
	            	session.setAttribute("TeacherUser",user);
	            	session.setAttribute("TeacherPass",pass);

	                rd=request.getRequestDispatcher("teacherportal.jsp");
	            }else {
	            response.setContentType("text/html");
	            PrintWriter pw=response.getWriter();
	            pw.println("<script type=\"text/javascript\">");
	            pw.println("alert('Invalid Username or Password');");
	            pw.println("</script>");
	            rd=request.getRequestDispatcher("login.jsp");
		        }
	            rd.include(request, response);;
	            return;
	 
	
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}