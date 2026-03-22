package justCseAlumniProject;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/recommendedAlumniServlet")
public class recommendedAlumniServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("userId") == null) {
			response.sendRedirect("####"); // পরে page er url dibo
			return;
		}

		int studentId = (int) session.getAttribute("userId");

		// List to store all matched alumni
		List<Map<String, Object>> recommendedList = new ArrayList<>();

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumnidirectory", "root",
					"225500");

			String sql = "SELECT u.user_id, u.name, COUNT(*) AS match_count " + "FROM alumni_skill a "
					+ "JOIN user u ON a.user_id = u.user_id " + "WHERE a.skill_id IN ( "
					+ "   SELECT skill_id FROM student_skill WHERE user_id = ? " + ") " + "GROUP BY u.user_id, u.name "
					+ "ORDER BY match_count DESC " + "LIMIT 5";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, studentId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Map<String, Object> alumni = new HashMap<>();

				alumni.put("userId", rs.getInt("user_id"));
				alumni.put("name", rs.getString("name"));
				alumni.put("matchCount", rs.getInt("match_count"));

				recommendedList.add(alumni);
			}

			// ✅ set attribute AFTER collecting all alumni
			request.setAttribute("recommendedList", recommendedList);

			// ✅ forward only once
			request.getRequestDispatcher("RecomentedList.jsp").forward(request, response);

			rs.close();
			ps.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}
	}
}