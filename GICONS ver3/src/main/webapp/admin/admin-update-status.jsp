<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<% 
String adminId=session.getAttribute("adminId").toString();
String orderId=request.getParameter("orderId");
try{
	String DB_DRIVER = "com.mysql.jdbc.Driver";
	String DB_HOST = "jdbc:mysql://localhost/giconsver3";
	String DB_USER = "root";
	String DB_PASSWORD = "";
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs;
    Class.forName(DB_DRIVER);
    conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
    Statement st=conn.createStatement();
    st.executeUpdate("update orders set orderStatus = 'Completed' ,adminId='"+adminId+"' where orderId='"+orderId+"'");
    response.sendRedirect("admin-order.jsp?msg=updated");	
}
catch (Exception e){
	System.out.println(e);

}



%>

</html>
