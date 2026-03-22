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

@WebServlet("/companySearchServlet")

public class companySearchServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String companyName = request.getParameter("companyName");

		Map<Integer, String> idNameMap = new LinkedHashMap<>();

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumnidirectory", "root",
					"225500");
			PreparedStatement ps = conn.prepareStatement("select * from alumni where company=?");
			ps.setString(1, companyName);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				idNameMap.put(rs.getInt("user_id"), rs.getString("name"));
			}

			request.setAttribute("idNameMap", idNameMap);
			request.getRequestDispatcher("alumniListPage.jsp").forward(request, response);

		} catch (Exception e) {
			System.out.println("has problem in list by company" + e.getMessage());
			response.sendRedirect("alumniSearchByCompany.jsp");
		}

	}

}
