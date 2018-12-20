package Code;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
//this is the class where the sql queries come from
public class Queries {
	private String Value;
	private String Option;
	private String Logical;
	private String Id;
	//created a constructor for the car searches
	//This way someone is searching by a specific column and logical operator
	public Queries(String val,String option,String logic,String id){
		Value = val;
		Option = option;
		Logical = logic;
		Id = id;
	}
	
//Query for searching by the cars name, model or company
	public String toCarQuery(){
	
		String query = "Select * From Car JOIN Car_Facts on "
					+ "Car.Car_ID = Car_Facts.Car_ID Where Car."+ Option + " " 
				+ Logical + "'%" + Value + "%'";
		return query;
		
	}
//Query for searching by the car price, year, horsepower or mileage
	public String toNumQuery(){
		String query = "Select * From Car JOIN Car_Facts on "
				+ "Car.Car_ID = Car_Facts.Car_ID Where Car_Facts. " + Option + " "
				+ Logical + " " + Value;
		return query;
	}
//query to see all of the vehicles its in the All Cars jsp page
	public String SelectAllQuery(){
		String query = "Select * From Car Join Car_Facts on Car.Car_ID = Car_Facts.Car_ID "
				+ "order by Price";
		return query;
	}
//Query to insert into customers table
	public String InsertCustomer(){
		
		String query = "INSERT INTO Customer (Customer_ID, Name, Phone, Email) VALUES "
				+ "(?, ?, ?, ?)";
		return query;
	}
//Query to insert id values into sales
//Insert customer id, car id, and worker id to create a relation
	public String InsertSales(){
		String query = "INSERT INTO Sales (Customer_ID, Car_ID, Worker_ID) VALUES "
				+ "(?, ?, ?)";
		return query;
	}
	//Get the max customer id + 1. So this way the customer id will still be unique
	//Especially when there is a new user buying a car
	public String getCustomerId(){
		String query = "Select Max(Customer_ID) FROM Customer";
		SQLConn db = new SQLConn();
		Connection conn = db.getConnection();
		Statement stmt;
		try {
			stmt = conn.createStatement();
			ResultSet result = stmt.executeQuery(query);
			if(result.next()){
				String max = result.getString(1);
				
				max = String.valueOf(Integer.parseInt(max) + 1);
				return max;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "null";
	}
	//Query to shows the relation of who bought a car
	//What car they bough and dealer who helped the customer
	public String SalesTable(){
		String query = "SELECT * FROM `Sales` JOIN Customer ON Sales.Customer_ID = Customer.Customer_Id "
				+ "JOIN Dealer ON Sales.Worker_ID = Dealer.Work_Id "
				+ "JOIN Car ON Sales.Car_ID = Car.Car_ID JOIN Car_Facts "
				+ "ON Sales.Car_ID = Car_Facts.Car_ID";
		return query;
	}
}
