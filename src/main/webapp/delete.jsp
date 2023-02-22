<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,java.io.*"%>
<%@page import="sqlcode.DatabaseConnection" %>

<% 

try{
 Connection con = DatabaseConnection.initializeDatabase();
 
 String id=request.getParameter("id");
 String table=request.getParameter("table");
 String pagename = request.getParameter("page");
 
 Statement st=con.createStatement();
 int i=st.executeUpdate("DELETE FROM "+table+" WHERE id="+id);

	response.setContentType("text/html");
    PrintWriter pw=response.getWriter();
    pw.println("<script type=\"text/javascript\">");
    pw.println("alert('Data Deleted Successfully!');");
    pw.println("</script>");
    response.sendRedirect(pagename);
 
} catch (Exception e) {
    e.printStackTrace();
}



%>