package sqlcode;

import java.io.FileOutputStream;
import java.io.IOException;

import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
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
@MultipartConfig
@WebServlet("/notes")
public class notes extends HttpServlet {
	RequestDispatcher rd = null;

	
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Part file = request.getPart("file");
		
		String pdfFileName = file.getSubmittedFileName();
		System.out.println("pdf "+ pdfFileName);
          
		String uploadPath = "C:/Users/VISHAL SAWAI/eclipse-workspace/CNMS/src/main/webapp/uploadnotes/"+pdfFileName;
		System.out.println("upload file path "+ uploadPath);
		
		try {
		
		InputStream is = file.getInputStream();
		byte[] data = new byte[is.available()];
		
		is.read(data);
		FileOutputStream fos = new FileOutputStream(uploadPath);

		fos.write(data);
		fos.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		Connection con = null;
		try {
		    String title = request.getParameter("title");
	        String description = request.getParameter("description");
	        String subject = request.getParameter("subject");
	        String dept = request.getParameter("dept");
	        String sem = request.getParameter("sem");
	        String teachername = request.getParameter("teachername");
	        String userid = request.getParameter("userid");
		
	
			// Initialize the database
            con = DatabaseConnection.initializeDatabase();
            
            String sql = "INSERT INTO notes (title, description, filename,subject,dept,class,datetime,teacherid,teacherName) values (?, ?, ?,?, ?, ?,?,?,?)";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, title);
            statement.setString(2, description);
            statement.setString(3,pdfFileName);
            statement.setString(4, subject);
            statement.setString(5, dept);
            statement.setString(6, sem);
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
            LocalDateTime now = LocalDateTime.now();  
            statement.setString(7,dtf.format(now));
            statement.setString(8,userid);
            statement.setString(9,teachername);
            
            int row = statement.executeUpdate();
	        rd=request.getRequestDispatcher("teacherportal.jsp");

            if(row>0)
            {
            	request.setAttribute("status", "success");            }
            else {
                request.setAttribute("status", "failed");

            }
            rd.forward(request, response);;
            return;
		}catch(Exception e) {
			System.out.println(e);
		}
	}
}

