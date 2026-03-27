package justCseAlumniProject;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/fetchMessageToTheProfileServlet")
public class fetchMessageToTheProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        //important parameters that it wanted to run code
        
        
        int threadId = (Integer)(request.getAttribute("threadId"));
        int senderOrCurrentIdOfUser = (Integer)(request.getAttribute("senderOrCurrentIdOfUser"));
        int idOfReceiver = (Integer)(request.getAttribute("idOfReceiver"));
        String nameOfReceiver = (String)(request.getAttribute("nameOfReceiver"));

        List<Message> messages = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/alumnidirectory", "root", "225500");

            PreparedStatement ps = conn.prepareStatement(
                    "SELECT sender_id, message, send_at FROM messages WHERE thread_id=? ORDER BY send_at ASC LIMIT 30");
            ps.setInt(1, threadId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int senderId = rs.getInt("sender_id");
                String msg = rs.getString("message");
                Timestamp time = rs.getTimestamp("send_at");

                messages.add(new Message(senderId, msg, time));
            }

            request.setAttribute("messages", messages);
            request.setAttribute("senderOrCurrentIdOfUser", senderOrCurrentIdOfUser);
            request.setAttribute("idOfReceiver", idOfReceiver);
            request.setAttribute("nameOfReceiver", nameOfReceiver);

            request.getRequestDispatcher("chat_page.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}