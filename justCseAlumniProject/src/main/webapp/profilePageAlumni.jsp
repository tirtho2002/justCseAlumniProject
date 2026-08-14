<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0">

<title>Profile Page (Alumni)</title>

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
	margin: 0;
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

	color: #333;

	display: flex;
	flex-direction: column;
}


/* ================= HEADER ================= */

header {
	width: 100%;

	background: rgba(255, 255, 255, 0.15);

	backdrop-filter: blur(10px);
	-webkit-backdrop-filter: blur(10px);

	border-bottom:
		1px solid rgba(255, 255, 255, 0.2);

	padding: 15px 40px;

	display: flex;

	justify-content: space-between;

	align-items: center;

	color: white;

	position: sticky;

	top: 0;

	z-index: 1000;
}


header h1 {
	font-size: 22px;

	font-weight: bold;
}

header h1 a {
    color: white;
    text-decoration: none;
    font-size: 22px;
    font-weight: bold;
}

header h1 a:hover {
    color: #ffda79;
}


/* ================= NAVIGATION ================= */

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

	padding: 8px 10px;

	border-radius: 7px;

	transition: 0.3s;
}


nav a:hover {
	color: #ffda79;

	background: rgba(255, 255, 255, 0.12);
}


nav button {
	background: none;

	border: none;

	color: white;

	font-weight: bold;

	font-size: 16px;

	font-family: Arial, sans-serif;

	cursor: pointer;

	padding: 8px 10px;

	border-radius: 7px;

	transition: 0.3s;
}


nav button:hover {
	color: #ffda79;

	background: rgba(255, 255, 255, 0.12);
}


/* ================= MAIN ================= */

main {
	flex: 1;

	width: 100%;

	background: transparent;

	padding: 30px 20px;
}


/* ================= PROFILE CARD ================= */

.profile-container {
	max-width: 900px;

	margin: 10px auto 40px;

	background: rgba(255, 255, 255, 0.97);

	border-radius: 14px;

	padding: 30px;

	box-shadow:
		0 10px 30px rgba(0, 0, 0, 0.20);
}


/* ================= PROFILE HEADER ================= */

.profile-header {
	border-bottom: 2px solid #eee;

	padding-bottom: 20px;

	margin-bottom: 20px;
}


.profile-header h2 {
	color: #5b22bd;

	font-size: 24px;

	margin-bottom: 5px;
}


/* ================= PROFILE INFO ================= */

.profile-info {
	background: #f8f9fc;

	border: 1px solid #edf0f5;

	border-radius: 10px;

	padding: 15px;
}


.profile-info p {
	font-size: 15px;

	margin: 8px 0;

	line-height: 1.5;
}


.profile-info strong {
	color: #444;
}


/* ================= PROFILE SECTION ================= */

.profile-section {
	margin-top: 28px;
}


.profile-section h3 {
	color: #2575fc;

	margin-bottom: 12px;

	border-left:
		4px solid #2575fc;

	padding-left: 9px;

	font-size: 18px;
}


/* ================= LIST ================= */

.profile-section ul {
	list-style: none;

	padding: 0;
}


.profile-section ul li {
	background: #f8f9fc;

	margin: 8px 0;

	padding: 12px;

	border-radius: 8px;

	border:
		1px solid #edf0f5;

	line-height: 1.5;
}


/* ================= PROJECT ================= */

.profile-section li p {
	margin: 6px 0;
}


.profile-section li a {
	color: #2575fc;

	text-decoration: none;

	font-weight: 500;

	word-break: break-word;
}


.profile-section li a:hover {
	text-decoration: underline;
}


/* ================= ADD BUTTON ================= */

.add-btn {
	display: inline-block;

	padding: 10px 18px;

	background:
		linear-gradient(
			135deg,
			#6a11cb,
			#2575fc
		);

	color: white;

	border-radius: 8px;

	text-decoration: none;

	font-weight: bold;

	border: none;

	cursor: pointer;

	transition: 0.3s;
}


.add-btn:hover {
	background:
		linear-gradient(
			135deg,
			#2575fc,
			#6a11cb
		);

	transform: translateY(-1px);

	box-shadow:
		0 5px 12px rgba(37, 117, 252, 0.25);
}


/* ================= SELECT ================= */

select {
	color: #000;

	padding: 9px 10px;

	border-radius: 8px;

	border:
		1px solid #ccc;

	background: white;

	outline: none;

	font-family: Arial, sans-serif;
}


select:focus {
	border-color: #6a11cb;

	box-shadow:
		0 0 0 2px rgba(106, 17, 203, 0.08);
}


/* ================= SKILL FORM ================= */

.skill-form-row {
	display: flex;

	gap: 10px;

	align-items: center;

	margin-top: 12px;

	flex-wrap: wrap;
}


/* ================= CV ================= */

.profile-section .cv-link {
	display: inline-block;

	background: #f8f9fc;

	padding: 12px 15px;

	border-radius: 8px;

	border: 1px solid #edf0f5;

	color: #2575fc;

	text-decoration: none;

	font-weight: bold;
}


.profile-section .cv-link:hover {
	background: #f0f3ff;
}


/* ================= FOOTER ================= */

footer {
	width: 100%;

	background:
		rgba(0, 0, 0, 0.20);

	backdrop-filter: blur(8px);

	-webkit-backdrop-filter: blur(8px);

	border-top:
		1px solid rgba(255, 255, 255, 0.15);

	color: white;

	text-align: center;

	padding: 15px 0;

	font-size: 14px;

	margin-top: auto;
}


/* ================= RESPONSIVE ================= */

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

		gap: 5px;
	}


	nav a {
		margin-left: 0;

		padding: 7px 8px;

		font-size: 13px;
	}


	nav button {
		font-size: 13px;

		padding: 7px 8px;
	}


	main {
		padding: 20px 10px;
	}


	.profile-container {
		margin: 5px auto 25px;

		padding: 20px;

		border-radius: 12px;
	}


	.profile-header h2 {
		font-size: 21px;
	}


	.skill-form-row {
		flex-direction: column;

		align-items: stretch;
	}


	.skill-form-row select,
	.skill-form-row .add-btn {
		width: 100%;
	}


	footer {
		font-size: 13px;
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




		<form
			action="batchMateButtonServlet"
			method="GET"
			style="display:inline;">

			<input
				type="hidden"
				name="batch"
				value="<%=request.getAttribute("batchNo")%>">

			<button type="submit">
				Batch Mates
			</button>

		</form>

<a href="messageSenderListServlet">Messages</a>

	</nav>

</header>


<!-- ================= MAIN ================= -->

<main>


<div class="profile-container">


	<!-- ================= PROFILE HEADER ================= -->

	<div class="profile-header">

		<h2>
			<%=request.getAttribute("name")%>
		</h2>

	</div>


	<!-- ================= PROFILE INFO ================= -->

	<div class="profile-info">

		<p>
			<strong>Batch:</strong>
			<%=request.getAttribute("batch")%>
		</p>


		<p>
			<strong>Session:</strong>
			<%=request.getAttribute("session")%>
		</p>


		<p>
			<strong>Mobile:</strong>
			<%=request.getAttribute("mobile")%>
		</p>


		<p>
			<strong>Email:</strong>
			<%=request.getAttribute("email")%>
		</p>


		<p>
			<strong>Current Location:</strong>
			<%=request.getAttribute("location")%>
		</p>


		<p>
			<strong>Current Company:</strong>
			<%=request.getAttribute("company")%>
		</p>


		<p>
			<strong>Role:</strong>
			Alumni
		</p>

	</div>


	<!-- ================= SKILLS ================= -->

	<div class="profile-section">

		<h3>
			Skills
		</h3>


		<ul>

		<%
			List<String> skills =
				(List<String>) request.getAttribute("skills");

			if (skills != null && !skills.isEmpty()) {

				for (String skillName : skills) {
		%>

			<li>
				<%=skillName%>
			</li>

		<%
				}

			} else {
		%>

			<li>
				No skills added yet.
			</li>

		<%
			}
		%>

		</ul>


		<form
			action="addSkillServlet"
			method="post"
			class="skill-form-row">


			<select
				name="category"
				id="categorySelect"
				required>

				<option value="">
					Select Category
				</option>

				<option value="Programming Languages">
					Programming Languages
				</option>

				<option value="Communication Skills">
					Communication Skills
				</option>

				<option value="Database">
					Database
				</option>

				<option value="Academic">
					Academic
				</option>

				<option value="Competitive Programming">
					Competitive Programming
				</option>

			</select>


			<select
				name="skill"
				id="skillSelect"
				required>

				<option value="">
					Select Skill
				</option>

			</select>


			<button
				type="submit"
				class="add-btn">

				Add Skill

			</button>

		</form>

	</div>


	<!-- ================= PROJECTS ================= -->

	<div class="profile-section">

		<h3>
			Projects
		</h3>


		<%

			List<Map<String, String>> projects =
				(List<Map<String, String>>)
				request.getAttribute("projects");


			if (projects != null && !projects.isEmpty()) {

				for (int i = 0;
					 i < projects.size();
					 i++) {

					Map<String, String> project =
						projects.get(i);

		%>


		<ul>

			<li>

				<p>
					<strong>
						Project <%=(i + 1)%>
					</strong>
				</p>


				<p>
					<strong>
						Title:
					</strong>

					<%=project.get("title")%>
				</p>


				<p>
					<strong>
						Description:
					</strong>

					<%=project.get("description")%>
				</p>


				<p>
					<strong>
						Technologies:
					</strong>

					<%=project.get("technologies")%>
				</p>


				<p>

					<strong>
						Project Link:
					</strong>


					<a
						href="<%=project.get("projectLink")%>"
						target="_blank">

						<%=project.get("projectLink")%>

					</a>

				</p>


				<p>

					<strong>
						GitHub Link:
					</strong>


					<a
						href="<%=project.get("githubLink")%>"
						target="_blank">

						<%=project.get("githubLink")%>

					</a>

				</p>

			</li>

		</ul>


		<%
				}

			} else {
		%>


		<p>
			No projects added yet.
		</p>


		<%
			}
		%>


		<a
			href="addProject.jsp"
			class="add-btn"
			style="margin-top:12px;">

			Add Project

		</a>

	</div>


	<!-- ================= CV ================= -->

	<div class="profile-section">

		<h3>
			CV
		</h3>


		<ul>

			<li>

				<a
					href="#"
					class="cv-link">

					Download CV

				</a>

			</li>

		</ul>

	</div>


</div>

</main>


<!-- ================= FOOTER ================= -->

<footer>

	© 2026 All Rights Reserved by
	<strong>
		tirtho_saha
	</strong>

</footer>


<!-- ================= JAVASCRIPT ================= -->

<script>

const skills = {

	"Programming Languages":
		["Java", "C++", "Python", "JavaScript"],

	"Communication Skills":
		["Presentation", "Public Speaking", "Negotiation"],

	"Database":
		["MySQL", "PostgreSQL", "MongoDB"],

	"Academic":
		["Bachelor GPA", "Master GPA"],

	"Competitive Programming":
		["Codeforces", "LeetCode", "HackerRank"]

};


document.addEventListener(
	'DOMContentLoaded',
	function () {

		const categorySelect =
			document.getElementById(
				'categorySelect'
			);

		const skillSelect =
			document.getElementById(
				'skillSelect'
			);


		categorySelect.addEventListener(
			'change',
			function () {

				const selectedCategory =
					this.value;


				skillSelect.innerHTML =
					'<option value="">Select Skill</option>';


				if (skills[selectedCategory]) {

					skills[selectedCategory]
						.forEach(
							skill => {

								const option =
									document.createElement(
										'option'
									);

								option.value =
									skill;

								option.text =
									skill;

								skillSelect.appendChild(
									option
								);

							}
						);

				}

			}
		);

	}

);

</script>


</body>

</html>