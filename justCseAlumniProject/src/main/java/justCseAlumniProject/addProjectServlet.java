package justCseAlumniProject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addProjectServlet")
public class addProjectServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session == null) {
			return;
		}

		String email = (String) session.getAttribute("email");
		String role = (String) session.getAttribute("role");
		int batchNo = Integer.parseInt((String) session.getAttribute("batchNo"));
		int userIdFromSession = (int) session.getAttribute("userId");

		int userId;
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String technologies = request.getParameter("technologies");
		String projectLink = request.getParameter("project_link");
		String githubLink = request.getParameter("github_link");

		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumnidirectory", "root",
					"225500");

			String getUserIdSql = "SELECT user_id FROM user WHERE email = ?";
			PreparedStatement getUserIdStmt = con.prepareStatement(getUserIdSql);
			getUserIdStmt.setString(1, email);
			ResultSet rs = getUserIdStmt.executeQuery();
			if (rs.next()) {
				userId = rs.getInt("user_id");
			} else {
				throw new Exception("User not found for email: " + email);
			}

			String sql = "INSERT INTO projects(user_id,title,description,technologies,project_link,github_link) VALUES(?,?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setString(2, title);
			ps.setString(3, description);
			ps.setString(4, technologies);
			ps.setString(5, projectLink);
			ps.setString(6, githubLink);

			ps.executeUpdate();

			if ("alumni".equals(role)) {

				response.sendRedirect("alumniProfile");

			} else {
				response.sendRedirect("studentProfile");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}