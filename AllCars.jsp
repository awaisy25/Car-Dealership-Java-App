<!-- importing packages by jsp. This file is to view all of the cars -->
<%@page import="Code.SQLConn"%>
<%@page import="Code.Queries"%>
<%@page import="java.sql.Statement" %>
<%@page  import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Vehicles On Sale</title>
<link rel="stylesheet" href="../css/ProjectDesign.css">
</head>
<body>
<h1>All Vehicles On Sale</h1>
<ul style="list-style-type:none">
  <li><a href="../html/CoverPage.html">Home Page </a></li>
  <li><a href="../html/SalePage.html">Buy a Car</a></li>
  <li><a href="../jsp/Deals.jsp">Deals History</a></li>
</ul>
<div class="Result">
<table>
<tr> <th>Company</th> <th>Name</th> <th>Type</th><th>Price</th> 
<th>Mileage</th> <th>Horsepower</th> <th>Year</th> 
</tr>
<%
//query object from queries to get select all cars query
Queries query = new Queries("","","","");
String AllCars = query.SelectAllQuery();
try{
SQLConn db = new SQLConn();
Connection conn = db.getConnection();
Statement stmt = conn.createStatement();
ResultSet result = stmt.executeQuery(AllCars);
while(result.next()){
	//while loop to get all of the cars
	String type = result.getString("Model_Type");
	String name = result.getString("Model_Name");
	String company = result.getString("Company");
	String price = result.getString("Price");
	String mileage = result.getString("Mileage");
	String hp = result.getString("HorsePower");
	String year = result.getString("Year");
	String line = "<tr> <td>" + company + "</td> <td>" + name + "</td> <td>" + type 
			+ "</td> <td>" + price + "</td> <td>" + mileage + "</td> <td>"
			+ hp + "</td> <td>" + year + "</td></tr>";
	out.println(line);

}
}catch(Exception e){
	e.printStackTrace();
	out.print("<h3>");
	out.print("No results for data");
	out.print("</h3>");
}
%>
</table>
</div>
</body>
</html>