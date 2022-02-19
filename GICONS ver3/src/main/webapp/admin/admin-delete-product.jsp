<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String productId = request.getParameter("d");

String DB_DRIVER = "com.mysql.jdbc.Driver";
String DB_HOST = "jdbc:mysql://localhost/giconsver3";
String DB_USER = "root";
String DB_PASSWORD = "";

Class.forName(DB_DRIVER).newInstance();
Connection conn = DriverManager.getConnection(DB_HOST,DB_USER,DB_PASSWORD);
Statement stat = conn.createStatement();
stat.executeUpdate("delete from product where productId ='"+ productId +"'");
response.sendRedirect("admin-home.jsp");
%>

<script>
function myFunction() {
  alert("Succefully add new product!");
}
</script>