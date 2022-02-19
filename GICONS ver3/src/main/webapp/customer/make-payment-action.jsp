<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%
String orderId = request.getParameter("orderId");
String amount = request.getParameter("amount");
String paymentName = request.getParameter("payment");


	try
	{
 	   String DB_DRIVER = "com.mysql.jdbc.Driver";
	       String DB_HOST = "jdbc:mysql://localhost/giconsver3";
           String DB_USER = "root";
           String DB_PASSWORD = "";
	   

	       Connection conn = null;
	       Statement stat = null;
	       ResultSet res = null;
	       Class.forName(DB_DRIVER);
	       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
	       stat = conn.createStatement();
	       PreparedStatement ps = conn.prepareStatement("INSERT INTO payment(paymentName,amount,orderId) VALUES (?,?,?)");
	       ps.setString(1,paymentName);
	       ps.setString(2, amount);
	       ps.setString(3, orderId);
	       
	       ps.executeUpdate();
	       %>
	       <script>
	       	alert("Payment successfull");
	       	window.location.href = "customer-home.jsp";
	       </script>
	       <%
	       // response.sendRedirect("customer-home.jsp");
	}
	catch(Exception e)
	{
		System.out.println(e.getMessage());
		response.sendRedirect("customer-home.jsp?msg=invalid");	
	}

%>
