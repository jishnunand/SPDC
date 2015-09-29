package soft.sms.authentication;




import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import soft.sms.dao.hibernate.Login;

public class AuthenticationServlet extends HttpServlet {

	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session session = factory.openSession();
		String query = "from Login login where loginId=? and password=?";
		Query queryObj = session.createQuery(query);
		queryObj.setString(0, username);
		queryObj.setString(1, password);
		List<Login> records = queryObj.list();
		if(records.size()>0){
			request.setAttribute("loginstatus", "Login Successful.");
			getServletContext().getRequestDispatcher("/application/home.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("loginstatus", "Username/Password do not match.");
			getServletContext().getRequestDispatcher("/authentication/login.jsp").forward(request, response);
		}
	}

	
	
}
