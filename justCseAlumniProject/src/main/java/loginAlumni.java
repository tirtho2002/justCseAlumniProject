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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(description = "fetch the data from to serve to the alumni page", urlPatterns = { "/alumniProfile" })
public class loginAlumni extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("email") == null) {
			response.sendRedirect("loginPage.html");
			return;
		}

		String email = (String) session.getAttribute("email");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumniDirectory", "root",
					"225500");

			String sql = "SELECT * FROM alumni WHERE email = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				request.setAttribute("name", rs.getString("name"));
				request.setAttribute("email", rs.getString("email"));
				request.setAttribute("batch", rs.getString("batch_no"));
				request.setAttribute("session", rs.getString("session"));
				request.setAttribute("mobile", rs.getInt("mobile_no"));
				request.setAttribute("location", rs.getString("location"));
				request.setAttribute("company", rs.getString("company"));
				request.setAttribute("position", rs.getString("position"));

			}

			int userId = rs.getInt("user_id");

			String sql4 = "SELECT * FROM projects WHERE user_id = ?"; // পরে প্রজেক্ট তালিকা দেখানোর জন্য নতুন করে যুক্ত
																		// করছি
			PreparedStatement ps4 = conn.prepareStatement(sql4);
			ps4.setInt(1, userId);
			ResultSet rs4 = ps4.executeQuery();

			List<Map<String, String>> projects = new ArrayList<>();

			while (rs4.next()) {
				Map<String, String> project = new HashMap<>();
				project.put("title", rs4.getString("title"));
				project.put("description", rs4.getString("description"));
				project.put("technologies", rs4.getString("technologies"));
				project.put("projectLink", rs4.getString("project_link"));
				project.put("githubLink", rs4.getString("github_link"));
				projects.add(project);
				System.out.println(rs4.getString("title"));
			}

			if (projects.isEmpty()) {
				request.setAttribute("projectMessage", "No projects found for this user.");
			} else {
				request.setAttribute("projects", projects);
			}

			String sql3 = "SELECT skill_name FROM skill WHERE skill_id IN "
					+ "(SELECT skill_id FROM alumni_skill WHERE user_id = ?)";
			PreparedStatement ps3 = conn.prepareStatement(sql3);
			ps3.setInt(1, userId);

			ResultSet rs3 = ps3.executeQuery();
			List<String> skills = new ArrayList<>();

			while (rs3.next()) {
				skills.add(rs3.getString("skill_name"));

				System.out.println(rs3.getString("skill_name"));
			}
			request.setAttribute("skills", skills);

			rs.close();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		request.getRequestDispatcher("profilePageAlumni.jsp").forward(request, response);
	}
}
