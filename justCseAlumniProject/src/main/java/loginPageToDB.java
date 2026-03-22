
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(description = "fetch the data from login page and auteintecition", urlPatterns = { "/LoginServlet" })
public class loginPageToDB extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String batch = request.getParameter("batch");
		String role = request.getParameter("role");

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumniDirectory", "root",
					"225500");

			String sql = "SELECT * FROM user WHERE email = ? AND password = ? AND batch_no = ? AND role=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ps.setString(3, batch);
			ps.setString(4, role);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				HttpSession session = request.getSession();
				session.setAttribute("email", email);
				session.setAttribute("role", role);
				session.setAttribute("batchNo", batch);
				session.setAttribute("userId", rs.getInt("user_id"));
				session.setAttribute("name", rs.getString("name"));

				if ("alumni".equals(role)) {

					response.sendRedirect("alumniProfile");

				} else {
					response.sendRedirect("studentProfile");

				}

			} else {

				response.sendRedirect("loginPage.html");
			}

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
	}

}
