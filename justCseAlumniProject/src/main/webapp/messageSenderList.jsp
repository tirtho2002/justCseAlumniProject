<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Map.Entry" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Messages</title>

<style>

    html, body {
        height: 100%;
        margin: 0;
    }

    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        color: #333;
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }

    .container {
        width: 90%;
        max-width: 900px;
        margin: 50px auto;
        background: white;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        flex: 1;
    }

    h2 {
        text-align: center;
        color: #2a5298;
        margin-bottom: 30px;
    }

    .message-list {
        list-style: none;
        padding: 0;
    }

    .message-list li {
        margin-bottom: 15px;
    }

    .message-card {
        display: block;
        padding: 15px 20px;
        background: #f4f7ff;
        border-radius: 10px;
        text-decoration: none;
        color: #333;
        font-size: 18px;
        font-weight: 500;
        transition: all 0.3s ease;
        border-left: 5px solid #2a5298;
    }

    .message-card:hover {
        background: #2a5298;
        color: white;
        transform: translateX(5px);
        box-shadow: 0 5px 15px rgba(0,0,0,0.2);
    }

    .no-data {
        text-align: center;
        color: #888;
        font-size: 18px;
    }

    footer {
        background: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(8px);
        color: white;
        text-align: center;
        padding: 15px 0;
        font-size: 14px;
    }

</style>
</head>
<body>

<div class="container">

<%
    HashMap<Integer, String> senderList =
        (HashMap<Integer, String>) request.getAttribute("senderList");
%>

<h2>&#128172; Message Inbox</h2>

<ul class="message-list">
<%
    if (senderList != null && !senderList.isEmpty()) {
        for (Map.Entry<Integer, String> entry : senderList.entrySet()) {
%>
    <li>
        <a class="message-card"
           href="FetchMessageToTheProfileServlet?receiver_id=<%= entry.getKey() %>">
           &#128100; <%= entry.getValue() %>
        </a>
    </li>
<%
        }
    } else {
%>
    <li class="no-data">No Messages Found</li>
<%
    }
%>
</ul>

</div>

<footer>
  &copy; 2026 All Rights Reserved by <strong>tirtho_saha</strong>
</footer>

</body>
</html>
