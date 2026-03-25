package justCseAlumniProject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
		if (session == null || session.getAttribute("userId") == null) {
			response.sendRedirect("login.jsp");
			return;
		}

		int idOfReceiver = Integer.parseInt(request.getParameter("idOfUser"));
		String nameOfReceiver = request.getParameter("nameOfReceiver");
		int senderOrCurrentIdOfUser = (Integer) session.getAttribute("userId");
		
		System.out.println("sender: " + senderOrCurrentIdOfUser);
		System.out.println("receiver: " + nameOfReceiver);
		
		int user1=Math.min(senderOrCurrentIdOfUser, idOfReceiver);
		int user2=Math.max(senderOrCurrentIdOfUser, idOfReceiver);
		
		

		// Validate session
		
		// Validate message
		

		
		String jdbcUrl = "jdbc:mysql://localhost:3306/alumnidirectory";
		String dbUser = "root";
		String dbPass = "225500";

		try {
		    Class.forName("com.mysql.cj.jdbc.Driver");
	    String sql="select * from threads where (user1_id=? and user2_id=?)";

		    try (Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
		         PreparedStatement ps = conn.prepareStatement(sql)) {

		        ps.setInt(1, user1);
		        ps.setInt(2, user2);
		        ResultSet rs=ps.executeQuery();
		        
		        if(rs.next()) {
		        	int threadId=rs.getInt("thread_id");
		        	
		        	String sql2="select * from messages where thread_id=? order by send_at desc limit 10";
		        	
		        	
		        	PreparedStatement ps2=conn.prepareStatement(sql2);
		        	ps2.setInt(1, threadId);
		        	ResultSet rs2=ps2.executeQuery();
		        	
		        }
		        else {
		        	
		        String sql3="insert into threads(user1_id,user2_id) values(?,?)";
		        PreparedStatement ps3=conn.prepareStatement(sql3,PreparedStatement.RETURN_GENERATED_KEYS);
		        
		        ps3.setInt(1, user1);
		        ps3.setInt(2, user2);
		        ps3.executeUpdate();
		        }
		        
		    }

		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		} catch (SQLException e) {
		    e.printStackTrace();
		} 
	}
}