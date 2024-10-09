<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Investment</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f0f2f5; /* Light background color */
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height */
            margin: 0;
        }
        .container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            padding: 30px;
            width: 400px; /* Fixed width for the form */
        }
        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }
        .form-label {
            color: #555; /* Darker color for labels */
        }
        .form-control {
            border-radius: 10px;
            border: 1px solid #007bff; /* Border color */
            transition: border-color 0.3s;
        }
        .form-control:focus {
            border-color: #0056b3; /* Darker border on focus */
            box-shadow: 0 0 5px rgba(0, 91, 182, 0.5); /* Shadow on focus */
        }
        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
            transition: background-color 0.3s, border-color 0.3s;
        }
        .btn-success:hover {
            background-color: #218838; /* Darker green on hover */
            border-color: #1e7e34; /* Darker border on hover */
        }
        .readonly {
            background-color: #e9ecef; /* Light gray for readonly fields */
            border: 1px solid #ced4da; /* Gray border for readonly fields */
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Update Investment</h2>
        <form action="UpdateServlet" method="post">
            <div class="mb-3">
                <label for="slno" class="form-label">Sl No</label>
                <input type="text" id="slno" name="slno" class="form-control readonly" value="<%= request.getParameter("slno") %>" readonly>
            </div>
            <div class="mb-3">
                <label for="investmentType" class="form-label">Investment Type</label>
                <input type="text" id="investmentType" name="investmentType" class="form-control readonly" value="<%= request.getParameter("investmentType") %>" readonly>
            </div>
            <div class="mb-3">
                <label for="category" class="form-label">Category</label>
                <input type="text" id="category" name="category" class="form-control" value="<%= request.getParameter("category") %>">
            </div>
            <div class="mb-3">
                <label for="amount" class="form-label">Amount</label>
                <input type="text" id="amount" name="amount" class="form-control readonly" value="<%= request.getParameter("amount") %>" readonly>
            </div>
            <div class="mb-3">
                <label for="time" class="form-label">Time</label>
                <input type="text" id="time" name="time" class="form-control readonly" value="<%= request.getParameter("time") %>" readonly>
            </div>
            <button type="submit" class="btn btn-success">Save Changes</button>
        </form>
    </div>
</body>
</html>
