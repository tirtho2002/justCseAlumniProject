package justCseAlumniProject;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/postManagerServlet")
public class postManagerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        // Servlet code here
        
        HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("email") == null) {
			response.sendRedirect("loginPage.html");
			return;
		}
		
		String ft= request.getParameter("formType");
		
		
		
		

		
//		String email = (String) session.getAttribute("email");
//		String type = (String) session.getAttribute("role");
//		String batchNo = (String) session.getAttribute("batchNo");
//		int userId = (Integer) session.getAttribute("userId");
//		String name = (String) session.getAttribute("name");
//	String mindContent = request.getParameter("mindContent");
//		
//		
//		
//		
//		System.out.println(name);
//		System.out.println(userId);
//		System.out.println(batchNo);
//		System.out.println(type);
//		System.out.println(ft);
//		
//		try {
//		    Class.forName("com.mysql.cj.jdbc.Driver");
//
//			String insertUser = "INSERT INTO user (name, email, password, batch_no, role) VALUES (?, ?, ?, ?, ?)";
//			PreparedStatement ps = conn.prepareStatement(insertUser);
//			ps.setString(1, email);
//
//			ResultSet rs = ps.executeQuery();
//
//		    System.out.println("Database connected successfully");
//
//		} catch (ClassNotFoundException e) {
//		    System.out.println("MySQL JDBC Driver not found");
//		    e.printStackTrace();
//
//		} catch (SQLException e) {
//		    System.out.println("Database connection failed");
//		    e.printStackTrace();
//		}

		
		
        

    }
}