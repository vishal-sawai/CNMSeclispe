package sqlcode;

import java.io.IOException;
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
	  
	            PreparedStatement st = con.prepareStatement("insert into contact(name,email,phone,msg) values(?, ?, ?, ?)");
               
	            st.setString(1, request.getParameter("name"));
	            st.setString(2, request.getParameter("email"));
	            st.setString(3, request.getParameter("phone"));
	            st.setString(4, request.getParameter("msg"));
	  
	            int rowCount = st.executeUpdate();
	            if(rowCount>0) {
	                request.setAttribute("status", "success");
		            rd=request.getRequestDispatcher("index.jsp");
	            }else {
	                request.setAttribute("status", "failed");
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
