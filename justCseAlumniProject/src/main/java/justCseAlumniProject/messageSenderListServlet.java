package justCseAlumniProject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

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
	
	int sender_id=(Integer)(session.getAttribute("userId"));
	
	
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumniDirectory", "root",
				"225500");
		
		String sql = "SELECT DISTINCT receiver_id,name FROM messages WHERE sender_id = ? or receiver_id = ?"; //sender_id or receiver_id diye query korar karone sender and receiver duijon er id asbe. tai DISTINCT use kore duplicate entry remove korechi.
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, sender_id);
		ps.setInt(2, sender_id);
		
		ResultSet rs = ps.executeQuery();
		
		
		HashMap<Integer,String> senderList=new HashMap<>();
		
		while(rs.next()) {
			int receiverId=rs.getInt("receiver_id");
			String name=rs.getString("name");
			
			senderList.put(receiverId, name);
			System.out.println("Receiver ID: " + receiverId + ", Name: " + name); // Debugging line
		}
		
		request.setAttribute("senderList", senderList);
		request.getRequestDispatcher("messageSenderList.jsp").forward(request, response);
		
		
		
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	
	
	
	
}
	
	
}
