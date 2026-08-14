package justCseAlumniProject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/postManagerServlet")
public class postManagerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String DB_URL =
            "jdbc:mysql://localhost:3306/alumnidirectory";

    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "225500";

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("loginPage.html");
            return;
        }

        String formType = request.getParameter("formType");

        Integer userId = (Integer) session.getAttribute("userId");
        String name = (String) session.getAttribute("name");
        String batchNo = (String) session.getAttribute("batchNo");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("home.jsp?error=driverError");
            return;
        }

        // ==========================================
        // NORMAL POST
        // ==========================================

        if ("mind".equals(formType)) {

            String mindContent = request.getParameter("mindContent");

            if (mindContent == null || mindContent.trim().isEmpty()) {
                response.sendRedirect("home.jsp?error=emptyPost");
                return;
            }

            String insertPostQuery =
                    "INSERT INTO posts "
                  + "(user_id, name, batchNo, content, type) "
                  + "VALUES (?, ?, ?, ?, 'mind')";

            try (
                Connection conn = DriverManager.getConnection(
                        DB_URL, DB_USER, DB_PASSWORD);

                PreparedStatement ps =
                        conn.prepareStatement(insertPostQuery)
            ) {

                ps.setInt(1, userId);
                ps.setString(2, name);
                ps.setString(3, batchNo);
                ps.setString(4, mindContent.trim());

                int rowsInserted = ps.executeUpdate();

                if (rowsInserted > 0) {

                    System.out.println(
                            "Mind post inserted successfully."
                    );

                    response.sendRedirect(
                            "loginToHomeServlet"
                    );

                } else {

                    response.sendRedirect(
                            "home.jsp?error=postFailed"
                    );
                }

            } catch (SQLException e) {

                e.printStackTrace();

                response.sendRedirect(
                        "home.jsp?error=dbError"
                );
            }

            return;
        }

        // ==========================================
        // JOB POST
        // ==========================================

        else if ("job".equals(formType)) {

            String jobTitle = request.getParameter("jobTitle");
            String company = request.getParameter("company");
            String location = request.getParameter("location");
            String jobType = request.getParameter("jobType");
            String salary = request.getParameter("salary");
            String jobDescription =
                    request.getParameter("jobDescription");
            String applicationLink =
                    request.getParameter("applicationLink");

            if (jobTitle == null || jobTitle.trim().isEmpty()
                    || company == null || company.trim().isEmpty()
                    || jobDescription == null
                    || jobDescription.trim().isEmpty()) {

                response.sendRedirect(
                        "postAJob.jsp?error=emptyField"
                );

                return;
            }

            StringBuilder sb = new StringBuilder();

            sb.append("Job Title: ")
              .append(jobTitle.trim())
              .append("\n");

            sb.append("Company: ")
              .append(company.trim())
              .append("\n");

            sb.append("Location: ");

            if (location != null) {
                sb.append(location.trim());
            }

            sb.append("\n");

            sb.append("Job Type: ");

            if (jobType != null) {
                sb.append(jobType.trim());
            }

            sb.append("\n");

            if (salary != null && !salary.trim().isEmpty()) {

                sb.append("Salary: ")
                  .append(salary.trim())
                  .append("\n");
            }

            sb.append("\nDescription:\n")
              .append(jobDescription.trim())
              .append("\n\n");

            if (applicationLink != null
                    && !applicationLink.trim().isEmpty()) {

                sb.append("Application Link / Email: ")
                  .append(applicationLink.trim());
            }

            String formattedJobContent = sb.toString();

            String insertJobQuery =
                    "INSERT INTO posts "
                  + "(user_id, name, batchNo, content, type) "
                  + "VALUES (?, ?, ?, ?, 'job')";

            try (
                Connection conn = DriverManager.getConnection(
                        DB_URL, DB_USER, DB_PASSWORD);

                PreparedStatement ps =
                        conn.prepareStatement(insertJobQuery)
            ) {

                ps.setInt(1, userId);
                ps.setString(2, name);
                ps.setString(3, batchNo);
                ps.setString(4, formattedJobContent);

                int rowsInserted = ps.executeUpdate();

                if (rowsInserted > 0) {

                    System.out.println(
                            "Job post inserted successfully."
                    );

                    response.sendRedirect(
                            "loginToHomeServlet"
                    );

                } else {

                    response.sendRedirect(
                            "postAJob.jsp?error=jobPostFailed"
                    );
                }

            } catch (SQLException e) {

                e.printStackTrace();

                response.sendRedirect(
                        "postAJob.jsp?error=dbError"
                );
            }

            return;
        }

        // ==========================================
        // INVALID FORM TYPE
        // ==========================================

        else {

            response.sendRedirect(
                    "home.jsp?error=invalidForm"
            );

            return;
        }
    }
}