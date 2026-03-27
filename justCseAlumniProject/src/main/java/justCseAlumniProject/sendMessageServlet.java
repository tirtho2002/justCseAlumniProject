//It used to collect or generate thread and then it will forward the the the thread_id currert_user_sender_id and receiver_id and receiver_name to the fetchMessageToTheProfileServlet for loading the messages of the sender and receiver in the profile page of the receiver.



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
		        	
		        	//used for sending the userid and name of the receiver to the messageloading servlet through request attribute. so that the messageloading servlet can load the messages of the receiver and sender.
		        	
		        	request.setAttribute("idOfReceiver", idOfReceiver);
		    		request.setAttribute("nameOfReceiver", nameOfReceiver);
		    		request.setAttribute("senderOrCurrentIdOfUser", senderOrCurrentIdOfUser);
		    		request.setAttribute("threadId", threadId);
		    		request.getRequestDispatcher("fetchMessageToTheProfileServlet").forward(request, response);
		        	
		        	
		        }
		        else {
		        	
		        String sql3="insert into threads(user1_id,user2_id) values(?,?)";
		        PreparedStatement ps3=conn.prepareStatement(sql3,PreparedStatement.RETURN_GENERATED_KEYS);
		        
		        ps3.setInt(1, user1);
		        ps3.setInt(2, user2);
		        ps3.executeUpdate();
		        ResultSet rs3=ps3.getGeneratedKeys();
		        rs3.next();
		         int threadId=rs3.getInt(1);
		         
		         request.setAttribute("idOfReceiver", idOfReceiver);
		 		request.setAttribute("nameOfReceiver", nameOfReceiver);
		 		request.setAttribute("senderOrCurrentIdOfUser", senderOrCurrentIdOfUser);
		 		request.setAttribute("threadId", threadId);
		 		
		 		request.getRequestDispatcher("fetchMessageToTheProfileServlet").forward(request, response);
		 		
		        
		        }
		        
		    }

		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		} catch (SQLException e) {
		    e.printStackTrace();
		} 
	}
}