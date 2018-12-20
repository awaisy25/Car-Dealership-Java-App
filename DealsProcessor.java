/*This processor is for sales page html to help with inserting
data into customer and sales table. outputting the selections for
customers, car, and dealer
*/
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import the files from code package and sql packages for prepared statement
import java.sql.Connection;
import java.sql.PreparedStatement;
import Code.Queries;
import Code.SQLConn;

@WebServlet("/DealsProcessor")
public class DealsProcessor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get the values from Sale page html
		String Cname = request.getParameter("name");
		String Cphone =  request.getParameter("phone");
		String Cemail = request.getParameter("email");
		//creating query object to get insert query strings
		Queries Query = new Queries("","","","");
		String customerID = Query.getCustomerId();
		String InsertCust = Query.InsertCustomer();
		String InsertSales = Query.InsertSales();
		String CarId = request.getParameter("Cars");
		String WorkerId = request.getParameter("Worker");
		//If the values are empty does not execute query or update deal.jsp 
		if(Cname!="" || Cname != null){
		SQLConn db = new SQLConn();
		Connection conn = db.getConnection();
		try{
			//code for inserting into the customer table done through servlet 
			PreparedStatement pstmt = conn.prepareStatement(InsertCust);
			int CustomerID = Integer.parseInt(customerID);
			//Setting the values replaces the ? from the query string
			pstmt.setInt(1, CustomerID);
			pstmt.setString(2, Cname);
			pstmt.setString(3, Cphone);
			pstmt.setString(4, Cemail);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}	
		try{
			//same thing but for sales table this time 
			
			PreparedStatement pstmt2 = conn.prepareStatement(InsertSales);
			int CustomerID = Integer.parseInt(customerID);
			int CarID = Integer.parseInt(CarId);
			int WorkerID = Integer.parseInt(WorkerId);
			pstmt2.setInt(1, CustomerID);
			pstmt2.setInt(2, CarID);
			pstmt2.setInt(3, WorkerID);
			pstmt2.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	//Sending to Deals jsp page
		response.sendRedirect("jsp/Deals.jsp");
		}
	}
}
