<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Deletion</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f0f2f5;
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            padding: 30px;
            width: 400px;
        }
        h2 {
            text-align: center;
            color: #dc3545;
            margin-bottom: 20px;
        }
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Confirm Deletion</h2>
        <p>Are you sure you want to delete the following investment?</p>
        <ul>
            <li><strong>Sl No:</strong> <%= request.getParameter("slno") %></li>
            <li><strong>Investment Type:</strong> <%= request.getParameter("investmentType") %></li>
            <li><strong>Category:</strong> <%= request.getParameter("category") %></li>
            <li><strong>Amount:</strong> <%= request.getParameter("amount") %></li>
            <li><strong>Time:</strong> <%= request.getParameter("time") %></li>
        </ul>
        
        <form action="DeleteServlet" method="post">
            <input type="hidden" name="slno" value="<%= request.getParameter("slno") %>">
            <button type="submit" class="btn btn-danger">Delete</button>
            <a href="deleteInvestment.jsp" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>
