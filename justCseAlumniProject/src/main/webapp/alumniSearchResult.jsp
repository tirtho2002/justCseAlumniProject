<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Alumni Search Results</title>


<style>

/* ==============================
   BASIC
================================ */

* {
    box-sizing: border-box;
}

html, body {
    margin: 0;
    min-height: 100%;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {

    background: linear-gradient(
        135deg,
        #6a11cb,
        #2575fc
    );

    color: #333;
}


/* ==============================
   HEADER
================================ */

header {

    background: rgba(255, 255, 255, 0.15);

    backdrop-filter: blur(10px);

    padding: 18px 45px;

    display: flex;

    justify-content: space-between;

    align-items: center;

    color: white;

    box-shadow:
        0 2px 10px rgba(0,0,0,0.1);
}

header h1 {

    margin: 0;

    font-size: 22px;

    letter-spacing: 1px;
}

.header-text {

    font-size: 14px;

    opacity: 0.9;
}


/* ==============================
   MAIN CONTAINER
================================ */

.main {

    width: 100%;

    padding: 40px 20px 60px;
}


.container {

    width: 100%;

    max-width: 1050px;

    margin: auto;

    background: rgba(255,255,255,0.97);

    border-radius: 16px;

    padding: 35px;

    box-shadow:
        0 15px 40px rgba(0,0,0,0.25);
}


/* ==============================
   TITLE
================================ */

.title-section {

    text-align: center;

    margin-bottom: 30px;
}

.title-section h2 {

    margin: 0;

    color: #6a11cb;

    font-size: 28px;
}

.title-section p {

    margin-top: 8px;

    color: #777;

    font-size: 14px;
}


/* ==============================
   RESULT COUNT
================================ */

.result-count {

    background: #f5f1ff;

    border-left: 5px solid #6a11cb;

    padding: 12px 16px;

    border-radius: 8px;

    margin-bottom: 25px;

    color: #555;

    font-size: 14px;
}

.result-count strong {

    color: #6a11cb;
}


/* ==============================
   ALUMNI CARD
================================ */

.alumni-card {

    border: 1px solid #e2e2e2;

    border-radius: 12px;

    padding: 22px;

    margin-bottom: 18px;

    background: white;

    transition: all 0.3s ease;

    box-shadow:
        0 3px 10px rgba(0,0,0,0.06);
}


.alumni-card:hover {

    transform: translateY(-4px);

    box-shadow:
        0 10px 25px rgba(106,17,203,0.18);

    border-color: #cbb4ff;
}


/* ==============================
   CARD TOP
================================ */

.card-top {

    display: flex;

    justify-content: space-between;

    align-items: flex-start;

    gap: 20px;

    margin-bottom: 18px;
}


/* ==============================
   NAME
================================ */

.name {

    margin: 0;

    font-size: 21px;

    font-weight: 700;
}

.name a {

    text-decoration: none;

    color: #2d2d2d;

    transition: 0.3s;
}

.name a:hover {

    color: #6a11cb;
}


/* ==============================
   BATCH BADGE
================================ */

.batch-badge {

    background:
        linear-gradient(
            135deg,
            #6a11cb,
            #2575fc
        );

    color: white;

    padding: 6px 13px;

    border-radius: 20px;

    font-size: 12px;

    font-weight: 600;

    white-space: nowrap;
}


/* ==============================
   INFORMATION GRID
================================ */

.info-grid {

    display: grid;

    grid-template-columns:
        repeat(3, 1fr);

    gap: 14px;

    margin-bottom: 15px;
}


.info-item {

    background: #f8f8fb;

    padding: 12px;

    border-radius: 8px;
}


.info-label {

    font-size: 11px;

    color: #888;

    text-transform: uppercase;

    letter-spacing: 0.5px;

    margin-bottom: 4px;
}


.info-value {

    font-size: 14px;

    color: #444;

    font-weight: 500;

    word-break: break-word;
}


/* ==============================
   SKILLS
================================ */

.skills-section {

    margin-top: 10px;
}


.skills-label {

    font-size: 12px;

    color: #777;

    font-weight: 600;

    margin-bottom: 8px;
}


.skills {

    display: flex;

    flex-wrap: wrap;

    gap: 7px;
}


.skill {

    background: #eee8ff;

    color: #6a11cb;

    padding: 5px 10px;

    border-radius: 15px;

    font-size: 12px;

    font-weight: 600;
}


/* ==============================
   PROFILE BUTTON
================================ */

.card-bottom {

    display: flex;

    justify-content: flex-end;

    margin-top: 18px;
}


.profile-btn {

    display: inline-block;

    text-decoration: none;

    color: white;

    background:
        linear-gradient(
            135deg,
            #6a11cb,
            #2575fc
        );

    padding: 10px 18px;

    border-radius: 7px;

    font-size: 13px;

    font-weight: 600;

    transition: 0.3s;
}


.profile-btn:hover {

    transform: translateY(-1px);

    box-shadow:
        0 5px 12px rgba(106,17,203,0.3);
}


/* ==============================
   NO RESULT
================================ */

.no-result {

    text-align: center;

    padding: 50px 20px;
}


.no-result-icon {

    font-size: 45px;

    margin-bottom: 10px;
}


.no-result h3 {

    color: #555;

    margin: 5px 0;
}


.no-result p {

    color: #888;

    font-size: 14px;
}


/* ==============================
   BACK BUTTON
================================ */

.back-section {

    text-align: center;

    margin-top: 30px;
}


.back-btn {

    display: inline-block;

    text-decoration: none;

    padding: 11px 22px;

    border-radius: 8px;

    border: 1px solid #6a11cb;

    color: #6a11cb;

    background: white;

    font-size: 14px;

    font-weight: 600;

    transition: 0.3s;
}


.back-btn:hover {

    background: #6a11cb;

    color: white;
}


/* ==============================
   FOOTER
================================ */

footer {

    text-align: center;

    padding: 15px;

    background: rgba(0,0,0,0.25);

    color: white;

    font-size: 14px;
}


/* ==============================
   RESPONSIVE
================================ */

@media (max-width: 800px) {

    .container {

        padding: 22px;
    }

    .info-grid {

        grid-template-columns:
            repeat(2, 1fr);
    }
}


@media (max-width: 550px) {

    header {

        padding: 15px 20px;
    }

    .main {

        padding: 20px 10px 40px;
    }

    .container {

        padding: 18px;
    }

    .card-top {

        flex-direction: column;
    }

    .info-grid {

        grid-template-columns: 1fr;
    }

    .title-section h2 {

        font-size: 23px;
    }
}

</style>

</head>


<body>


<!-- ==============================
     HEADER
================================ -->

<header>

    <h1>Alumni Portal</h1>

    <div class="header-text">
        Find & Connect with Alumni
    </div>

</header>



<!-- ==============================
     MAIN
================================ -->

<div class="main">

<div class="container">


    <!-- TITLE -->

    <div class="title-section">

        <h2>Alumni Search Results</h2>

        <p>
            Alumni matching your search criteria
        </p>

    </div>



<%

    List<Map<String, Object>> list =
        (List<Map<String, Object>>)
        request.getAttribute("alumniList");


    if (list != null && !list.isEmpty()) {

%>


    <!-- RESULT COUNT -->

    <div class="result-count">

        Found
        <strong><%= list.size() %></strong>
        alumni matching your search.

    </div>



<%

        for (Map<String, Object> alumni : list) {

%>


    <!-- ==============================
         ALUMNI CARD
    ================================= -->

    <div class="alumni-card">


        <!-- TOP -->

        <div class="card-top">


            <div class="name">

                <a href="viewAlumniProfileServlet?id=<%= alumni.get("userId") %>">

                    <%= alumni.get("name") %>

                </a>

            </div>


            <div class="batch-badge">

                Batch <%= alumni.get("batch") %>

            </div>


        </div>



        <!-- INFORMATION -->

        <div class="info-grid">


            <!-- COMPANY -->

            <div class="info-item">

                <div class="info-label">
                    Company
                </div>

                <div class="info-value">

                    <%
                        Object company =
                            alumni.get("company");

                        if (company != null &&
                            !company.toString().isEmpty()) {
                    %>

                        <%= company %>

                    <%
                        } else {
                    %>

                        Not specified

                    <%
                        }
                    %>

                </div>

            </div>



            <!-- POSITION -->

            <div class="info-item">

                <div class="info-label">
                    Position
                </div>

                <div class="info-value">

                    <%
                        Object position =
                            alumni.get("position");

                        if (position != null &&
                            !position.toString().isEmpty()) {
                    %>

                        <%= position %>

                    <%
                        } else {
                    %>

                        Not specified

                    <%
                        }
                    %>

                </div>

            </div>



            <!-- LOCATION -->

            <div class="info-item">

                <div class="info-label">
                    Location
                </div>

                <div class="info-value">

                    <%
                        Object location =
                            alumni.get("location");

                        if (location != null &&
                            !location.toString().isEmpty()) {
                    %>

                        <%= location %>

                    <%
                        } else {
                    %>

                        Not specified

                    <%
                        }
                    %>

                </div>

            </div>


        </div>



        <!-- SKILLS -->

        <div class="skills-section">

            <div class="skills-label">
                Skills
            </div>


            <div class="skills">

                <%

                    Object skillObject =
                        alumni.get("skills");


                    if (skillObject != null &&
                        !skillObject.toString().isEmpty()) {

                        String skills =
                            skillObject.toString();

                        String[] skillArray =
                            skills.split(",");


                        for (String s : skillArray) {

                %>


                    <span class="skill">

                        <%= s.trim() %>

                    </span>


                <%

                        }

                    } else {

                %>

                    <span class="skill">
                        No skills specified
                    </span>

                <%

                    }

                %>

            </div>

        </div>



        <!-- PROFILE BUTTON -->

        <div class="card-bottom">

            <a class="profile-btn"
               href="viewAlumniProfileServlet?id=<%= alumni.get("userId") %>">

                View Profile →

            </a>

        </div>


    </div>


<%

        }

    } else {

%>


    <!-- ==============================
         NO RESULT
    ================================= -->

    <div class="no-result">

        <div class="no-result-icon">
            🔍
        </div>

        <h3>
            No Alumni Found
        </h3>

        <p>
            No alumni match your search criteria.
            Try changing your search filters.
        </p>

    </div>


<%

    }

%>



    <!-- BACK -->

    <div class="back-section">

        <a href="alumniSearchPage.jsp"
           class="back-btn">

            ← Back to Search

        </a>

    </div>


</div>

</div>



<!-- ==============================
     FOOTER
================================ -->

<footer>

    © 2026 All Rights Reserved by
    <strong>tirtho_saha</strong>

</footer>


</body>

</html>