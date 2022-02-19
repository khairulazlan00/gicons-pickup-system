
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>

<%
String id=request.getParameter("id");
String fullname=request.getParameter("fullname");
String gender=request.getParameter("gender");
String email=request.getParameter("email");
String phoneno=request.getParameter("phoneno");
String address=request.getParameter("address");
String password=request.getParameter("password");
String password1=request.getParameter("password1");
String supervisorid=request.getParameter("supervisorid");


try {
	String DB_DRIVER = "com.mysql.jdbc.Driver";
	String DB_HOST = "jdbc:mysql://localhost/giconsvers2";
    String DB_USER = "root";
    String DB_PASSWORD = "";
    Connection conn = null;
    Statement stat = null;
    ResultSet res = null;
    Class.forName(DB_DRIVER);
    conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
    stat = conn.createStatement();
    PreparedStatement ps = conn.prepareStatement("insert into customer values (?,?,?,?,?,?,?,?,?)");
    ps.setString(1,id);
    ps.setString(2,fullname);
    ps.setString(3,phoneno);
    ps.setString(4,email);
    ps.setString(5,address);
    ps.setString(6,gender);
    ps.setString(7,password);
    ps.setString(7,password1);
    ps.setString(9,supervisorid);
    
    
    ps.executeUpdate();
    response.sendRedirect("admin-user-add.jsp?msg=BEREH");
}
catch(Exception e){ response.sendRedirect("admin-user-add.jsp?msg=TAKBEREH");
}
%>