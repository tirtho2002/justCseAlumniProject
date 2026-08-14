<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.sql.Timestamp"%>

<%
    String role = (String) session.getAttribute("role");
    String userName = (String) request.getAttribute("name");
    String batchNo = (String) request.getAttribute("batchNo");

    List<Map<String, Object>> posts =
            (List<Map<String, Object>>) request.getAttribute("posts");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Alumni Portal - Home</title>


<style>

/* ================= RESET ================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}


/* ================= BASE ================= */

html {
    min-height: 100%;
    background: #6a11cb;
}


body {
    min-height: 100vh;

    font-family: Arial, sans-serif;

    background:
        linear-gradient(
            135deg,
            #4c1d95 0%,
            #6a11cb 45%,
            #2575fc 100%
        );

    background-attachment: fixed;
    background-repeat: no-repeat;
    background-size: cover;

    color: #222;

    display: flex;
    flex-direction: column;
}


/* ================= HEADER ================= */

header {
    width: 100%;

    background: rgba(255, 255, 255, 0.15);

    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);

    border-bottom:
        1px solid rgba(255, 255, 255, 0.2);

    padding: 14px 45px;

    display: flex;

    align-items: center;

    justify-content: space-between;

    color: white;

    position: sticky;

    top: 0;

    z-index: 1000;
}


/* ================= LOGO ================= */

header h1 {
    font-size: 22px;
    font-weight: bold;
}


header h1 a {
    color: white;

    text-decoration: none;

    font-size: inherit;

    font-weight: inherit;

    transition: 0.3s;
}


header h1 a:hover {
    color: #ffda79;
}


/* ================= NAV ================= */

nav {
    display: flex;

    align-items: center;

    gap: 8px;
}


nav p {
    color: white;

    font-size: 14px;
}


/* ================= MAIN ================= */

main {
    flex: 1;

    width: 100%;

    padding: 30px 20px;

    background: transparent;
}


/* ================= PAGE CONTAINER ================= */

.page-container {
    max-width: 1200px;

    margin: 0 auto;

    display: grid;

    grid-template-columns:
        240px
        minmax(0, 1fr)
        260px;

    gap: 20px;

    align-items: start;
}


/* ================= GLASS CARD ================= */

.glass-card {
    background: rgba(255, 255, 255, 0.96);

    border-radius: 14px;

    box-shadow:
        0 8px 25px rgba(0, 0, 0, 0.15);

    padding: 20px;
}


/* ================= LEFT SIDEBAR ================= */

.left-sidebar {
    position: sticky;

    top: 90px;
}


.side-menu {
    display: flex;

    flex-direction: column;

    gap: 5px;
}


.side-menu-item {
    display: flex;

    align-items: center;

    min-height: 44px;

    padding: 11px 14px;

    color: #444;

    text-decoration: none;

    font-size: 14px;

    font-weight: 500;

    border-radius: 8px;

    transition: all 0.2s ease;
}


.side-menu-item:hover {
    background: #f3f4ff;

    color: #5b21b6;

    transform: translateX(2px);
}


.side-menu-item.active {
    background: transparent;

    color: #444;

    font-weight: 600;

    box-shadow: none;
}


.menu-divider {
    height: 1px;

    background: #e5e7eb;

    margin: 12px 0;
}


.side-menu-item.logout {
    color: #dc3545;
}


.side-menu-item.logout:hover {
    background: #fff1f2;

    color: #dc3545;
}


/* ================= POST A JOB ================= */

.job-menu-form {
    margin: 6px 0;

    padding: 0;
}


.job-menu-button {
    width: 100%;

    min-height: 48px;

    border: none;

    border-radius: 9px;

    padding: 11px 14px;

    background:
        linear-gradient(
            135deg,
            #6a11cb,
            #2575fc
        );

    color: white;

    display: flex;

    align-items: center;

    justify-content: center;

    font-family: Arial, sans-serif;

    font-size: 14px;

    font-weight: 600;

    cursor: pointer;

    box-shadow:
        0 5px 14px
        rgba(106, 17, 203, 0.25);

    transition:
        transform 0.25s ease,
        box-shadow 0.25s ease,
        background 0.25s ease;
}


.job-menu-button:hover {
    background:
        linear-gradient(
            135deg,
            #2575fc,
            #6a11cb
        );

    transform: translateY(-2px);

    box-shadow:
        0 7px 18px
        rgba(37, 117, 252, 0.32);
}


.job-menu-button:active {
    transform: translateY(0);

    box-shadow:
        0 3px 8px
        rgba(37, 117, 252, 0.22);
}


.job-menu-button span {
    width: 100%;

    text-align: center;
}


/* ================= FEED ================= */

.feed {
    min-width: 0;
}


.create-post {
    margin-bottom: 20px;
}


.create-post h3 {
    margin-bottom: 15px;

    color: #6a11cb;
}


.post-textarea {
    width: 100%;

    min-height: 90px;

    resize: vertical;

    border: 1px solid #ddd;

    border-radius: 10px;

    padding: 13px;

    font-family: Arial, sans-serif;

    outline: none;
}


.post-textarea:focus {
    border-color: #6a11cb;

    box-shadow:
        0 0 0 2px
        rgba(106, 17, 203, 0.08);
}


.post-options {
    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-top: 12px;

    gap: 10px;
}


.post-btn {
    border: none;

    padding: 10px 20px;

    border-radius: 20px;

    background:
        linear-gradient(
            45deg,
            #6a11cb,
            #2575fc
        );

    color: white;

    font-weight: bold;

    cursor: pointer;

    transition: 0.3s;
}


.post-btn:hover {
    transform: scale(1.05);
}


/* ================= POST ================= */

.post {
    margin-bottom: 20px;
}


.post-header {
    display: flex;

    align-items: center;

    gap: 12px;
}


.post-avatar {
    width: 48px;

    height: 48px;

    flex-shrink: 0;

    border-radius: 50%;

    background:
        linear-gradient(
            135deg,
            #6a11cb,
            #2575fc
        );

    display: flex;

    align-items: center;

    justify-content: center;

    color: white;

    font-weight: bold;
}


.post-user h4 {
    margin-bottom: 3px;
}


.post-user span {
    font-size: 12px;

    color: #777;
}


.post-content {
    margin-top: 18px;

    line-height: 1.6;

    color: #333;

    white-space: normal;

    word-wrap: break-word;
}


/* ================= JOB CARD ================= */

.job-card {
    margin-top: 15px;

    padding: 18px;

    border-radius: 10px;

    background: #f5f7ff;

    border-left:
        5px solid #2575fc;
}


.job-card h3 {
    color: #2575fc;

    margin-bottom: 8px;
}


.job-card p {
    margin: 6px 0;

    font-size: 14px;

    line-height: 1.6;
}


/* ================= POST ACTIONS ================= */

.post-actions {
    display: flex;

    gap: 10px;

    margin-top: 18px;

    padding-top: 12px;

    border-top: 1px solid #eee;
}


.post-actions button {
    border: none;

    background: transparent;

    padding: 8px 15px;

    border-radius: 7px;

    cursor: pointer;

    color: #555;

    font-weight: bold;

    transition: 0.3s;
}


.post-actions button:hover {
    background: #f0f3ff;

    color: #2575fc;
}


/* ================= RIGHT SIDEBAR ================= */

.right-sidebar {
    position: sticky;

    top: 90px;
}


.right-card {
    margin-bottom: 20px;
}


.right-card h3 {
    color: #6a11cb;

    margin-bottom: 15px;
}


.recommendation {
    display: flex;

    align-items: center;

    gap: 10px;

    padding: 10px 0;

    border-bottom: 1px solid #eee;
}


.recommendation:last-child {
    border-bottom: none;
}


.recommend-avatar {
    width: 42px;

    height: 42px;

    flex-shrink: 0;

    border-radius: 50%;

    background:
        linear-gradient(
            135deg,
            #6a11cb,
            #2575fc
        );

    color: white;

    display: flex;

    align-items: center;

    justify-content: center;

    font-weight: bold;
}


.recommend-info {
    flex: 1;
}


.recommend-info strong {
    display: block;

    font-size: 14px;
}


.recommend-info span {
    font-size: 12px;

    color: #777;
}


.connect-btn {
    border: 1px solid #2575fc;

    background: white;

    color: #2575fc;

    padding: 5px 9px;

    border-radius: 6px;

    cursor: pointer;

    font-size: 12px;
}


.connect-btn:hover {
    background: #2575fc;

    color: white;
}


/* ================= LATEST JOB ================= */

.latest-job {
    padding: 10px 0;

    border-bottom: 1px solid #eee;
}


.latest-job:last-child {
    border-bottom: none;
}


.latest-job strong {
    display: block;

    font-size: 14px;
}


.latest-job p {
    font-size: 12px;

    color: #777;

    margin-top: 5px;
}


/* ================= EMPTY POSTS ================= */

.no-posts {
    text-align: center;

    color: #777;

    padding: 25px 10px;
}


/* ================= FOOTER ================= */

footer {
    width: 100%;

    background:
        rgba(0, 0, 0, 0.20);

    backdrop-filter: blur(8px);

    -webkit-backdrop-filter: blur(8px);

    border-top:
        1px solid
        rgba(255, 255, 255, 0.15);

    color: white;

    text-align: center;

    padding: 15px;

    font-size: 14px;
}


/* ================= RESPONSIVE ================= */

@media (max-width: 1000px) {

    .page-container {
        grid-template-columns:
            200px
            minmax(0, 1fr);
    }

    .right-sidebar {
        display: none;
    }

}


@media (max-width: 700px) {

    header {
        padding: 12px 18px;

        flex-direction: column;

        gap: 10px;
    }


    header h1 {
        font-size: 20px;
    }


    nav {
        flex-wrap: wrap;

        justify-content: center;
    }


    main {
        padding: 20px 10px;
    }


    .page-container {
        grid-template-columns: 1fr;
    }


    .left-sidebar {
        position: static;
    }


    .side-menu {
        display: grid;

        grid-template-columns:
            1fr 1fr;

        gap: 6px;
    }


    .menu-divider {
        display: none;
    }


    .side-menu-item {
        justify-content: center;
    }


    .job-menu-button {
        justify-content: center;
    }


    .job-menu-button span {
        text-align: center;
    }


    .post-options {
        flex-direction: column;

        align-items: stretch;
    }


    .post-btn {
        width: 100%;
    }

}

</style>

</head>


<body>


<!-- ================= HEADER ================= -->

<header>

    <h1>

        <a href="loginToHomeServlet">
            Alumni Portal
        </a>

    </h1>


    <nav>

        <p>

            <strong>
                Hello!! <%= userName %>
            </strong>

        </p>

    </nav>

</header>



<!-- ================= MAIN ================= -->

<main>

<div class="page-container">


    <!-- ================= LEFT SIDEBAR ================= -->

    <aside class="left-sidebar">

        <div class="glass-card">

            <div class="side-menu">


                <!-- HOME -->

                <a href="loginToHomeServlet"
                   class="side-menu-item active">

                    <span>
                        Home
                    </span>

                </a>


                <!-- ALUMNI -->

                <a href="alumniSearchPage.jsp"
                   class="side-menu-item">

                    <span>
                        Alumni
                    </span>

                </a>


                <!-- RECOMMENDED SKILLMATES -->

                <a href="#"
                   class="side-menu-item"
                   onclick="
                       document
                       .getElementById('recommendForm')
                       .submit();
                       return false;
                   ">

                    <span>
                        Recommended SkillMates
                    </span>

                </a>


                <form id="recommendForm"
                      action="recommendedAlumniServlet"
                      method="post"
                      style="display:none;">

                    <input type="hidden"
                           name="batch"
                           value="<%= batchNo %>">

                </form>


                <!-- MESSAGES -->

                <a href="messageSenderListServlet"
                   class="side-menu-item">

                    <span>
                        Messages
                    </span>

                </a>


                <!-- MY PROFILE -->

                <a href="<%= "alumni".equalsIgnoreCase(role)
                        ? "alumniProfile"
                        : "studentProfile" %>"
                   class="side-menu-item">

                    <span>
                        My Profile
                    </span>

                </a>


                <!-- LOGOUT -->

                <a href="loginPage.html"
                   class="side-menu-item logout">

                    <span>
                        Logout
                    </span>

                </a>


                <!-- DIVIDER -->

                <div class="menu-divider"></div>


                <!-- POST A JOB -->

                <%
                    if ("alumni".equalsIgnoreCase(role)) {
                %>

                <form action="postJobPage.jsp"
                      method="post"
                      class="job-menu-form">

                    <input type="hidden"
                           name="formType"
                           value="job">

                    <button type="submit"
                            class="job-menu-button">

                        <span>
                            Post a Job
                        </span>

                    </button>

                </form>

                <%
                    }
                %>


            </div>

        </div>

    </aside>



    <!-- ================= CENTER FEED ================= -->

    <section class="feed">


        <!-- CREATE POST -->

        <div class="glass-card create-post">

            <h3>
                What's on your mind?
            </h3>


            <form action="postManagerServlet"
                  method="post">

                <textarea
                    class="post-textarea"
                    name="mindContent"
                    placeholder="What's on your mind? Share an update with the alumni community..."
                    required></textarea>


                <input type="hidden"
                       name="formType"
                       value="mind">


                <div class="post-options">

                    <button
                        type="submit"
                        class="post-btn">

                        Post

                    </button>

                </div>

            </form>

        </div>



        <!-- ================= DYNAMIC POSTS ================= -->

        <%
            if (posts != null && !posts.isEmpty()) {

                for (Map<String, Object> post : posts) {

                    String postName =
                            (String) post.get("name");

                    String postBatch =
                            (String) post.get("batchNo");

                    String content =
                            (String) post.get("content");

                    String type =
                            (String) post.get("type");

                    Timestamp createdAt =
                            (Timestamp) post.get("createdAt");

                    String firstLetter = "?";

                    if (postName != null &&
                        !postName.trim().isEmpty()) {

                        firstLetter =
                                postName.trim()
                                .substring(0, 1)
                                .toUpperCase();
                    }
        %>


        <!-- ================= SINGLE POST ================= -->

        <div class="glass-card post">

            <div class="post-header">

                <div class="post-avatar">
                    <%= firstLetter %>
                </div>


                <div class="post-user">

                    <h4>
                        <%= postName %>
                    </h4>


                    <span>
                        JUST CSE Batch <%= postBatch %>

                        <% if (createdAt != null) { %>

                            &nbsp; | &nbsp;

                            <%= createdAt %>

                        <% } %>

                    </span>

                </div>

            </div>


            <div class="post-content">


                <% if ("job".equalsIgnoreCase(type)) { %>


                    <!-- ================= JOB POST ================= -->

                    <div class="job-card">

                        <h3>
                            Job Opportunity
                        </h3>


                        <p>
                            <%= content != null
                                ? content.replace("\n", "<br>")
                                : "" %>
                        </p>

                    </div>


                <% } else { %>


                    <!-- ================= NORMAL POST ================= -->

                    <p>

                        <%= content != null
                            ? content.replace("\n", "<br>")
                            : "" %>

                    </p>


                <% } %>


            </div>


            <!-- POST ACTIONS -->

            <div class="post-actions">

                <button>
                    Like
                </button>

                <button>
                    Comment
                </button>

                <button>
                    Share
                </button>

            </div>

        </div>


        <%
                }

            } else {
        %>


        <!-- ================= NO POSTS ================= -->

        <div class="glass-card post">

            <div class="no-posts">

                No posts available in the last 7 days.

            </div>

        </div>


        <%
            }
        %>


    </section>



    <!-- ================= RIGHT SIDEBAR ================= -->

    <aside class="right-sidebar">


        <!-- RECOMMENDED SKILLMATES -->

        <div class="glass-card right-card">

            <h3>
                Recommended SkillMates
            </h3>


            <div class="recommendation">

                <div class="recommend-avatar">
                    A
                </div>


                <div class="recommend-info">

                    <strong>
                        Arif Hasan
                    </strong>

                    <span>
                        Java, Spring Boot
                    </span>

                </div>


                <button class="connect-btn">
                    Connect
                </button>

            </div>


            <div class="recommendation">

                <div class="recommend-avatar">
                    N
                </div>


                <div class="recommend-info">

                    <strong>
                        Nusrat Jahan
                    </strong>

                    <span>
                        Python, ML
                    </span>

                </div>


                <button class="connect-btn">
                    Connect
                </button>

            </div>


            <div class="recommendation">

                <div class="recommend-avatar">
                    T
                </div>


                <div class="recommend-info">

                    <strong>
                        Tanvir Ahmed
                    </strong>

                    <span>
                        C++, CP
                    </span>

                </div>


                <button class="connect-btn">
                    Connect
                </button>

            </div>


            <div style="margin-top:15px;">

                <a href="recommendedAlumniServlet"
                   style="
                   color:#2575fc;
                   text-decoration:none;
                   font-weight:bold;
                   font-size:14px;">

                    View all SkillMates

                </a>

            </div>

        </div>



        <!-- ================= LATEST JOBS ================= -->

        <div class="glass-card right-card">

            <h3>
                Latest Jobs
            </h3>


            <%
                boolean hasJob = false;

                if (posts != null) {

                    for (Map<String, Object> post : posts) {

                        String type =
                                (String) post.get("type");

                        if ("job".equalsIgnoreCase(type)) {

                            hasJob = true;

                            String content =
                                    (String) post.get("content");

                            String jobName =
                                    (String) post.get("name");

            %>


            <div class="latest-job">

                <strong>
                    Job Opportunity
                </strong>

                <p>
                    Posted by <%= jobName %>
                </p>

                <p>
                    <%= content != null
                        ? content.split("\n")[0]
                        : "" %>
                </p>

            </div>


            <%
                        }
                    }
                }

                if (!hasJob) {
            %>


            <div class="latest-job">

                <p>
                    No job posts in the last 7 days.
                </p>

            </div>


            <%
                }
            %>


        </div>

    </aside>


</div>

</main>



<!-- ================= FOOTER ================= -->

<footer>

    &copy; 2026 All Rights Reserved by

    <strong>
        tirtho_saha
    </strong>

</footer>


</body>

</html>