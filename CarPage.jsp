<!-- import packages and the two files I have for package Code 
this file comes from cover page html-->
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
<title>Car Results</title>
<link rel="stylesheet" href="../css/ProjectDesign.css">
</head>
<%
//This object is created from the SQLConn class 
SQLConn db = new SQLConn();
Connection conn = db.getConnection();
//Get the attributes and querie strings from ProjectProssesor 
Object Car = session.getAttribute("CarName");
Object CarValue = session.getAttribute("CarValue");
Object NumberQ = session.getAttribute("NumberQ");
Object Number = session.getAttribute("Number");
Object Numtype = session.getAttribute("NumType");
Object NumLogical = session.getAttribute("Logical");
//Convert the values to string
String CarQuery = Car.toString();
String NumQuery = NumberQ.toString();
String Value;
%>
<body>
<div class="Result">
<h1>
<%//Check which search the user selected either through name or number
if(NumQuery.contains("null")){
	out.print("Result for " + CarValue);
	
}else if (NumQuery.contains("null") && CarQuery.contains("null")){
	out.print("No results");
}else{
	out.print("Results for "+  Numtype + " "+ NumLogical + " " + Number);
	
}
	%></h1>
<!-- All jsp pages have links to other rest of pages -->
<ul style="list-style-type:none">
  <li><a href="../html/CoverPage.html">Home Page</a></li>
  <li><a href="../jsp/AllCars.jsp">View All Cars</a></li>
  <li><a href="../html/SalePage.html">Buy a Car</a></li>
  <li><a href="../jsp/Deals.jsp">Deals History</a></li>
</ul>
<table>
<tr> <th>Company</th> <th>Name</th> <th>Type</th><th>Price</th> 
<th>Mileage</th> <th>Horsepower</th> <th>Year</th> 
</tr>

<%
//Checks which query the user inputed
if(NumQuery.contains("null")){
	Value = CarQuery;
}
else{
	Value = NumQuery;
}

try{
Statement stmt = conn.createStatement();
ResultSet result = stmt.executeQuery(Value);
//while loop to print out all of the selected results from the database
while(result.next()){
	String type = result.getString("Model_Type");
	String name = result.getString("Model_Name");
	String company = result.getString("Company");
	String price = result.getString("Price");
	String mileage = result.getString("Mileage");
	String hp = result.getString("HorsePower");
	String year = result.getString("Year");
	//putting the data in table cells 
	String line = "<tr> <td>" + company + "</td> <td>" + name + "</td> <td>" + type 
			+ "</td> <td>" + price + "</td> <td>" + mileage + "</td> <td>"
			+ hp + "</td> <td>" + year + "</td></tr>";
	out.println(line);
	}}
catch(Exception e){
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