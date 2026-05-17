package justCseAlumniProject;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/connectionListIntermediateServlet")
public class connectionListIntermediateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // 🔹 Get data from form (PARAMETERS)
            int threadId = Integer.parseInt(request.getParameter("threadId"));
            int senderId = Integer.parseInt(request.getParameter("senderOrCurrentIdOfUser"));
            int receiverId = Integer.parseInt(request.getParameter("idOfReceiver"));
            String name = request.getParameter("nameOfReceiver");

            // 🔹 Convert to ATTRIBUTES (for next servlet)
            request.setAttribute("threadId", threadId);
            request.setAttribute("senderOrCurrentIdOfUser", senderId);
            request.setAttribute("idOfReceiver", receiverId);
            request.setAttribute("nameOfReceiver", name);
            
            
            System.out.println("Intermediate Servlet - threadId: " + threadId);

            // 🔹 Forward to your main servlet
            request.getRequestDispatcher("fetchMessageToTheProfileServlet")
                   .forward(request, response);

        } catch (Exception e) {
            throw new ServletException(e);
            
        }
    }
}