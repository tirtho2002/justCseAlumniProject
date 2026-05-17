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




@WebServlet("/searchAlumniServlet")
public class searchAlumniFromDB extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null) {
			response.sendRedirect("alumniSearchPage.jsp");
			return;
		}
		
		String email = (String) session.getAttribute("email");
		String role = (String) session.getAttribute("role");
		int batchNo = Integer.parseInt((String) session.getAttribute("batchNo"));
		int batchNoEnteredByUser = Integer.parseInt(request.getParameter("batch"));
		String nameEnteredByUser = request.getParameter("name");
		String skillEnteredByUser = request.getParameter("skill");
		String companyNameNoEnteredByUser = request.getParameter("company");
		
		
		
		if ( batchNoEnteredByUser !=0) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumnidirectory", "root",
						"225500");
				String sql = "";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, batchNoEnteredByUser);
				ResultSet rs = ps.executeQuery();
				Map<Integer, String> idNameMap = new LinkedHashMap<>();
				
				while (rs.next()) {
					idNameMap.put(rs.getInt("user_id"), rs.getString("name"));
				}

				request.setAttribute("idNameMap", idNameMap);
				request.getRequestDispatcher("alumniListPage.jsp").forward(request, response);
			}
			
			
			
	
			catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
		} 
		
		else {
			response.sendRedirect("alumniSearchPage.jsp");
		}
	}
}