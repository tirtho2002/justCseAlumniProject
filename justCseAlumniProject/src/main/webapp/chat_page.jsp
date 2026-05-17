<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="justCseAlumniProject.Message" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chat | Alumni</title>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; }

body {
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    height: 100vh;
    display: flex;
    flex-direction: column;
    overflow: hidden;
}

/* HEADER */
header {
    background: rgba(255,255,255,0.12);
    backdrop-filter: blur(12px);
    border-bottom: 1px solid rgba(255,255,255,0.15);
    padding: 12px 24px;
    display: flex;
    align-items: center;
    gap: 12px;
    flex-shrink: 0;
}

.back-btn {
    color: white;
    text-decoration: none;
    font-size: 20px;
    opacity: 0.8;
}
.back-btn:hover { opacity: 1; }

.avatar {
    width: 38px; height: 38px;
    border-radius: 50%;
    background: rgba(255,255,255,0.2);
    border: 2px solid rgba(255,255,255,0.35);
    display: flex; align-items: center; justify-content: center;
    font-size: 16px; font-weight: 700; color: white;
}

.header-info h2   { font-size: 15px; color: #fff; }
.header-info span { font-size: 12px; color: rgba(255,255,255,0.6); }

/* CHAT BOX */
.chat-wrapper {
    flex: 1;
    display: flex;
    justify-content: center;
    padding: 16px 16px 0;
    overflow: hidden;
    min-height: 0;
}

.chat-box {
    background: #fff;
    border-radius: 16px 16px 0 0;
    width: 100%;
    max-width: 760px;
    display: flex;
    flex-direction: column;
    overflow: hidden;
    box-shadow: 0 -2px 20px rgba(0,0,0,0.12);
}

/* MESSAGES */
.messages-area {
    flex: 1;
    overflow-y: auto;
    padding: 20px 18px 10px;
    display: flex;
    flex-direction: column;
    gap: 5px;
}

.messages-area::-webkit-scrollbar { width: 4px; }
.messages-area::-webkit-scrollbar-thumb { background: #ddd; border-radius: 4px; }

.empty-state {
    flex: 1;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    color: #aaa;
    gap: 8px;
    font-size: 14px;
}
.empty-state .icon { font-size: 36px; }

/* DATE DIVIDER */
.date-divider {
    display: flex;
    align-items: center;
    gap: 8px;
    margin: 12px 0 6px;
    font-size: 11px;
    color: #aaa;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.05em;
}
.date-divider::before,
.date-divider::after {
    content: '';
    flex: 1;
    height: 1px;
    background: #eee;
}

/* BUBBLES */
.msg-row {
    display: flex;
    flex-direction: column;
    max-width: 65%;
}
.msg-row.sent  { align-self: flex-end;   align-items: flex-end; }
.msg-row.recv  { align-self: flex-start; align-items: flex-start; }

.bubble {
    padding: 9px 14px;
    border-radius: 16px;
    font-size: 14px;
    line-height: 1.5;
    word-break: break-word;
}

.recv .bubble {
    background: #f1f1f5;
    color: #222;
    border-bottom-left-radius: 4px;
}

.sent .bubble {
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    color: #fff;
    border-bottom-right-radius: 4px;
}

.msg-time {
    font-size: 10px;
    color: #bbb;
    margin-top: 3px;
    padding: 0 3px;
}

/* INPUT */
.input-area {
    display: flex;
    gap: 10px;
    align-items: center;
    padding: 12px 16px;
    border-top: 1px solid #f0f0f0;
    background: #fff;
    flex-shrink: 0;
}

.input-area input[type="text"] {
    flex: 1;
    padding: 10px 16px;
    border-radius: 24px;
    border: 1.5px solid #e0e0ee;
    font-size: 14px;
    font-family: Arial, sans-serif;
    color: #222;
    outline: none;
    background: #f8f8fc;
    transition: border-color .2s;
}
.input-area input[type="text"]:focus {
    border-color: #6a11cb;
    background: #fff;
}

.send-btn {
    width: 42px; height: 42px;
    border-radius: 50%;
    border: none;
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    color: white;
    font-size: 16px;
    cursor: pointer;
    display: flex; align-items: center; justify-content: center;
    flex-shrink: 0;
    transition: opacity .15s;
}
.send-btn:hover  { opacity: 0.88; }
.send-btn:active { opacity: 0.75; }

/* FOOTER */
footer {
    background: rgba(255,255,255,0.10);
    backdrop-filter: blur(8px);
    color: rgba(255,255,255,0.65);
    text-align: center;
    padding: 10px 0;
    font-size: 12px;
    flex-shrink: 0;
}
footer strong { color: #fff; }
</style>
</head>
<body>

<%
    List<Message> messages  = (List<Message>) request.getAttribute("messages");
	
	Integer threadId        = (Integer) request.getAttribute("threadId");
    Integer senderOrCurrentIdOfUser   = (Integer) request.getAttribute("senderOrCurrentIdOfUser");
    Integer idOfReceiver    = (Integer) request.getAttribute("idOfReceiver");
    String  nameOfReceiver    = (String)  request.getAttribute("nameOfReceiver");
    
    
    if (nameOfReceiver == null || nameOfReceiver.trim().isEmpty()) nameOfReceiver = "User";

    String avatarLetter = nameOfReceiver.substring(0, 1).toUpperCase();
    SimpleDateFormat timeFmt = new SimpleDateFormat("hh:mm a");
    SimpleDateFormat dateFmt = new SimpleDateFormat("dd MMM yyyy");
    String lastDate = "";
%>

<header>
    <a href="javascript:history.back()" class="back-btn">&#8592;</a>
    <div class="avatar"><%= avatarLetter %></div>
    <div class="header-info">
        <h2><%= nameOfReceiver %></h2>
    </div>
</header>

<div class="chat-wrapper">
    <div class="chat-box">

        <div class="messages-area" id="msgArea">
        <%
            if (messages != null && !messages.isEmpty()) {
                for (Message msg : messages) {
                    boolean isSent = msg.getSender_id() == senderOrCurrentIdOfUser;
                    String msgDate = dateFmt.format(msg.getSend_at());
                    if (!msgDate.equals(lastDate)) {
                        lastDate = msgDate;
        %>
            <div class="date-divider"><%= msgDate %></div>
        <%  } %>
            <div class="msg-row <%= isSent ? "sent" : "recv" %>">
                <div class="bubble"><%= msg.getMessage() %></div>
                <span class="msg-time"><%= timeFmt.format(msg.getSend_at()) %></span>
            </div>
        <%
                }
            } else {
        %>
            <div class="empty-state">
                <div class="icon">💬</div>
                <p>No messages yet. Say hello!</p>
            </div>
        <%  } %>
        </div>

        <form class="input-area" action="sendingMessageInsert" method="POST">
            <input type="hidden" name="idOfUser" value="<%= idOfReceiver %>">
            <input type="hidden" name="senderOrCurrentIdOfUser" value="<%= senderOrCurrentIdOfUser %>">
            <input type="hidden" name="nameOfReceiver" value="<%= nameOfReceiver %>">
            <input type="hidden" name="threadId" value="<%= threadId %>">
            
            <input type="text"   name="message"  placeholder="Type a message…" autocomplete="off" required>
            <button type="submit" class="send-btn" title="Send">&#9658;</button>
        </form>

    </div>
</div>

<footer>
    &copy; 2026 All Rights Reserved by <strong>tirtho_saha</strong>
</footer>

<script>
    const area = document.getElementById('msgArea');
    if (area) area.scrollTop = area.scrollHeight;

    const inp = document.querySelector('.input-area input[type="text"]');
    if (inp) inp.addEventListener('keydown', function(e) {
        if (e.key === 'Enter' && !e.shiftKey) {
            e.preventDefault();
            this.closest('form').submit();
        }
    });
</script>

</body>
</html>
