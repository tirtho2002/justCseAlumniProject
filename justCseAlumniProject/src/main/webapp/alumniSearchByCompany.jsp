<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Search Alumni By Company</title>

	<style>
	
	    html, body {
    height: 100%;
    margin: 0;
}
	
		body {
			font-family: Arial, sans-serif;
			margin: 0;
			background: linear-gradient(135deg, #6a11cb, #2575fc);
			color: white;
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
		}

		nav {
			display: flex;
			gap: 20px;
		}

		nav a {
			color: white;
			text-decoration: none;
			font-weight: bold;
			transition: 0.3s;
		}

		nav a:hover {
			color: #ffda79;
		}

		.container {
			max-width: 700px;
			margin: 60px auto;
			background: white;
			color: #333;
			padding: 30px;
			border-radius: 12px;
			box-shadow: 0 8px 18px rgba(0, 0, 0, 0.2);
		}

		.container h2 {
			text-align: center;
			color: #6a11cb;
			margin-bottom: 20px;
		}

		form {
			display: flex;
			flex-direction: column;
			gap: 15px;
		}

		label {
			font-weight: bold;
			margin-bottom: 5px;
		}

		input[type="text"] {
			padding: 12px;
			border: 2px solid #6a11cb;
			border-radius: 6px;
			font-size: 16px;
			width: 100%;
			transition: 0.3s;
		}

		input[type="text"]:focus {
			outline: none;
			border-color: #2575fc;
			box-shadow: 0 0 12px rgba(37, 117, 252, 0.5);
		}

		button {
			padding: 12px;
			background: #6a11cb;
			color: white;
			border: none;
			border-radius: 6px;
			font-size: 16px;
			font-weight: bold;
			cursor: pointer;
			transition: 0.3s;
		}

		button:hover {
			background: #2575fc;
		}
	</style>
</head>

<body>

	<header>
		<h1>Alumni Portal</h1>
		
	</header>

	<div class="container">
		<h2>Search Alumni By Company</h2>

		<form action="companySearchServlet" method="post">

			<label for="companyName">Enter Company Name:</label>
			<input type="text" name="companyName" id="companyName"
				placeholder="Example: Google, Microsoft, Brain Station 23" required>

			<button type="submit">Search</button>

		</form>
	</div>

</body>
</html>