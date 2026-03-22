package justCseAlumniProject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/sendMessageServlet")
public class sendMessageServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		String idOfUser = request.getParameter("idOfUser");
		String nameOfReceiver = request.getParameter("nameOfReceiver");
		System.out.println("receiver: " + nameOfReceiver);

		// Validate session
		if (session == null || session.getAttribute("userId") == null) {
			response.sendRedirect("login.jsp");
			return;
		}

		// Validate message
		String messageContent = request.getParameter("message");
		if (messageContent == null || messageContent.trim().isEmpty()) {
			response.sendRedirect("viewAlumniProfileServlet?id=" + idOfUser);
			return;
		}

		int senderId = (Integer) session.getAttribute("userId");
		int receiverId = Integer.parseInt(idOfUser);

		String jdbcUrl = "jdbc:mysql://localhost:3306/alumnidirectory";
		String dbUser = "root";
		String dbPass = "225500";
		String sql = "INSERT INTO messages (sender_id, receiver_id, message,name) VALUES (?, ?, ?,?)";

		try (Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
				PreparedStatement ps = conn.prepareStatement(sql)) {

			Class.forName("com.mysql.cj.jdbc.Driver");

			ps.setInt(1, senderId);
			ps.setInt(2, receiverId);
			ps.setString(3, messageContent.trim());
			ps.setString(4, nameOfReceiver);
			ps.executeUpdate();

			response.sendRedirect("viewAlumniProfileServlet?id=" + idOfUser);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			response.sendRedirect("viewAlumniProfileServlet?id=" + idOfUser);

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("viewAlumniProfileServlet?id=" + idOfUser);
		}
	}
}