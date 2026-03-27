package justCseAlumniProject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/messageSenderListServlet")
public class messageSenderListServlet extends HttpServlet {
protected void doGet(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException{
	
	HttpSession session = request.getSession(false);
	
	if(session==null || session.getAttribute("userId")==null) {
		response.sendRedirect("####"); //pore page er url dibo
		return;
	}
	
	int senderOrCurrentIdOfUser=(Integer)(session.getAttribute("userId"));
	
	
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumniDirectory", "root",
				"225500");
		
		String sql = "SELECT * FROM threads WHERE user1_id = ? or user2_id = ?"; //sender_id or receiver_id diye query korar karone sender and receiver duijon er id asbe. tai DISTINCT use kore duplicate entry remove korechi.
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, senderOrCurrentIdOfUser);
		ps.setInt(2, senderOrCurrentIdOfUser);
		
		ResultSet rs = ps.executeQuery();
		
		
		
		//1st Integer thred_id and 2nd Integer user যার সাথে connection করছে তার ID
        List<MessageList> connectionList = new ArrayList<>();
		
		while(rs.next()) {
			
			if(rs.getInt("user1_id")==senderOrCurrentIdOfUser) {
				int idOfReceiver=rs.getInt("user2_id");//id of receiver
				
				
				
				String sql2="SELECT name FROM user WHERE user_id=?";
				PreparedStatement ps2=conn.prepareStatement(sql2);
				ps2.setInt(1, idOfReceiver);
				ResultSet rs2=ps2.executeQuery();
				rs2.next();
				
				
				String nameOfReceiver=rs2.getString("name");//name of receiver
				int threadId=rs.getInt("thread_id");
				
				connectionList.add(new MessageList(threadId, senderOrCurrentIdOfUser, idOfReceiver, nameOfReceiver));
				
				
				
				
			
			}
			else {

			
				int idOfReceiver=rs.getInt("user1_id");//id of receiver
				
				
				
				String sql2="SELECT name FROM user WHERE user_id=?";
				PreparedStatement ps2=conn.prepareStatement(sql2);
				ps2.setInt(1, idOfReceiver);
				ResultSet rs2=ps2.executeQuery();
				rs2.next();
				
				String nameOfReceiver=rs2.getString("name");//name of receiver
				int threadId=rs.getInt("thread_id");
				
				connectionList.add(new MessageList(threadId, senderOrCurrentIdOfUser, idOfReceiver, nameOfReceiver));
				
				
			}
			
			
		}
		
		request.setAttribute("connectionList", connectionList);
		request.getRequestDispatcher("connectionList.jsp").forward(request, response);
		
		
		
		
	}
	catch(Exception e) {
		
		System.out.println("Error in messageSenderListServlet: " + e.getMessage());
		e.printStackTrace();
	}
	
	
	
	
}
	
	
}
