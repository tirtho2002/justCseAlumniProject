<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Project</title>

<style>

    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        background: white;
        width: 420px;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.2);
    }

    .container h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    label {
        font-weight: bold;
        font-size: 14px;
        display: block;
        margin-top: 12px;
    }

    input[type="text"],
    textarea {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border-radius: 8px;
        border: 1px solid #ccc;
        font-size: 14px;
        box-sizing: border-box;
        transition: 0.3s;
    }

    input[type="text"]:focus,
    textarea:focus {
        border-color: #2575fc;
        outline: none;
        box-shadow: 0 0 5px rgba(37,117,252,0.5);
    }

    textarea {
        resize: none;
        height: 80px;
    }

    .btn {
        width: 100%;
        margin-top: 20px;
        padding: 12px;
        background: #2575fc;
        border: none;
        color: white;
        font-size: 16px;
        font-weight: bold;
        border-radius: 8px;
        cursor: pointer;
        transition: 0.3s;
    }

    .btn:hover {
        background: #1b5edb;
    }

</style>

</head>
<body>

<div class="container">
    <h2>Add New Project</h2>

    <form action="addProjectServlet" method="post">

        <input type="hidden" name="user_id" value="<%= session.getAttribute("user_id") %>">

        <label>Project Title</label>
        <input type="text" name="title" required>

        <label>Description</label>
        <textarea name="description " required></textarea>

        <label>Technologies Used</label>
        <input type="text" name="technologies" required>

        <label>Project Link</label>
        <input type="text" name="project_link"required>

        <label>GitHub Link</label>
        <input type="text" name="github_link"required>

        <button type="submit" class="btn">Add Project</button>

    </form>
</div>

</body>
</html>