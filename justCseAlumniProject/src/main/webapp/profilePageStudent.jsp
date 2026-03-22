<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Profile Page (Student)</title>
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

nav {
	display: flex;
	gap: 20px;
	align-items: center;
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

nav button {
	background: none;
	border: none;
	color: white;
	font-weight: bold;
	font-size: 16px;
	font-family: Arial, sans-serif;
	cursor: pointer;
	transition: 0.3s;
}

nav button:hover {
	color: #ffda79;
}

/* MAIN (IMPORTANT FOR FOOTER FIX) */
main {
	flex: 1;
}

/* PROFILE CARD */
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
	font-size: 24px;
	margin-bottom: 10px;
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

/* ADD BUTTON */
.add-btn {
	display: inline-block;
	padding: 10px 18px;
	background: #6a11cb;
	color: white;
	border-radius: 8px;
	text-decoration: none;
	font-weight: bold;
	border: none;
	cursor: pointer;
	margin: 0;
}

.add-btn:hover {
	background: #2575fc;
}

/* SELECT */
select {
	color: #000;
	padding: 8px;
	border-radius: 8px;
	border: 1px solid #ccc;
}

/* AI BUTTON */
.ai-btn {
	background: linear-gradient(45deg, #ff6a00, #ee0979);
	border: none;
	color: white;
	padding: 10px 18px;
	border-radius: 30px;
	font-weight: bold;
	cursor: pointer;
	transition: all 0.3s ease;
	box-shadow: 0 4px 15px rgba(238, 9, 121, 0.4);
	position: relative;
	overflow: hidden;
}

.ai-btn:hover {
	transform: scale(1.08);
	box-shadow: 0 6px 20px rgba(238, 9, 121, 0.6);
}

.ai-btn::before {
	content: "";
	position: absolute;
	top: 0;
	left: -75%;
	width: 50%;
	height: 100%;
	background: rgba(255, 255, 255, 0.3);
	transform: skewX(-25deg);
	transition: 0.5s;
}

.ai-btn:hover::before {
	left: 130%;
}

/* SKILL FORM ROW */
.skill-form-row {
	display: flex;
	gap: 10px;
	align-items: center;
	margin-top: 10px;
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

		<form action="recommendedAlumniServlet" method="post" style="display:inline;">
			<button type="submit" class="ai-btn">Recommend SkillMates</button>
		</form>

		<a href="alumniSearchPage.html">Alumni</a>
<a href="messageSenderListServlet">Messages</a>


		<form action="batchMateButtonServlet" method="GET" style="display:inline;">
			<input type="hidden" name="batch" value="<%=request.getAttribute("batchNo")%>">
			<button type="submit">Batch Mates</button>
		</form>

		<a href="alumniSearchByCompany.jsp">Companies</a>

	</nav>
</header>

<!-- MAIN WRAPPER -->
<main>

<div class="profile-container">

	<!-- PROFILE HEADER -->
	<div class="profile-header">
		<h2><%=request.getAttribute("name")%></h2>
	</div>

	<!-- PROFILE INFO -->
	<div class="profile-info">
		<p><strong>Batch:</strong> <%=request.getAttribute("batch")%></p>
		<p><strong>Session:</strong> <%=request.getAttribute("session")%></p>
		<p><strong>Roll:</strong> <%=request.getAttribute("roll")%></p>
		<p><strong>Reg:</strong> <%=request.getAttribute("reg")%></p>
		<p><strong>Mobile:</strong> <%=request.getAttribute("mobile")%></p>
		<p><strong>Email:</strong> <%=request.getAttribute("email")%></p>
		<p><strong>Role:</strong> Student</p>
	</div>

	<!-- SKILLS -->
	<div class="profile-section">
		<h3>Skills</h3>
		<ul>
		<%
			List<String> skills = (List<String>) request.getAttribute("skills");
			if (skills != null && !skills.isEmpty()) {
				for (String skillName : skills) {
		%>
			<li><%= skillName %></li>
		<%
				}
			} else {
		%>
			<li>No skills added yet.</li>
		<%
			}
		%>
		</ul>

		<form action="addSkillServlet" method="post" class="skill-form-row">
			<select name="category" id="categorySelect" required>
				<option value="">Select Category</option>
				<option value="Programming Languages">Programming Languages</option>
				<option value="Communication Skills">Communication Skills</option>
				<option value="Database">Database</option>
				<option value="Academic">Academic</option>
				<option value="Competitive Programming">Competitive Programming</option>
			</select>

			<select name="skill" id="skillSelect" required>
				<option value="">Select Skill</option>
			</select>

			<button type="submit" class="add-btn">Add Skill</button>
		</form>
	</div>

	<!-- PROJECTS -->
	<div class="profile-section">
		<h3>Projects</h3>

		<%
			List<Map<String, String>> projects = (List<Map<String, String>>) request.getAttribute("projects");
			if (projects != null && !projects.isEmpty()) {
				for (int i = 0; i < projects.size(); i++) {
					Map<String, String> project = projects.get(i);
		%>
		<ul>
			<li>
				<p><strong>Project <%=(i + 1)%></strong></p>
				<p><strong>Title:</strong> <%=project.get("title")%></p>
				<p><strong>Description:</strong> <%=project.get("description")%></p>
				<p><strong>Technologies:</strong> <%=project.get("technologies")%></p>
				<p><strong>Project Link:</strong>
					<a href="<%=project.get("projectLink")%>" target="_blank"><%=project.get("projectLink")%></a>
				</p>
				<p><strong>GitHub Link:</strong>
					<a href="<%=project.get("githubLink")%>" target="_blank"><%=project.get("githubLink")%></a>
				</p>
			</li>
		</ul>
		<%
				}
			} else {
		%>
		<p>No projects available.</p>
		<%
			}
		%>

		<a href="addProject.jsp" class="add-btn" style="margin-top: 12px; display: inline-block;">Add Project</a>
	</div>

	<!-- CV -->
	<div class="profile-section">
		<h3>CV</h3>
		<ul>
			<li><a href="#">Download CV(But it is not working)</a></li>
		</ul>
	</div>

</div>

</main>

<footer>
	© 2026 All Rights Reserved by <strong>tirtho_saha</strong>
</footer>

<script>
const skills = {
	"Programming Languages": ["Java", "C++", "Python", "JavaScript", "C#", "Ruby", "Go", "Swift", "kotlin", "PHP"],
	"Communication Skills": ["Presentation", "Public Speaking", "Negotiation"],
	"Database": ["MySQL", "PostgreSQL", "MongoDB"],
	"Academic": ["Bachelor GPA", "Master GPA"],
	"Competitive Programming": ["Codeforces", "LeetCode", "HackerRank", "AtCoder", "TopCoder"]
};

document.addEventListener('DOMContentLoaded', function () {
	const categorySelect = document.getElementById('categorySelect');
	const skillSelect = document.getElementById('skillSelect');

	categorySelect.addEventListener('change', function () {
		const selectedCategory = this.value;
		skillSelect.innerHTML = '<option value="">Select Skill</option>';
		if (skills[selectedCategory]) {
			skills[selectedCategory].forEach(skill => {
				const option = document.createElement('option');
				option.value = skill;
				option.text = skill;
				skillSelect.appendChild(option);
			});
		}
	});
});
</script>

</body>
</html>
