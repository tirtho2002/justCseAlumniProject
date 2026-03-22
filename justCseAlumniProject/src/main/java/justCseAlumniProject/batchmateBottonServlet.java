package justCseAlumniProject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedHashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/batchMateButtonServlet")

public class batchmateBottonServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session == null) {
			return;
		}

		String email = (String) session.getAttribute("email");
		String role = (String) session.getAttribute("role");
		int batchNo = Integer.parseInt((String) session.getAttribute("batchNo"));
		int userId = (int) session.getAttribute("userId");
		System.out.println(userId);

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumnidirectory", "root",
					"225500");
			String sql = "select * from  user where batch_no=? and user_id!=?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, batchNo);
			ps.setInt(2, userId);

			ResultSet rs = ps.executeQuery();

			Map<Integer, String> idNameMap = new LinkedHashMap<>();

			while (rs.next()) {
				idNameMap.put(rs.getInt("user_id"), rs.getString("name"));
				System.out.println(rs.getString("name"));

			}

			request.setAttribute("idNameMap", idNameMap);
			request.getRequestDispatcher("batchMateSearchList.jsp").forward(request, response);

		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());

		}

	}

}
