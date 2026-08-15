package justCseAlumniProject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/searchAlumniServlet")
public class searchAlumniServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // =========================================
    // DATABASE INFORMATION
    // =========================================

    private static final String URL =
            "jdbc:mysql://localhost:3306/alumnidirectory";

    private static final String USER =
            "root";

    private static final String PASSWORD =
            "225500";


    // =========================================
    // POST
    // =========================================

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");


        // =========================================
        // 1. GET SEARCH VALUES FROM JSP
        // =========================================

        String name = request.getParameter("name");

        String batch = request.getParameter("batch");

        String skill = request.getParameter("skill");

        String company = request.getParameter("company");


        // =========================================
        // 2. HANDLE NULL VALUES
        // =========================================

        if (name == null) {
            name = "";
        }

        if (batch == null) {
            batch = "";
        }

        if (skill == null) {
            skill = "";
        }

        if (company == null) {
            company = "";
        }


        // =========================================
        // 3. REMOVE EXTRA SPACES
        // =========================================

        name = name.trim();

        batch = batch.trim();

        skill = skill.trim();

        company = company.trim();


        // =========================================
        // 4. PRINT SEARCH VALUES
        // =========================================

        System.out.println("----------------------------------");

        System.out.println("SEARCH REQUEST");

        System.out.println("Name    = " + name);

        System.out.println("Batch   = " + batch);

        System.out.println("Skill   = " + skill);

        System.out.println("Company = " + company);

        System.out.println("----------------------------------");


        // =========================================
        // 5. BUILD SQL
        // =========================================

        StringBuilder sql = new StringBuilder();

        sql.append("SELECT * FROM alumni WHERE 1=1");


        // This list will store the values
        // for the ? placeholders

        List<Object> parameters =
                new ArrayList<>();


        // =========================================
        // 6. NAME SEARCH
        // =========================================

        if (!name.isEmpty()) {

            sql.append(" AND name LIKE ?");

            parameters.add("%" + name + "%");
        }


        // =========================================
        // 7. BATCH SEARCH
        // =========================================

        if (!batch.isEmpty()) {

            sql.append(" AND batch_no = ?");

            parameters.add(
                    Integer.parseInt(batch)
            );
        }


        // =========================================
        // 8. SKILL SEARCH
        // =========================================

        if (!skill.isEmpty()) {

            sql.append(" AND skills LIKE ?");

            parameters.add("%" + skill + "%");
        }


        // =========================================
        // 9. COMPANY SEARCH
        // =========================================

        if (!company.isEmpty()) {

            sql.append(" AND company LIKE ?");

            parameters.add("%" + company + "%");
        }


        // =========================================
        // 10. FINAL SQL
        // =========================================

        String finalSQL = sql.toString();

        System.out.println("FINAL SQL:");

        System.out.println(finalSQL);


        // =========================================
        // 11. DATABASE CONNECTION
        // =========================================

        try {

            // Load MySQL driver

            Class.forName(
                    "com.mysql.cj.jdbc.Driver"
            );


            // Connect database

            Connection con =
                    DriverManager.getConnection(
                            URL,
                            USER,
                            PASSWORD
                    );


            System.out.println(
                    "Database connected successfully!"
            );


            // =====================================
            // 12. PREPARED STATEMENT
            // =====================================

            PreparedStatement ps =
                    con.prepareStatement(finalSQL);


            // =====================================
            // 13. SET PARAMETERS
            // =====================================

            for (int i = 0;
                 i < parameters.size();
                 i++) {

                ps.setObject(
                        i + 1,
                        parameters.get(i)
                );
            }


            // =====================================
            // 14. EXECUTE QUERY
            // =====================================

            ResultSet rs =
                    ps.executeQuery();


            // =====================================
            // 15. CREATE RESULT LIST
            // =====================================

            List<Map<String, Object>> alumniList =
                    new ArrayList<>();


            // =====================================
            // 16. READ DATABASE RESULTS
            // =====================================

            while (rs.next()) {

                Map<String, Object> alumni =
                        new HashMap<>();


                // USER ID

                alumni.put(
                        "userId",
                        rs.getInt("user_id")
                );


                // NAME

                alumni.put(
                        "name",
                        rs.getString("name")
                );


                // BATCH

                alumni.put(
                        "batch",
                        rs.getInt("batch_no")
                );


                // COMPANY

                alumni.put(
                        "company",
                        rs.getString("company")
                );


                // POSITION

                alumni.put(
                        "position",
                        rs.getString("position")
                );


                // LOCATION

                alumni.put(
                        "location",
                        rs.getString("location")
                );


                // SKILLS

                alumni.put(
                        "skills",
                        rs.getString("skills")
                );


                // Add to list

                alumniList.add(alumni);
            }


            // =====================================
            // 17. PRINT RESULT COUNT
            // =====================================

            System.out.println(
                    "Alumni found = "
                    + alumniList.size()
            );


            // =====================================
            // 18. SEND RESULTS TO JSP
            // =====================================

            request.setAttribute(
                    "alumniList",
                    alumniList
            );


            // =====================================
            // 19. OPEN RESULT PAGE
            // =====================================

            request.getRequestDispatcher(
                    "alumniSearchResult.jsp"
            ).forward(
                    request,
                    response
            );


            // =====================================
            // 20. CLOSE RESOURCES
            // =====================================

            rs.close();

            ps.close();

            con.close();


        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException(e);
        }

    }

}