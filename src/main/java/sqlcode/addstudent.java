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
	  
	            PreparedStatement st = con
	                   .prepareStatement("insert into student(fname,lname,phone,roll_no,email,dept) values(?, ?, ?, ?, ?, ?)");
               
	            st.setString(1, request.getParameter("fname"));
	            st.setString(2, request.getParameter("lname"));
	            st.setInt(3, Integer.valueOf(request.getParameter("phone")));
	            st.setInt(4, Integer.valueOf(request.getParameter("rollno")));
	            st.setString(5, request.getParameter("email"));
	            st.setString(6, request.getParameter("depart"));
	  
	            int rowCount = st.executeUpdate();
	            if(rowCount>0) {
	            	response.setContentType("text/html");
		            PrintWriter pw=response.getWriter();
		            pw.println("<script type=\"text/javascript\">");
		            pw.println("alert('Student Added Successfuly');");
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
