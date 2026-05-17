<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="justCseAlumniProject.MessageList" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>connections</title>
<style>
/* RESET */
* { margin: 0; padding: 0; box-sizing: border-box; }

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

/* HEADER */
header {
    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(12px);
    border-bottom: 1px solid rgba(255,255,255,0.2);
    padding: 16px 24px;
    display: flex;
    align-items: center;
    gap: 14px;
    flex-shrink: 0;
}

.back-btn {
    color: white;
    text-decoration: none;
    font-size: 22px;
    font-weight: 600;
    opacity: 0.85;
    transition: opacity 0.2s;
}
.back-btn:hover { opacity: 1; }

header h2 {
    font-size: 18px;
    color: #fff;
    font-weight: 700;
}

/* MAIN CONTENT */
.main-wrapper {
    flex: 1;
    display: flex;
    justify-content: center;
    padding: 30px 16px;
}

.list-box {
    background: #fff;
    border-radius: 16px;
    width: 100%;
    max-width: 640px;
    overflow: hidden;
    box-shadow: 0 6px 28px rgba(0,0,0,0.15);
}

/* TITLE */
.list-title {
    padding: 18px 24px;
    font-size: 13px;
    font-weight: 700;
    color: #888;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    border-bottom: 1px solid #eee;
}

/* CONTACT ITEM */
.contact-item {
    display: flex;
    align-items: center;
    gap: 16px;
    padding: 16px 24px;
    text-decoration: none;
    border-bottom: 1px solid #f0f0f0;
    transition: background 0.2s;
}
.contact-item:last-child { border-bottom: none; }
.contact-item:hover { background: #f4f4ff; }

.avatar {
    width: 48px; height: 48px;
    border-radius: 100%;
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    display: flex; align-items: center; justify-content: center;
    font-size: 18px; font-weight: 700; color: white;
    flex-shrink: 0;
}

.contact-info { flex: 1; }
.contact-info .name { padding:0 50px;font-size: 15px; font-weight: 600; color: #222; }
.contact-info .sub  { font-size: 12px; color: #aaa; margin-top: 2px; }

.arrow { font-size: 18px; color: #bbb; transition: color 0.2s; }
.contact-item:hover .arrow { color: #888; }

/* EMPTY STATE */
.empty-state {
    padding: 60px 20px;
    text-align: center;
    color: #bbb;
}
.empty-state .icon { font-size: 48px; margin-bottom: 12px; }
.empty-state p { font-size: 14px; }

/* FOOTER */
footer {
    background: rgba(255,255,255,0.12);
    backdrop-filter: blur(8px);
    color: rgba(255,255,255,0.7);
    text-align: center;
    padding: 12px 0;
    font-size: 12px;
}
footer strong { color: #fff; }
</style>
</head>
<body>

<%
    List<MessageList> connectionList = (List<MessageList>) request.getAttribute("connectionList");
%>

<header>
    <a href="javascript:history.back()" class="back-btn">&#8592;</a>
    <h2>Messages</h2>
</header>

<div class="main-wrapper">
    <div class="list-box">
        <div class="list-title">Connections</div>

        <% if (connectionList != null && !connectionList.isEmpty()) {
               for (MessageList conn : connectionList) {
                   String avatarLetter = conn.getReceiver_name().substring(0, 1).toUpperCase();
        %>
        <form action="connectionListIntermediateServlet" method="post" class="contact-item">
    
    <input type="hidden" name="threadId" value="<%= conn.getThread_id() %>">
    <input type="hidden" name="nameOfReceiver" value="<%= conn.getReceiver_name() %>">
    <input type="hidden" name="senderOrCurrentIdOfUser" value="<%= conn.getSender_id() %>">
    <input type="hidden" name="idOfReceiver" value="<%= conn.getReceiver_id() %>">

    <button type="submit" style="all: unset; cursor: pointer; display: flex; width: 100%; align-items: center;">
        <div class="avatar"><%= avatarLetter %></div>
        <div class="contact-info">
            <div class="name"><%= conn.getReceiver_name() %></div>
        </div>
        <span class="arrow">&#8250;</span>
    </button>

</form>
        <%
               }
           } else {
        %>
        <div class="empty-state">
            <div class="icon">💬</div>
            <p>No conversations yet.</p>
        </div>
        <% } %>

    </div>
</div>

<footer>
    &copy; 2026 All Rights Reserved by <strong>tirtho_saha</strong>
</footer>

</body>
</html>