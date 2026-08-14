package justCseAlumniProject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/loginToHomeServlet")
public class loginToHomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String DB_URL =
            "jdbc:mysql://localhost:3306/alumniDirectory";

    private static final String DB_USER = "root";

    private static final String DB_PASSWORD = "225500";

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // ==========================================
        // SESSION CHECK
        // ==========================================

        if (session == null ||
                session.getAttribute("userId") == null) {

            response.sendRedirect("loginPage.html");
            return;
        }

        // ==========================================
        // GET SESSION DATA
        // ==========================================

        String name =
                (String) session.getAttribute("name");

        String role =
                (String) session.getAttribute("role");

        String batchNo =
                (String) session.getAttribute("batchNo");

        // ==========================================
        // POST LIST
        // ==========================================

        List<Map<String, Object>> posts =
                new ArrayList<>();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            // ==========================================
            // LOAD MYSQL DRIVER
            // ==========================================

            Class.forName("com.mysql.cj.jdbc.Driver");

            // ==========================================
            // DATABASE CONNECTION
            // ==========================================

            conn = DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );

            // ==========================================
            // FETCH LAST 7 DAYS POSTS
            // ==========================================

            String sql =
                    "SELECT user_id, name, batchNo, content, type, created_at "
                  + "FROM posts "
                  + "WHERE created_at >= NOW() - INTERVAL 7 DAY "
                  + "ORDER BY created_at DESC";

            ps = conn.prepareStatement(sql);

            rs = ps.executeQuery();

            // ==========================================
            // STORE POST DATA
            // ==========================================

            while (rs.next()) {

                Map<String, Object> post =
                        new HashMap<>();

                post.put(
                        "userId",
                        rs.getInt("user_id")
                );

                post.put(
                        "name",
                        rs.getString("name")
                );

                post.put(
                        "batchNo",
                        rs.getString("batchNo")
                );

                post.put(
                        "content",
                        rs.getString("content")
                );

                post.put(
                        "type",
                        rs.getString("type")
                );

                post.put(
                        "createdAt",
                        rs.getTimestamp("created_at")
                );

                posts.add(post);
            }

            // ==========================================
            // SEND DATA TO JSP
            // ==========================================

            request.setAttribute(
                    "name",
                    name
            );

            request.setAttribute(
                    "role",
                    role
            );

            request.setAttribute(
                    "batchNo",
                    batchNo
            );

            request.setAttribute(
                    "posts",
                    posts
            );

            // ==========================================
            // FORWARD TO HOMEPAGE
            // ==========================================

            request.getRequestDispatcher(
                    "homePage.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "Error: " + e.getMessage()
            );

        } finally {

            // ==========================================
            // CLOSE DATABASE RESOURCES
            // ==========================================

            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}