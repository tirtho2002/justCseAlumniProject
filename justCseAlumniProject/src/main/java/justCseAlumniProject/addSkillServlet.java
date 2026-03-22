package justCseAlumniProject;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/addSkillServlet")
public class addSkillServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String skillName = request.getParameter("skill");

		HttpSession session = request.getSession(false);

		if (session == null) {
			response.sendRedirect("login.jsp");
			return;
		}

		String role = (String) session.getAttribute("role");
		Integer userId = (Integer) session.getAttribute("userId");

		if (userId == null || role == null) {
			response.sendRedirect("login.jsp");
			System.out.println("User not logged in or role not found in session.");
			return;
		}

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumnidirectory", "root",
					"225500");

			// 1️⃣ Check skill exists
			String skillQuery = "SELECT skill_id FROM skill WHERE skill_name = ?";
			PreparedStatement psSkill = conn.prepareStatement(skillQuery);
			psSkill.setString(1, skillName);
			ResultSet rsSkill = psSkill.executeQuery();

			if (!rsSkill.next()) {
				// Skill not found → reject
				response.sendRedirect("profileServlet?error=invalidSkill");
				return;
			}

			int skillId = rsSkill.getInt("skill_id");

			// 2️⃣ Insert according to role
			if (role.equalsIgnoreCase("student")) {

				String insertStudent = "INSERT IGNORE INTO student_skill (skill_id, user_id) VALUES (?, ?)";
				PreparedStatement psInsert = conn.prepareStatement(insertStudent);
				psInsert.setInt(1, skillId);
				psInsert.setInt(2, userId);
				psInsert.executeUpdate();

			} else if (role.equalsIgnoreCase("alumni")) {

				String insertAlumni = "INSERT IGNORE INTO alumni_skill (skill_id, user_id) VALUES (?, ?)";
				PreparedStatement psInsert = conn.prepareStatement(insertAlumni);
				psInsert.setInt(1, skillId);
				psInsert.setInt(2, userId);
				psInsert.executeUpdate();
			}

			if ("alumni".equals(role)) {

				response.sendRedirect("alumniProfile");

			} else {
				response.sendRedirect("studentProfile");

			}

			conn.close();

			System.out.println("Skill added successfully for user_id: " + userId + ", skill_id: " + skillId);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}