package src;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
      Methods m=new Methods();
      sendMail s=new sendMail();
      ResultSet rs=null;
    public ForgotPassword() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	String username=request.getParameter("username");
	String password=null;
	String Email_id=null;
	try {
		rs=m.forgotPassword(username);
		if(rs==null)
		{
			response.sendRedirect("ErrorPage.jsp");
		}
		else
		{
			rs.next();
			password=rs.getString(1);
			Email_id=rs.getString(2);
			s.prepareMail(Email_id, username, password);
			response.sendRedirect("index.html");
		}
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		response.sendRedirect("ErrorPage.jsp");
	}
	}

}
