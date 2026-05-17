<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Find Alumni</title>

<style>
html, body {
	height: 100%;
	margin: 0;
	display: flex;
	flex-direction: column;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
	background: linear-gradient(135deg, #6a11cb, #2575fc);
}

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
	margin: 0;
	font-size: 22px;
	letter-spacing: 1px;
}

.main {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
}

.container {
	width: 100%;
	max-width: 750px;
	background: white;
	border-radius: 14px;
	padding: 30px;
	box-shadow: 0 12px 30px rgba(0,0,0,0.25);
	animation: fadeIn 0.5s ease-in-out;
}

@keyframes fadeIn {
	from {opacity: 0; transform: translateY(20px);}
	to {opacity: 1; transform: translateY(0);}
}

.container h2 {
	text-align: center;
	color: #6a11cb;
	margin-bottom: 5px;
}

.subtitle {
	text-align: center;
	font-size: 14px;
	color: #777;
	margin-bottom: 25px;
}

form {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 18px;
}

.full {
	grid-column: span 2;
}

/* INPUT GROUP */
.field {
	display: flex;
	flex-direction: column;
}

label {
	font-size: 13px;
	font-weight: 600;
	margin-bottom: 5px;
	color: #555;
}

input, select {
	padding: 11px;
	border-radius: 8px;
	border: 1px solid #ccc;
	font-size: 14px;
	transition: 0.3s;
}

input:focus, select:focus {
	border-color: #6a11cb;
	box-shadow: 0 0 8px rgba(106,17,203,0.3);
	outline: none;
}

.buttons {
	display: flex;
	gap: 12px;
	margin-top: 10px;
}

button {
	flex: 1;
	padding: 12px;
	border-radius: 8px;
	border: none;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
	transition: 0.3s;
}

.search {
	background: linear-gradient(135deg, #6a11cb, #2575fc);
	color: white;
}

.search:hover {
	opacity: 0.9;
}

.reset {
	background: #eee;
}

.reset:hover {
	background: #ddd;
}

footer {
	text-align: center;
	padding: 15px;
	background: rgba(0,0,0,0.25);
	color: white;
	font-size: 14px;
}
</style>
</head>

<body>

<header>
	<h1>Alumni Portal</h1>
</header>

<div class="main">
	<div class="container">
		<h2>Find Alumni</h2>
		<div class="subtitle">Search by any field or combine filters</div>

		<form action="searchAlumniServlet" method="post">

			<div class="field">
				<label>Name</label>
				<input type="text" name="name" placeholder="e.g. Rahim,Tirtho">
			</div>




			<div class="field">
				<label>Batch</label>
				<select name="batch">
					<option value="">Select Batch</option>
					<option>1</option><option>2</option><option>3</option>
					<option>4</option><option>5</option><option>6</option>
					<option>7</option><option>8</option><option>9</option>
					<option>10</option><option>11</option><option>12</option>
					<option>13</option><option>14</option><option>15</option>
					<option>16</option><option>17</option>
				</select>
			</div>




			<div class="field">
				<label>Skill</label>
				<input type="text" name="skill" placeholder="e.g. Java, React, Data Science">
			</div>


			<div class="field">
				<label>Company</label>
				<input type="text" name="company" placeholder="e.g. Google, Brain Station 23">
			</div>


			<div class="full buttons">
				<button type="submit" class="search">🔍 Search</button>
				<button type="reset" class="reset">Clear</button>
			</div>

		</form>
		
	</div>
</div>


<footer>
	© 2026 All Rights Reserved by <strong>tirtho_saha</strong>
</footer>

</body>
</html> 