package justCseAlumniProject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewAlumniProfileServlet")
public class viewAlumniProfileServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idParam = request.getParameter("id");


		if (idParam == null || idParam.isEmpty()) {
			request.setAttribute("message", "No id parameter provided in the request.");
			request.getRequestDispatcher("/alumniPageProfile.jsp").forward(request, response);
			return;
		}
		int userId = Integer.parseInt(idParam);
		try {
			userId = Integer.parseInt(idParam);
		} catch (NumberFormatException nfe) {
			request.setAttribute("message", "Invalid id parameter: must be a number.");
			return;
		}
		String jdbcUrl = "jdbc:mysql://localhost:3306/alumnidirectory";
		String dbUser = "root";
		String dbPass = "225500";
		String sql = "SELECT * FROM user WHERE user_id = ?";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			rs.next();

			String role = rs.getString("role");
			try {
				// it takes the project details

				String sql4 = "SELECT * FROM projects WHERE user_id = ?"; // পরে প্রজেক্ট তালিকা দেখানোর জন্য নতুন করে
																			// যুক্ত করছি
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
				}

				if (projects.isEmpty()) {
					request.setAttribute("projectMessage", "No projects found for this user.");
				} else {
					request.setAttribute("projects", projects);
				}

				// it takes skills from database

				if ("alumni".equalsIgnoreCase(role)) {
					String sql5 = "SELECT skill_name FROM skill WHERE skill_id IN "
							+ "(SELECT skill_id FROM alumni_skill WHERE user_id = ?)";
					PreparedStatement ps5 = conn.prepareStatement(sql5);
					ps5.setInt(1, userId);
					ResultSet rs5 = ps5.executeQuery();

					List<String> skills = new ArrayList<>();

					while (rs5.next()) {
						skills.add(rs5.getString("skill_name"));
					}

					if (skills.isEmpty()) {
						request.setAttribute("skillsMessage", "No skills found for this user.");
					} else {
						request.setAttribute("skills", skills);
					}
				} else {
					String sql5 = "SELECT skill_name FROM skill WHERE skill_id IN "
							+ "(SELECT skill_id FROM student_skill WHERE user_id = ?)";

					PreparedStatement ps5 = conn.prepareStatement(sql5);
					ps5.setInt(1, userId);

					ResultSet rs5 = ps5.executeQuery();
					List<String> skills = new ArrayList<>();

					while (rs5.next()) {
						skills.add(rs5.getString("skill_name"));
					}

					request.setAttribute("skills", skills);
				}

				if ("alumni".equalsIgnoreCase(role)) {
					String sql2 = "SELECT * FROM alumni WHERE user_id = ?";
					PreparedStatement ps2 = conn.prepareStatement(sql2);
					ps2.setInt(1, userId);
					ResultSet rs2 = ps2.executeQuery();

					if (rs2.next()) {
						int idOfUser = (int) rs2.getInt("user_id");
						String name = rs2.getString("name");
						String batchNo = rs2.getString("batch_no");
						String email = rs2.getString("email");
						String session = rs2.getString("session");
						String mobileNo = rs2.getString("mobile_no");
						String location = rs2.getString("location");
						String company = rs2.getString("company");
						String position = rs2.getString("position");

						request.setAttribute("idOfUser", idOfUser);
						request.setAttribute("name", name);
						request.setAttribute("batchNo", batchNo);
						request.setAttribute("email", email);
						request.setAttribute("session", session);
						request.setAttribute("mobileNo", mobileNo);
						request.setAttribute("location", location);
						request.setAttribute("company", company);
						request.setAttribute("position", position);
						request.setAttribute("role", role);
					}

				} else if ("student".equalsIgnoreCase(role)) {

					String sql3 = "SELECT * FROM student WHERE user_id = ?";
					PreparedStatement ps3 = conn.prepareStatement(sql3);
					ps3.setInt(1, userId);
					ResultSet rs3 = ps3.executeQuery();

					if (rs3.next()) {
						int idOfUser = (int) rs3.getInt("user_id");

						String name = rs3.getString("name");
						String batchNo = rs3.getString("batch_no");
						String email = rs3.getString("student_email");
						String session = rs3.getString("session");
						String mobileNo = rs3.getString("mobile_no");
						String roll = rs3.getString("roll_no");
						String reg = rs3.getString("reg_no");

						request.setAttribute("idOfUser", idOfUser);
						request.setAttribute("name", name);
						request.setAttribute("batchNo", batchNo);
						request.setAttribute("email", email);
						request.setAttribute("session", session);
						request.setAttribute("mobileNo", mobileNo);
						request.setAttribute("roll", roll);
						request.setAttribute("reg", reg);
						request.setAttribute("role", role);
					}

				}

			} catch (Exception e) {

				System.out.println(e.getMessage());

			}
			request.getRequestDispatcher("/alumniPageProfile.jsp").forward(request, response);

		} catch (Exception e) {
			request.setAttribute("error", "Error retrieving alumni profile: " + e.getMessage());
			response.sendRedirect("alumniSearchPage.html");
		}
	}

}