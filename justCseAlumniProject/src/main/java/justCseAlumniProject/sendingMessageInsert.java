package justCseAlumniProject;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/sendingMessageInsert")
public class sendingMessageInsert extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int threadId                = Integer.parseInt(request.getParameter("threadId"));
        int senderOrCurrentIdOfUser = Integer.parseInt(request.getParameter("senderOrCurrentIdOfUser"));
        int idOfReceiver            = Integer.parseInt(request.getParameter("idOfUser"));
        String nameOfReceiver       = request.getParameter("nameOfReceiver");
        String message              = request.getParameter("message");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/alumnidirectory", "root", "225500");

            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO messages (thread_id, sender_id, message) VALUES (?, ?, ?)");
            ps.setInt(1, threadId);
            ps.setInt(2, senderOrCurrentIdOfUser);
            ps.setString(3, message);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("threadId",                threadId);
        request.setAttribute("senderOrCurrentIdOfUser", senderOrCurrentIdOfUser);
        request.setAttribute("idOfReceiver",            idOfReceiver);
        request.setAttribute("nameOfReceiver",          nameOfReceiver);

        request.getRequestDispatcher("fetchMessageToTheProfileServlet").forward(request, response);
    }
}