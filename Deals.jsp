<!-- importing packages for jsp page. This page comes from Sales page html-->
<%@page import="Code.SQLConn"%>
<%@page import="Code.Queries"%>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sales History</title>
<link rel="stylesheet" href="../css/ProjectDesign.css">

</head>
<body>
<h1>Deals History</h1>
<ul style="list-style-type:none">
  <li><a href="../html/CoverPage.html">Home Page</a></li>
  <li><a href="../html/SalePage.html">Buy a Car</a></li>
  <li><a href="../jsp/AllCars.jsp">View all Cars</a></li>
</ul>
<%
//getting the sql connection
SQLConn db = new SQLConn();
Connection conn = db.getConnection();
%>
<div class="Deals">
<table>
<tr> <th>Customer Information</th><th>Worker Information</th><th>Car Bought</th>
<%
//creating query object to get relational query for all the tables
Queries Deals = new Queries("","","","");
Object getQuery = Deals.SalesTable();
String deals = getQuery.toString();
Statement stmt = conn.createStatement();
ResultSet result = stmt.executeQuery(deals);
while(result.next()){
//while loop to get the column values and outputting it
	String Cname = result.getString("Name");
	String CPhone = result.getString("Customer.Phone");
	String Cemail = result.getString("Customer.email");
	String Wname = result.getString("Sales_Name");
	String Wphone = result.getString("Dealer.Phone");
	String Wemail = result.getString("Dealer.Email");
	String Company = result.getString("Company");
	String Mname = result.getString("Model_Name");
	String Year = result.getString("Year");
	String Price = result.getString("Price");
	//The column data are in lists of table cells.
	String line = "<tr> <td> <ul> <li>Name: " + Cname + "</li> <li>Phone: " + CPhone + 
			"</li> <li>Email: " + Cemail + "</li> </ul> </td> <td> <ul> <li>" +
			"Name: " + Wname + "</li> <li>Phone: " + Wphone + "</li> <li>Email: " +
			Wemail + "</li> </ul> </td> <td> <ul> <li>Name: " + Company + " " +
			Mname + "</li> <li>Year: " + Year + "</li> <li>Price: " + Price;
	out.println(line);
}%>
</table>
</div>
</body>
</html>