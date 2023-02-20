package sqlcode;

import java.io.IOException;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import sqlcode.DatabaseConnection;

/**
 * Servlet implementation class notes
 */
@WebServlet("/notes")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class notes extends HttpServlet {
	@SuppressWarnings("unused")
	private final String UPLOAD_DIRECTORY = "uploadsnotes";
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		        String title = request.getParameter("title");
		        String description = request.getParameter("description");
		        String subject = request.getParameter("subject");
		        String dept = request.getParameter("dept");
		        String filename = request.getParameter("filename");
		        String sem = request.getParameter("sem");
		        String usermail = request.getParameter("usermail");
		        String teachername = request.getParameter("teachername");
		        String userid = request.getParameter("userid");

		         
		        InputStream inputStream = null; 
		         
		        Part filePart = request.getPart("uploadnotes");
		        if (filePart != null) {
		            // prints out some information for debugging
		            System.out.println(filePart.getName());
		            System.out.println(filePart.getSize());
		            System.out.println(filePart.getContentType());
		             
		            // obtains input stream of the upload file
		            inputStream = filePart.getInputStream();
		        }
		         
		        String message = null;
		        Connection con = null;
		        
		        try {
		       	 // Initialize the database
		            con = DatabaseConnection.initializeDatabase();
		            String sql = "INSERT INTO notes (title, description, filename,subject,dept,class,datetime,teacherid,teacherName) values (?, ?, ?,?, ?, ?,?,?,?)";
		            PreparedStatement statement = con.prepareStatement(sql);
		            statement.setString(1, title);
		            statement.setString(2, description);
		            statement.setString(4, subject);
		            statement.setString(5, dept);
		            statement.setString(6, sem);
		            Date date = new Date();
		            statement.setString(7,date.toString());
		            statement.setString(8,userid);
		            statement.setString(9,teachername);

		            
		            
		            if (inputStream != null) {
		                statement.setBlob(3, inputStream);
		            }
		 
		            // sends the statement to the database server
		            int row = statement.executeUpdate();
		            if (row > 0) {
		                message = "File uploaded and saved into database";
		            }
		        } catch (SQLException | ClassNotFoundException ex) {
		            message = "ERROR: " + ex.getMessage();
		            ex.printStackTrace();
		        }
		        finally {
		            if (con != null) {
		                // closes the database connection
		                try {
		                    con.close();
		                } catch (SQLException ex) {
		                    ex.printStackTrace();
		                }
		            }
		            // sets the message in request scope
		            //request.setAttribute("Message", message);
		             
		            // forwards to the message page
		            //getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
		        }
		    }

	}


