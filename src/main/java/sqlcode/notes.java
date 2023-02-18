package sqlcode;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
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
	private final String UPLOAD_DIRECTORY = "uploads";
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		        String title = request.getParameter("title");
		        String description = request.getParameter("description");
		        String subject = request.getParameter("subject");
		        String filename = request.getParameter("filename");
		        String sem = request.getParameter("sem");

		         
		        InputStream inputStream = null; 
		         
		        Part filePart = request.getPart("photo");
		        if (filePart != null) {
		            // prints out some information for debugging
		            System.out.println(filePart.getName());
		            System.out.println(filePart.getSize());
		            System.out.println(filePart.getContentType());
		             
		            // obtains input stream of the upload file
		            inputStream = filePart.getInputStream();
		        }
		         
		        String message = null; 
		        String conn = null;
		         
		        try {
		       	 // Initialize the database
		            Connection conn = DatabaseConnection.initializeDatabase();
		            String sql = "INSERT INTO notes (title, description, filename,subject,dept,class,datetime,teacherid) values (?, ?, ?,?, ?, ?,?, ?)";
		            PreparedStatement statement = conn.prepareStatement(sql);
		            statement.setString(1, title);
		            statement.setString(2, description);
		             
		            if (inputStream != null) {
		                // fetches input stream of the upload file for the blob column
		                statement.setBlob(3, inputStream);
		            }
		 
		            // sends the statement to the database server
		            int row = statement.executeUpdate();
		            if (row > 0) {
		                message = "File uploaded and saved into database";
		            }
		        } catch (SQLException ex) {
		            message = "ERROR: " + ex.getMessage();
		            ex.printStackTrace();
		        } finally {
		            if (conn != null) {
		                // closes the database connection
		                try {
		                    conn.close();
		                } catch (SQLException ex) {
		                    ex.printStackTrace();
		                }
		            }
		            // sets the message in request scope
		            request.setAttribute("Message", message);
		             
		            // forwards to the message page
		            getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
		        }
		    }

	}

}
