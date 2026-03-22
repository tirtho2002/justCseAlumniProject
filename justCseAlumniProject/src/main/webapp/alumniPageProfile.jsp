<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Profile (Template)</title>

<style>

/* RESET */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* BASE */
html, body {
	height: 100%;
	font-family: Arial, sans-serif;
	background: linear-gradient(135deg, #6a11cb, #2575fc);
}

/* FLEX STRUCTURE */
body {
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

/* HEADER */
header {
	background: rgba(255, 255, 255, 0.15);
	backdrop-filter: blur(10px);
	padding: 15px 40px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	color: white;
}

header h1 {
	font-size: 22px;
}

nav a {
	color: white;
	text-decoration: none;
	font-weight: bold;
	margin-left: 20px;
}

nav a:hover {
	color: #ffda79;
}

/* MAIN (IMPORTANT FOR FOOTER FIX) */
main {
	flex: 1;
}

/* PROFILE CARD (TOP ALIGNED) */
.profile-container {
	max-width: 900px;
	margin: 40px auto;
	background: white;
	border-radius: 12px;
	padding: 30px;
	box-shadow: 0 8px 18px rgba(0, 0, 0, 0.2);
}

/* PROFILE HEADER */
.profile-header {
	border-bottom: 2px solid #eee;
	padding-bottom: 20px;
	margin-bottom: 20px;
}

.profile-header h2 {
	color: #6a11cb;
}

/* INFO */
.profile-info p {
	font-size: 15px;
	margin: 6px 0;
}

/* SECTION */
.profile-section {
	margin-top: 25px;
}

.profile-section h3 {
	color: #2575fc;
	margin-bottom: 10px;
	border-left: 4px solid #2575fc;
	padding-left: 8px;
}

/* LIST */
.profile-section ul {
	list-style: none;
	padding: 0;
}

.profile-section ul li {
	background: #f9f9f9;
	margin: 8px 0;
	padding: 12px;
	border-radius: 8px;
}

/* TEXTAREA */
textarea {
	width: 100%;
	padding: 10px;
	border-radius: 8px;
	border: 1px solid #ccc;
	resize: vertical;
}

/* BUTTON */
.send-btn {
	background: #6a11cb;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 8px;
	cursor: pointer;
	font-weight: bold;
	margin-top: 10px;
}

.send-btn:hover {
	background: #2575fc;
}

/* MESSAGES */
.success-message {
	background-color: #e8f5e9;
	color: #2e7d32;
	padding: 12px;
	border-radius: 8px;
	margin-bottom: 20px;
}

.error-message {
	background-color: #ffebee;
	color: #c62828;
	padding: 12px;
	border-radius: 8px;
	margin-bottom: 20px;
}

/* BACK LINK */
.back-link {
	display: inline-block;
	margin-top: 20px;
	padding: 10px 20px;
	background-color: #6a11cb;
	color: white;
	text-decoration: none;
	border-radius: 8px;
}

/* FOOTER */
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

<header>
	<h1>Alumni Portal</h1>
	<nav>
		<a href="alumniSearchPage.html">Alumni</a>
	</nav>
</header>

<!-- MAIN WRAPPER -->
<main>

<div class="profile-container">

<%
if (request.getAttribute("error") != null) {
%>
<div class="error-message">
<%=request.getAttribute("error")%>
</div>
<%
}

if (request.getAttribute("message") != null) {
%>
<div class="success-message">
<%=request.getAttribute("message")%>
</div>
<%
}

if (request.getAttribute("name") != null) {
%>

<div class="profile-header">
	<h2><%=request.getAttribute("name")%></h2>
</div>


<div class="profile-info">
	<p><strong>Batch:</strong> <%=request.getAttribute("batchNo")%></p>
	<p><strong>Session:</strong> <%=request.getAttribute("session")%></p>
	<p><strong>Mobile:</strong> <%=request.getAttribute("mobileNo")%></p>
	<p><strong>Email:</strong> <%=request.getAttribute("email")%></p>
	
	<%if(request.getAttribute("role").equals("alumni")){%>
	<p><strong>Location:</strong> <%=request.getAttribute("location")%></p>
	<p><strong>Company:</strong> <%=request.getAttribute("company")%></p>
	<p><strong>Position:</strong> <%=request.getAttribute("position")%></p>
	
	<%} %>
		
		
	
	<p><strong>Role:</strong> <%=request.getAttribute("role") %></p>
		<p type="hidden"><strong >User ID:</strong> <%=request.getAttribute("idOfUser")%></p>
	
</div>

<!-- SKILLS -->
<div class="profile-section">
<h3>Skills</h3>
<ul>
<%
List<String> skills = (List<String>) request.getAttribute("skills");
if(skills != null && !skills.isEmpty()){
	for(String skill : skills){
%>
<li><%=skill%></li>
<%
	}
}else{
%>
<li>No skills added</li>
<%
}
%>
</ul>
</div>

<!-- PROJECTS -->
<div class="profile-section">
<h3>Projects</h3>

<%
List<Map<String,String>> projects =
(List<Map<String,String>>) request.getAttribute("projects");

if(projects != null && !projects.isEmpty()){
for(Map<String,String> project : projects){
%>

<p><strong>Title:</strong> <%=project.get("title")%></p>
<p><strong>Description:</strong> <%=project.get("description")%></p>
<p><strong>Technologies:</strong> <%=project.get("technologies")%></p>

<p><strong>Project Link:</strong>
<a href="<%=project.get("projectLink")%>" target="_blank">Open</a></p>

<p><strong>GitHub:</strong>
<a href="<%=project.get("githubLink")%>" target="_blank">View</a></p>

<hr>

<%
}
}else{
%>
<p>No projects available</p>
<%
}
%>

</div>

<!-- CV -->
<div class="profile-section">
<h3>CV</h3>
<a href="#">Download CV</a>
</div>

<!-- MESSAGE -->
<div class="profile-section">
<h3>Send Message</h3>

<form action="sendMessageServlet" method="POST">

<input type="hidden" name="receiverEmail"
value="<%=request.getAttribute("email")%>">
<input type="hidden" name="idOfUser"
value="<%=request.getAttribute("idOfUser")%>">
<input type="hidden" name="nameOfReceiver"
value="<%=request.getAttribute("name")%>">

<textarea name="message" rows="4"
placeholder="Write your message here..."></textarea>

<button class="send-btn" type="submit">
Send Message
</button>

</form>
</div>

<%
}else{
%>

<div class="success-message">
No profile data available. Please search for an alumni first.
</div>

<a href="alumniSearchPage.html" class="back-link">
← Back to Search
</a>

<% 
}
%>

</div>

</main>

<footer>
© 2026 All Rights Reserved by <strong>tirtho_saha</strong>
</footer>

</body>
</html>