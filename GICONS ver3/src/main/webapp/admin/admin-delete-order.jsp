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
    st.executeUpdate("delete from orders where orderId='"+orderId+"'");
    response.sendRedirect("admin-status.jsp?msg=order-deleted");	
%>

<script>
function myFunction() {
  alert("Succefully delete an order!");
}
</script>
<%
}
catch (Exception e){
	System.out.println(e);

}

%>

