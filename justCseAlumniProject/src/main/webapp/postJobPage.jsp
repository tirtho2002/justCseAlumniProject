<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String role = (String) session.getAttribute("role");

if (role == null || !"alumni".equals(role)) {
	response.sendRedirect("homepage.jsp");
	return;
}

String name = (String) session.getAttribute("name");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Post a Job</title>

<style>

/* RESET */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* BASE */
html {
	min-height: 100%;
	background: #6a11cb;
}

body {
	margin: 0;
	min-height: 100vh;
	font-family: Arial, sans-serif;
	background: linear-gradient(
		135deg,
		#6a11cb 0%,
		#5b3cc4 45%,
		#2575fc 100%
	);
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover;
	color: #333;
	display: flex;
	flex-direction: column;
}

/* FLEX STRUCTURE */
main {
	flex: 1;
}

/* HEADER */
header {
	background: rgba(0, 0, 0, 0.22);
	backdrop-filter: blur(8px);
	padding: 15px 40px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	color: white;
	box-shadow: 0 3px 12px rgba(0, 0, 0, 0.12);
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

/* JOB CONTAINER */
.job-container {
	max-width: 900px;
	margin: 40px auto;
	background: rgba(255, 255, 255, 0.98);
	border-radius: 12px;
	padding: 30px;
	box-shadow: 0 8px 22px rgba(0, 0, 0, 0.20);
}

/* JOB HEADER */
.job-header {
	border-bottom: 2px solid #eee;
	padding-bottom: 20px;
	margin-bottom: 25px;
}

.job-header h2 {
	color: #5b22bd;
	margin-bottom: 8px;
}

.job-header p {
	color: #666;
	font-size: 14px;
}

/* SECTION */
.job-section {
	margin-top: 25px;
}

.job-section h3 {
	color: #2868d8;
	margin-bottom: 10px;
	border-left: 4px solid #2868d8;
	padding-left: 8px;
}

/* FORM */
.form-group {
	margin-bottom: 18px;
}

.form-group label {
	display: block;
	font-weight: bold;
	font-size: 14px;
	margin-bottom: 7px;
}

.form-group input,
.form-group select,
.form-group textarea {
	width: 100%;
	padding: 11px;
	border-radius: 8px;
	border: 1px solid #ccc;
	font-size: 14px;
	outline: none;
}

.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus {
	border-color: #6a11cb;
	box-shadow: 0 0 0 2px rgba(106, 17, 203, 0.08);
}

.form-group textarea {
	min-height: 150px;
	resize: vertical;
}

/* TWO COLUMN */
.form-row {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px;
}

/* BUTTON */
.button-area {
	display: flex;
	gap: 10px;
	margin-top: 25px;
}

.post-btn {
	background: #6a11cb;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 8px;
	cursor: pointer;
	font-weight: bold;
	transition: 0.3s;
}

.post-btn:hover {
	background: #2575fc;
}

.cancel-btn {
	background: #777;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 8px;
	cursor: pointer;
	font-weight: bold;
	text-decoration: none;
	transition: 0.3s;
}

.cancel-btn:hover {
	background: #555;
}

/* MESSAGE */
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

/* FOOTER */
footer {
	text-align: center;
	padding: 15px;
	background: rgba(0, 0, 0, 0.25);
	color: white;
	font-size: 14px;
	backdrop-filter: blur(6px);
}

footer strong {
	color: white;
}

/* RESPONSIVE */
@media (max-width: 700px) {
	.job-container {
		margin: 25px 15px;
		padding: 20px;
	}

	.form-row {
		grid-template-columns: 1fr;
		gap: 0;
	}

	header {
		padding: 15px 20px;
	}
}

</style>

</head>

<body>

<header>
	<h1>Alumni Portal</h1>
</header>

<main>

<div class="job-container">

	<% if (request.getAttribute("error") != null) { %>
	<div class="error-message">
		<%=request.getAttribute("error")%>
	</div>
	<% } %>

	<% if (request.getAttribute("message") != null) { %>
	<div class="success-message">
		<%=request.getAttribute("message")%>
	</div>
	<% } %>

	<div class="job-header">
		<h2>Post a Job</h2>
		<p>Share a job opportunity with students and alumni through the Alumni Portal.</p>
	</div>

	<form action="postManagerServlet" method="POST">

		<input type="hidden" name="formType" value="job">

		<!-- JOB INFORMATION -->
		<div class="job-section">
			<h3>Job Information</h3>

			<div class="form-group">
				<label for="jobTitle">Job Title</label>
				<input type="text" id="jobTitle" name="jobTitle" placeholder="Enter the job title" required>
			</div>

			<div class="form-row">
				<div class="form-group">
					<label for="company">Company</label>
					<input type="text" id="company" name="company" placeholder="Enter company name" required>
				</div>

				<div class="form-group">
					<label for="location">Location</label>
					<input type="text" id="location" name="location" placeholder="e.g. Dhaka / Remote" required>
				</div>
			</div>

			<div class="form-row">
				<div class="form-group">
					<label for="jobType">Job Type</label>
					<select id="jobType" name="jobType" required>
						<option value="">Select job type</option>
						<option value="Full Time">Full Time</option>
						<option value="Part Time">Part Time</option>
						<option value="Internship">Internship</option>
						<option value="Contract">Contract</option>
					</select>
				</div>

				<div class="form-group">
					<label for="salary">Salary</label>
					<input type="text" id="salary" name="salary" placeholder="e.g. 30,000 - 50,000 BDT">
				</div>
			</div>
		</div>

		<!-- JOB DESCRIPTION -->
		<div class="job-section">
			<h3>Job Description</h3>

			<div class="form-group">
				<label for="jobDescription">Description</label>
				<textarea id="jobDescription" name="jobDescription" placeholder="Write the job responsibilities, requirements, qualifications and required skills..." required></textarea>
			</div>
		</div>

		<!-- APPLICATION -->
		<div class="job-section">
			<h3>Application Information</h3>

			<div class="form-group">
				<label for="applicationLink">Application Link / Email</label>
				<input type="text" id="applicationLink" name="applicationLink" placeholder="Enter application URL or email" required>
			</div>
		</div>

		<!-- BUTTONS -->
		<div class="button-area">
			<button type="submit" class="post-btn">Post Job</button>
			<a href="homepage.jsp" class="cancel-btn">Cancel</a>
		</div>

	</form>

</div>

</main>

<footer>
	© 2026 All Rights Reserved by <strong>tirtho_saha</strong>
</footer>

</body>

</html>