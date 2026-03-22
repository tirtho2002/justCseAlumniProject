import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class registerPageToDB extends HttpServlet {

	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/alumnidirectory";
	private static final String JDBC_USER = "root";
	private static final String JDBC_PASS = "225500";

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String role = req.getParameter("role");
		String batchNo = req.getParameter("batch_no"); // NEW: batch number from form

		Connection conn = null;
		PreparedStatement psUser = null;
		PreparedStatement psStudent = null;
		PreparedStatement psAlumni = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);

			// 1. Insert into user table (including batch_no)
			String insertUser = "INSERT INTO user (name, email, password, batch_no, role) VALUES (?, ?, ?, ?, ?)";
			psUser = conn.prepareStatement(insertUser, Statement.RETURN_GENERATED_KEYS);
			psUser.setString(1, name);
			psUser.setString(2, email);
			psUser.setString(3, password);
			psUser.setInt(4, Integer.parseInt(batchNo)); // parse batch_no to int
			psUser.setString(5, role);
			psUser.executeUpdate();

			ResultSet rs = psUser.getGeneratedKeys();
			int userId = 0;
			if (rs.next()) {
				userId = rs.getInt(1);
			}

			if ("student".equals(role)) {
				String roll = req.getParameter("student_roll");
				String reg = req.getParameter("student_reg");
				String session = req.getParameter("student_session");
				String mobile = req.getParameter("student_mobile");

				String insertStudent = "INSERT INTO student (user_id, roll_no, reg_no, session, mobile_no,student_email,batch_no,name) VALUES (?, ?, ?, ?, ?,?,?,?)";
				psStudent = conn.prepareStatement(insertStudent);
				psStudent.setInt(1, userId);
				psStudent.setString(2, roll);
				psStudent.setString(3, reg);
				psStudent.setString(4, session);
				psStudent.setString(5, mobile);
				psStudent.setString(6, email);
				psStudent.setString(7, batchNo);
				psStudent.setString(8, name);

				psStudent.executeUpdate();
			} else if ("alumni".equals(role)) {
				String sessionNo = req.getParameter("alumni_session");
				String mobile = req.getParameter("alumni_phone");
				String location = req.getParameter("alumni_location");
				String company = req.getParameter("alumni_company");
				String position = req.getParameter("alumni_position");

				String insertAlumni = "INSERT INTO alumni (user_id,batch_no,session, email, mobile_no, location,company,position,name) VALUES (?, ?, ?, ?, ?,?, ?, ?,?)";
				psAlumni = conn.prepareStatement(insertAlumni);
				psAlumni.setInt(1, userId);
				psAlumni.setString(2, batchNo);
				psAlumni.setString(3, sessionNo);
				psAlumni.setString(4, email);
				psAlumni.setString(5, mobile);
				psAlumni.setString(6, location);
				psAlumni.setString(7, company);
				psAlumni.setString(8, position);
				psAlumni.setString(9, name);

				psAlumni.executeUpdate();
			}

			res.sendRedirect("authenticationPage.html");
		} catch (Exception e) {
			e.printStackTrace();
			res.getWriter().println("Error: " + e.getMessage());
		}
	}
}
