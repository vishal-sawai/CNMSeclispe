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
 * Servlet implementation class studentlogin
 */
@WebServlet("/studentlogin")
public class studentlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final ServletResponse res = null;
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;
        HttpSession session = request.getSession();
        String user = request.getParameter("username");
		 try {
			  
	            // Initialize the database
	            Connection con = DatabaseConnection.initializeDatabase();
	  
	            PreparedStatement st = con
	                   .prepareStatement("select * from student where email = ? and password = ?");
	  
	            st.setString(1, request.getParameter("username"));
	  
	            st.setString(2, request.getParameter("password"));
	           
	            
	            ResultSet rs = st.executeQuery();
	            rd=request.getRequestDispatcher("login.jsp");
	            if(rs.next()) {
	            	session.setAttribute("studentUser",user);
	            	request.setAttribute("status", "success");
		            rd=request.getRequestDispatcher("index.jsp");
	            }else {
	                request.setAttribute("status", "failed");
		        }
	            rd.include(request, response);;
	            return;
	 
	
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
		

}
