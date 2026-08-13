<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Alumni Portal - Home</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            min-height: 100%;
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

            border-bottom: 1px solid rgba(255,255,255,0.2);

            padding: 14px 45px;

            display: flex;
            align-items: center;
            justify-content: space-between;

            color: white;

            position: sticky;
            top: 0;

            z-index: 1000;
        }

        .logo {
            font-size: 23px;
            font-weight: bold;
            letter-spacing: 0.5px;
        }

        nav {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-weight: bold;

            padding: 10px 15px;

            border-radius: 8px;

            transition: 0.3s;
        }

        nav a:hover {
            background: rgba(255,255,255,0.18);
            color: #ffda79;
        }

        nav a.active {
            background: rgba(255,255,255,0.22);
        }

        /* ================= MAIN ================= */

        main {
            flex: 1;
            width: 100%;

            padding: 30px 20px;

            background: transparent;
        }

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
            background: rgba(255,255,255,0.96);

            border-radius: 14px;

            box-shadow:
                0 8px 25px rgba(0,0,0,0.15);

            padding: 20px;
        }

        /* ================= LEFT SIDEBAR ================= */

        .left-sidebar {
            position: sticky;
            top: 90px;
        }

        .profile-mini {
            text-align: center;
        }

        .profile-avatar {
            width: 75px;
            height: 75px;

            margin: 0 auto 12px;

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

            font-size: 28px;
            font-weight: bold;
        }

        .profile-mini h3 {
            margin-bottom: 5px;
        }

        .profile-mini p {
            color: #777;
            font-size: 14px;
        }

        .side-menu {
            margin-top: 0;

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
            background:
                linear-gradient(
                    135deg,
                    #6a11cb,
                    #2575fc
                );

            color: white;

            font-weight: 600;

            box-shadow:
                0 4px 10px rgba(37,117,252,0.2);
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
                0 0 0 2px rgba(106,17,203,0.08);
        }

        .post-options {
            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-top: 12px;

            gap: 10px;
        }

        .post-type {
            padding: 8px;

            border: 1px solid #ddd;

            border-radius: 7px;

            color: #333;

            background: white;
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
        }

        /* ================= JOB CARD ================= */

        .job-card {
            margin-top: 15px;

            padding: 18px;

            border-radius: 10px;

            background: #f5f7ff;

            border-left: 5px solid #2575fc;
        }

        .job-card h3 {
            color: #2575fc;

            margin-bottom: 8px;
        }

        .job-card p {
            margin: 6px 0;

            font-size: 14px;
        }

        .apply-btn {
            display: inline-block;

            margin-top: 12px;

            padding: 9px 18px;

            background: #2575fc;

            color: white;

            text-decoration: none;

            border-radius: 7px;

            font-weight: bold;
        }

        .apply-btn:hover {
            background: #6a11cb;
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

        /* ================= FOOTER ================= */

        footer {
            width: 100%;

            background: rgba(255,255,255,0.15);

            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);

            border-top:
                1px solid rgba(255,255,255,0.15);

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

            nav {
                flex-wrap: wrap;

                justify-content: center;
            }

            nav a {
                padding: 8px 10px;

                font-size: 13px;
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

                grid-template-columns: 1fr 1fr;

                gap: 6px;
            }

            .menu-divider {
                display: none;
            }

            .side-menu-item {
                justify-content: center;
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

        <div class="logo">
            Alumni Portal
        </div>


 
        <nav>
        
      	<p><strong>Hello!! <%=request.getAttribute("name")%></p></strong>
        

<%--
            <a href="homepage.jsp" class="active">
                Home
            </a>

            <a href="alumniSearchPage.html">
                Alumni
            </a>

            <a href="recommendedAlumniServlet">
                Recommended SkillMates
            </a>

            <a href="messageSenderListServlet">
                Messages
            </a>

            <a href="profile.jsp">
                Profile
            </a>
            --%>

        </nav>


    </header>


    <!-- ================= MAIN ================= -->

    <main>

        <div class="page-container">


            <!-- ================= LEFT SIDEBAR ================= -->

            <aside class="left-sidebar">

                <div class="glass-card">

                    <div class="side-menu">

                        <a href="homepage.jsp"
                           class="side-menu-item active">

                            <span>
                                Home
                            </span>

                        </a>


                        <a href="alumniSearchPage.jsp"
                           class="side-menu-item">

                            <span>
                                Alumni
                            </span>

                        </a>

<a href="#"
   class="side-menu-item"
   onclick="document.getElementById('recommendForm').submit(); return false;">

    <span>Recommended SkillMates</span>

</a>

<form id="recommendForm"
      action="recommendedAlumniServlet"
      method="post"
      style="display:none;">

    <input type="hidden"
           name="batch"
           value="<%=request.getAttribute("batchNo")%>">

</form>


                        <a href="messageSenderListServlet"
                           class="side-menu-item">

                            <span>
                                Messages
                            </span>

                        </a>

<%
    String role = (String) session.getAttribute("role");
%>

<a href="<%= "alumni".equalsIgnoreCase(role) ? "alumniProfile" : "studentProfile" %>"
   class="side-menu-item">

    <span>My Profile</span>

</a>

                        <div class="menu-divider"></div>


                        <a href="settings.jsp"
                           class="side-menu-item">

                            <span>
                                Settings
                            </span>

                        </a>


                        <a href="logoutServlet"
                           class="side-menu-item logout">

                            <span>
                                Logout
                            </span>

                        </a>

                    </div>

                </div>

            </aside>


            <!-- ================= CENTER FEED ================= -->

            <section class="feed">


                <!-- CREATE POST -->

                <div class="glass-card create-post">

                    <h3>
                        What's happening?
                    </h3>

                    <form action="createPostServlet"
                          method="post">

                        <textarea
                            class="post-textarea"
                            name="content"
                            placeholder="Share an update with the alumni community..."
                            required></textarea>


                        <div class="post-options">

                            <select
                                class="post-type"
                                name="postType">

                                <option value="UPDATE">
                                    General Update
                                </option>

                                <option value="JOB">
                                    Job Opportunity
                                </option>

                                <option value="ACHIEVEMENT">
                                    Achievement
                                </option>

                                <option value="ANNOUNCEMENT">
                                    Announcement
                                </option>

                            </select>


                            <button
                                type="submit"
                                class="post-btn">

                                Post

                            </button>

                        </div>

                    </form>

                </div>


                <!-- ================= POST 1 ================= -->

                <div class="glass-card post">

                    <div class="post-header">

                        <div class="post-avatar">
                            R
                        </div>

                        <div class="post-user">

                            <h4>
                                Rahim Ahmed
                            </h4>

                            <span>
                                JUST CSE  Batch 2019
                                 2 hours ago
                            </span>

                        </div>

                    </div>


                    <div class="post-content">

                        <p>
                            Happy to share that I have joined
                            ABC Technologies as a Software Engineer.
                            Thanks to everyone from our alumni
                            community for their support!
                        </p>

                    </div>


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


                <!-- ================= POST 2 ================= -->

                <div class="glass-card post">

                    <div class="post-header">

                        <div class="post-avatar">
                            K
                        </div>

                        <div class="post-user">

                            <h4>
                                Karim Hasan
                            </h4>

                            <span>
                                JUST CSE Batch 2017
                                5 hours ago
                            </span>

                        </div>

                    </div>


                    <div class="post-content">

                        <p>
                            We are currently hiring Software
                            Engineers. Interested alumni and
                            students can apply below.
                        </p>


                        <div class="job-card">

                            <h3>
                                Software Engineer
                            </h3>

                            <p>
                                <strong>Company:</strong>
                                XYZ Technologies
                            </p>

                            <p>
                                <strong>Location:</strong>
                                Dhaka, Bangladesh
                            </p>

                            <p>
                                <strong>Experience:</strong>
                                Freshers / 0-2 years
                            </p>


                            <a href="#"
                               class="apply-btn">

                                Apply Now

                            </a>

                        </div>

                    </div>


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


                <!-- ================= POST 3 ================= -->

                <div class="glass-card post">

                    <div class="post-header">

                        <div class="post-avatar">
                            S
                        </div>

                        <div class="post-user">

                            <h4>
                                Sumi Akter
                            </h4>

                            <span>
                                JUST CSE Batch 2020
                                Yesterday
                            </span>

                        </div>

                    </div>


                    <div class="post-content">

                        <p>
                            Our alumni community keeps growing!
                            Looking forward to connecting with
                            more juniors and helping them build
                            their software engineering careers.
                        </p>

                    </div>


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
                                C++ ,CP
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


                <!-- LATEST JOBS -->

                <div class="glass-card right-card">

                    <h3>
                        Latest Jobs
                    </h3>


                    <div style="
                        padding:10px 0;
                        border-bottom:1px solid #eee;">

                        <strong>
                            Software Engineer
                        </strong>

                        <p style="
                            font-size:12px;
                            color:#777;
                            margin-top:5px;">

                            ABC Technologies

                        </p>

                    </div>


                    <div style="
                        padding:10px 0;">

                        <strong>
                            Junior Java Developer
                        </strong>

                        <p style="
                            font-size:12px;
                            color:#777;
                            margin-top:5px;">

                            XYZ Ltd.

                        </p>

                    </div>

                </div>


            </aside>


        </div>

    </main>


    <!-- ================= FOOTER ================= -->

</body>

<footer>
 2026 All Rights Reserved by <strong>tirtho_saha</strong>
</footer>

</html>