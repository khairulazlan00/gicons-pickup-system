<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giant Hypermarket | Pick-Up</title>
    <!--google font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!--user icon-->
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<link rel="stylesheet" href="../style/style.css" />
	
	 <script>
    const actualBtn = document.getElementById('upload');

	const fileChosen = document.getElementById('file-chosen');

	actualBtn.addEventListener('change', function()
			{
  	fileChosen.textContent = this.files[0].name
	})
  	</script> 
	
</head>
<body>
<% String email = session.getAttribute("email").toString();%>
<!-- header -->
   <div class="header">
        <div class="c1">
                <div class="navigationbar">
                        <div class="logo">
                            <img src="../images/Giant_logo.png" width="85px"> &nbsp;
                        </div>
                        <div class="title">
						     <h1>Giant Hypermarket Pick-Up System</h1>                            
                        </div>
                        <nav>
                            <ul>
                                <li><a href=" admin-home.jsp">Home</a></li>
                                <li><a href=" admin-about.jsp">About</a></li>
                                <li><a href=" admin-contact.jsp">Contact</a></li>
                                 <li><%out.println(email); %><i class='fas fa-user-alt'></i>
                                <li><a href="../index.jsp">Logout<i class="fas fa-sign-out-alt"></i></a>
                                </li> 
							 </ul>
                        </nav>                     
     					
     			</div>
		</div>
	</div>	
	
	<!-- nav bar menu -->
	<div class="navbar">
 		 <a href="admin-order.jsp">Order</a>
  		 <a href="admin-account.jsp">Account</a>
  		<div class="dropdown">
    		<button class="dropbtn">Product
    		 <i class="fa fa-caret-down"></i>
   		    </button>
    		<div class="dropdown-content">
    		 <a href="admin-add-product.jsp">New Product</a>
			 <a href=" admin-all-product.jsp">All Product</a>    		
    		 <a href="admin-grocery.jsp">Grocery</a>
    		 <a href="admin-fresh.jsp">Fresh</a>
    		 <a href="admin-frozen.jsp">Frozen</a>
  		  	</div>
 	 	</div>
 	 	<div class="dropdown">
 	 		<button class="dropbtn">Admin
    		 <i class="fa fa-caret-down"></i>
   		    </button>
	 	 	<div class="dropdown-content">
	    		 <a href="admin-user.jsp">Admin List</a>
	    		 <a href="admin-user-add.jsp">Add Admin</a>
	  		</div>
  		</div>
	</div>
					
	<!-- body page -->
	
	<div class="container">	        
		    		<br>
		    		<center><h2>Add New Product</h2></center>
					<br>
		    		<div class="form-container">				
				    <form class="details">
					<label>Product Name: <span>*</span></label><br>
					<input type="text" name="productName" placeholder="Product's Name" required="required">
					
					<label>Product Price: <span>*</span></label><br>
					<input type="number" step="any" min="0" name="productPrice" placeholder="00.00" required="required">
					
					<label>Product Discount: <span>*</span></label><br>
					<input type="text" step="any" min="0" name="productDiscount" placeholder="Product Discount" required="required">
					
					<label>Product Expired Date: <span>*</span></label><br>
					<input type="date" name="productExpiryDate" required="required">
					
					<br><label>Product Keyword: <span>*</span></label><br>
					<input type="text" name="productKeyword" placeholder="Product Keyword" required="required">
					
					<label>Product Description: <span>*</span></label><br>
					<input type="text" name="productDescription" placeholder="Product Description" required="required">
					
					<label>Product Category: <span>*</span></label><br>    				
    				<div class="category">
				    	<select name="productCategory" id="product-category" required="required">
    					<option value="">--Please choose a category--</option>
    					<option value="grocery">Grocery</option>
    					<option value="fresh">Fresh</option>
    					<option value="frozen">Frozen</option>
                    	</select>
                    </div>
    				
					<label>Product Image: <span>*</span></label><br>
					<img id="output" src="../images/add-product.png" width="100" height="100">
					<br>
					<input required="required" id="demo-file" name="productImage" type="file" accept="image/*" onchange="document.getElementById('output').src = window.URL.createObjectURL(this.files[0])">
					<br><br>
					
					<input type="reset" value="Reset">
					<input type="submit" onclick="myFunction()" value="Add Product">
					</form>
				</div>
				<br>
		     </div>   
     <!-- footer -->
    <div class="footer">
   		 <br><p>G Icons 2021 &copy; All Rights Reserved</p>
    </div>  
  	 
</body>
</html>

<%
String a = request.getParameter("productName");
String b = request.getParameter("productPrice");
String c = request.getParameter("productDiscount");
String d = request.getParameter("productExpiryDate");
String e = request.getParameter("productKeyword");
String f = request.getParameter("productImage");
String g = request.getParameter("productDescription");
String h = request.getParameter("productCategory");

String DB_DRIVER = "com.mysql.jdbc.Driver";
String DB_HOST = "jdbc:mysql://localhost/giconsver3";
String DB_USER = "root";
String DB_PASSWORD = "";
 
Connection conn = null;
PreparedStatement stat = null;
Class.forName(DB_DRIVER);
if(a!=null && b!=null && c!=null && d!=null && e!=null  && f!=null && g!=null & h!=null){
	conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
	String data = "INSERT INTO product (productName,productPrice, productDiscount, productExpiryDate, productKeyword, productImage, productDescription, productCategory) values(?,?,?,?,?,?,?,?)";
	stat = conn.prepareStatement(data);
	stat.setString(1,a);
	stat.setString(2,b);
	stat.setString(3,c);
	stat.setString(4,d);
	stat.setString(5,e);
	stat.setString(6,f);
	stat.setString(7,g);
	stat.setString(8,h);
	stat.executeUpdate();
	response.sendRedirect("admin-home.jsp");
}
%>