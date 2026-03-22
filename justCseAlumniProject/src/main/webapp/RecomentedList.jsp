<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Recommended Alumni</title>

    <style>
       body {
    font-family: Arial, sans-serif;
    margin: 0;
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    color: #333;
}

html, body {
    height: 100%;
    margin: 0;
}

        .container {
            width: 80%;
            margin: 40px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            color: #2a5298;
        }

        .card {
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            transition: 0.3s;
        }

        .card:hover {
            transform: scale(1.02);
            box-shadow: 0 6px 15px rgba(0,0,0,0.15);
        }

        .name {
            font-size: 20px;
            font-weight: bold;
            color: #1e3c72;
        }

        .match {
            color: green;
            margin-top: 5px;
        }

        .btn {
            display: inline-block;
            margin-top: 10px;
            padding: 8px 15px;
            background-color: #2a5298;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .btn:hover {
            background-color: #1e3c72;
        }

        .no-data {
            text-align: center;
            color: red;
            font-weight: bold;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Recommended Alumni Based on Your Skills</h2>

    <%
        List<Map<String, Object>> list =
            (List<Map<String, Object>>) request.getAttribute("recommendedList");

        if(list != null && !list.isEmpty()) {

            for(Map<String, Object> alumni : list) {
    %>

        <div class="card">
            <div class="name">
                <%= alumni.get("name") %>
            </div>

           <!--   <div class="match">
                Matched Skills: <%= alumni.get("matchCount") %>
            </div>
-->
            <a class="btn"
   href="viewAlumniProfileServlet?id=<%= alumni.get("userId") %>">
   View Profile
</a>
        </div>

    <%
            }

        } else {
    %>

        <div class="no-data">
            No matching alumni found.
        </div>

    <%
        }
    %>
    
    

</div>

</body>

</html>