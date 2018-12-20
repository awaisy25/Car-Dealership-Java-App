
//Servet file for Cover page processor. Helps for displaying the vehicles search
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import the Queries java file. Its in a package called Code
import Code.Queries;

@WebServlet("/ProjectProcessor")
public class ProjectProcessor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Gets the input data from the forms in cover page
		String CarName = request.getParameter("Car");
		String Number = request.getParameter("Number");
		String Option = request.getParameter("CarOption");
		String NumOption = request.getParameter("NumberType");
		String NumLogical = request.getParameter("Logical");
		//create objects from Queries class 
		Queries NumQuery = new Queries(Number,NumOption,NumLogical,"");
		Queries Query = new Queries(CarName,Option,"Like","");
		//Using the methods in Query class to make the query strings
		String CarQuery = Query.toCarQuery();
		String NQuery = NumQuery.toNumQuery();
		//Setting the attributes to Car
		request.getSession().setAttribute("CarName",CarQuery);
		request.getSession().setAttribute("CarValue", CarName);
		request.getSession().setAttribute("NumberQ", NQuery);
		request.getSession().setAttribute("Number", Number);
		request.getSession().setAttribute("NumType",NumOption);
		request.getSession().setAttribute("Logical", NumLogical);
		//Directing to Carpage.jsp 
		response.sendRedirect("jsp/CarPage.jsp");	
	}
}
